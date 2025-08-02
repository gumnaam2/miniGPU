library ieee;
use ieee.std_logic_1164.all;

entity fetcher is port(
	clock, reset, mem_read_ready	: in std_logic;
	core_state			: in std_logic_vector(2 downto 0);
	current_pc			: in std_logic_vector(7 downto 0);
	mem_read_data		: in std_logic_vector(15 downto 0);
	
	mem_read_address	: out std_logic_vector(7 downto 0);
	instruction			: out std_logic_vector(15 downto 0);
	mem_read_valid		: out std_logic;
	
	fetcher_state		: buffer std_logic_vector(2 downto 0)
	);
end fetcher;

architecture fsm of fetcher is
	constant IDLE : std_logic_vector(2 downto 0) := "000";
	constant FETCHING : std_logic_vector(2 downto 0) := "001";
	constant FETCHED : std_logic_vector(2 downto 0) := "010";
	
	-- definitions from scheduler
	constant FETCH : std_logic_vector(2 downto 0) := "001";
	constant DECODE : std_logic_vector(2 downto 0) := "010";
begin
process(clock) begin
	if rising_edge(clock) then
		if reset = '1' then
			fetcher_state <= IDLE;
			mem_read_address <= (others => '0');
			instruction <= (others => '0');
			mem_read_valid <= '0';
		else
			if fetcher_state = IDLE then
				if core_state = FETCH then
					fetcher_state <= FETCHING;
					mem_read_address <= current_pc;
					mem_read_valid <= '1'; -- request address data from memory, signal we are ready to read
				end if;
			elsif fetcher_state = FETCHING then
				if mem_read_ready = '1' then
					instruction <=  mem_read_data;
					mem_read_valid <= '0';
					fetcher_state <= FETCHED;
				end if;
			elsif fetcher_state = FETCHED then
				if core_state = DECODE then --once the scheduler has registered
					fetcher_state <= IDLE;
				end if;
			end if;
		end if;
	end if;
end process;

end fsm;