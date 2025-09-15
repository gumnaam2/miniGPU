library ieee;
use ieee.std_logic_1164.all;
use work.types.all;

entity mem_controller is
generic( --2 instances of these will be made,
	-- 1 for handling program memory and 1 for data mem
	-- the two are identical except for some constants defined here
	addr_bits : integer range 1 to 16 := 8;
	data_bits : integer range 8 to 16 := 8; --8 for data memory, 16 for program memory
	num_consumers : integer range 2 to 8 := 8; --number of max possible simultaneous requests, 2 for prog mem
	--(each core has 1 fetcher) 8 for data mem, each thread's LSU can send memory i/o requests
	num_channels : integer range 1 to 4 := 4; --number of i/o channels the memory has, 1 for prog, 4 for data
	write_enable : std_logic := '1'--whether mem can be written to, 0 for prog mem, 1 for dat	
);


port(

	clock, reset : in std_logic;
	consumer_read_valid : in std_logic_vector(num_consumers - 1 downto 0);
	consumer_read_address : in std_logic_vector(num_consumers*addr_bits - 1 downto 0);
	consumer_write_valid : in std_logic_vector(num_consumers - 1 downto 0) := (others => '0');
	consumer_write_address : in std_logic_vector(addr_bits*num_consumers - 1 downto 0) := (others => '0');
	consumer_write_data : in std_logic_vector(data_bits*num_consumers - 1 downto 0) := (others => '0');
	mem_read_ready : in std_logic_vector(num_channels - 1 downto 0); --signal that data is here
	mem_write_ready : in std_logic_vector(num_channels - 1 downto 0) := (others => '0');
	mem_read_data : in std_logic_vector(data_bits*num_channels - 1 downto 0);
	
	consumer_read_ready : out std_logic_vector(num_consumers - 1 downto 0);
	consumer_read_data : out std_logic_vector(data_bits*num_consumers - 1 downto 0);
	consumer_write_ready : out std_logic_vector(num_consumers - 1 downto 0) := (others => '0');
	mem_read_valid : out std_logic_vector(num_channels - 1 downto 0); --signal to memory that we are ready to read
	mem_read_address : out std_logic_vector(addr_bits*num_channels - 1 downto 0);
	mem_write_valid : out std_logic_vector(num_channels - 1 downto 0) := (others => '0');
	mem_write_address : out std_logic_vector(addr_bits*num_channels - 1 downto 0) := (others => '0');
	mem_write_data : out std_logic_vector(data_bits*num_channels - 1 downto 0) := (others => '0')
);
end mem_controller;

architecture fsm of mem_controller is
	signal controller_state : vector_arr(0 to num_channels-1)(2 downto 0);
	type int_arr is array(0 to num_channels - 1) of integer range 0 to num_consumers - 1;
	signal current_consumer : int_arr;
	
	signal channel_serving_consumer : std_logic_vector(num_consumers - 1 downto 0);
	signal loop_cont : std_logic := '1';
	
	constant idle : std_logic_vector(2 downto 0) := "000";
	constant write_waiting : std_logic_vector(2 downto 0) := "001";
	constant read_waiting : std_logic_vector(2 downto 0) := "010";
	constant write_relaying : std_logic_vector(2 downto 0) := "011";
	constant read_relaying : std_logic_vector(2 downto 0) := "100";
begin
process(clock)
variable idx : integer range 0 to num_consumers-1;
begin
if rising_edge(clock) then
	if reset = '1' then
		consumer_read_ready <= (others => '0');
		consumer_read_data <= (others => '0');
		consumer_write_ready <= (others => '0');
		mem_read_valid <= (others => '0');
		mem_read_address <= (others => '0');
		mem_write_valid <= (others => '0');
		mem_write_address <= (others => '0');
		mem_write_data <= (others => '0');
		controller_state <= (others => (others => '0'));
		current_consumer <= (others => 0);
		channel_serving_consumer <= (others => '0');
	else
		for i in 0 to num_channels - 1 loop
			loop_cont <= '1';
			if controller_state(i) = idle then
				for j in 0 to num_consumers - 1 loop
					if consumer_read_valid(j) = '1' and channel_serving_consumer(j) = '0' and loop_cont = '1' then
						channel_serving_consumer(j) <= '1';
						current_consumer(i) <= j;
						mem_read_valid(i) <= '1';
						mem_read_address((i+1)*addr_bits-1 downto i*addr_bits) <= consumer_read_address(addr_bits*(j+1) - 1 downto addr_bits*j);
						controller_state(i) <= read_waiting;
						loop_cont <= '0';
					elsif consumer_write_valid(j) = '1' and channel_serving_consumer(j) = '0' and loop_cont = '1' then
						channel_serving_consumer(j) <= '1';
						current_consumer(i) <= j;
						mem_write_valid(i) <= '1';
						mem_write_address((i+1)*addr_bits-1 downto i*addr_bits) <= consumer_write_address((j+1)*addr_bits - 1 downto j*addr_bits);
						mem_write_data((i+1)*data_bits-1 downto i*data_bits) <= consumer_write_data((j+1)*data_bits-1 downto j*data_bits);
						controller_state(i) <= write_waiting;
						loop_cont <= '0';
					end if;
				end loop;
			elsif controller_state(i) = read_waiting then
				if mem_read_ready(i) = '1' then
					mem_read_valid(i) <= '0';
					idx := data_bits*current_consumer(i); --for some reason this cannot be done implicitly inside the indexing of the vector_arr
					--Quartus crashes if I do so
					consumer_read_ready(current_consumer(i)) <= '1';
					consumer_read_data(data_bits+idx-1 downto idx) <= mem_read_data((i+1)*data_bits - 1 downto i*data_bits);
					controller_state(i) <= read_relaying;
				end if;
			elsif controller_state(i) = write_waiting then
				if mem_write_ready(i) = '1' then
					mem_write_valid(i) <= '0';
					consumer_write_ready(current_consumer(i)) <= '1';
					controller_state(i) <= write_relaying;
				end if;
			elsif controller_state(i) = read_relaying then
				if consumer_read_valid(current_consumer(i)) = '0' then
					channel_serving_consumer(current_consumer(i)) <= '0';
					consumer_read_ready(current_consumer(i)) <= '0';
					controller_state(i) <= idle;
				end if;
			elsif controller_state(i) = write_relaying then
				if consumer_write_valid(current_consumer(i)) = '0' then
					channel_serving_consumer(current_consumer(i)) <= '0';
					consumer_write_ready(current_consumer(i)) <= '0';
					controller_state(i) <= idle;
				end if;
			end if;
		end loop;
	end if;
end if;
end process;
end fsm;