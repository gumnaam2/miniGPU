library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.types.all;

entity mem_controller_2 is
generic(
	data_bits : integer := 8;
	addr_bits : integer := 8;
	n_channels : integer := 1;
	n_consumers : integer := 8
	);
port(
	reset, clock : in std_logic;
	--signals from consumers
	consumer_read_addr : in std_logic_vector(n_consumers*addr_bits - 1 downto 0);
	consumer_read_req : in std_logic_vector(n_consumers - 1 downto 0);
	consumer_write_addr : in std_logic_vector(n_consumers*addr_bits - 1 downto 0);
	consumer_write_data : in std_logic_vector(n_consumers*data_bits - 1 downto 0);
	consumer_write_req : in std_logic_vector(n_consumers - 1 downto 0);
	--signals to memory
	mem_read_addr : out std_logic_vector(n_channels*addr_bits - 1 downto 0);
	mem_write_addr : out std_logic_vector(n_channels*addr_bits - 1 downto 0);
	mem_write_en : out std_logic_vector(n_channels - 1 downto 0);
	mem_write_data : out std_logic_vector(n_channels*data_bits - 1 downto 0);
	--signals from memory
	mem_read_data : in std_logic_vector(n_channels*data_bits - 1 downto 0);
	--signals to consumers
	consumer_read_done : out std_logic_vector(n_consumers - 1 downto 0);
	consumer_write_done : out std_logic_vector(n_consumers - 1 downto 0);
	consumer_read_data : out std_logic_vector(n_consumers*data_bits - 1 downto 0)
);
end mem_controller_2;

architecture arch of mem_controller_2 is	
	--register that holds values of ids requesting r/w ops
	type id_shift_reg is array(0 to n_consumers - 1) of integer range 0 to n_consumers-1;
	signal consumer_ids, next_consumer_ids : id_shift_reg;
	--read/write_enable signals by consumers
	signal consumer_wens, next_wens : std_logic_vector(n_consumers - 1 downto 0);
	signal consumer_rens, next_rens : std_logic_vector(n_consumers - 1 downto 0);
	
	--completed requests - to be signalled done on next edge
	type req_arr is array(0 to n_channels - 1) of integer range 0 to n_consumers - 1;
	
	signal completed_requests, next_completed_requests: req_arr; 
	--signal done_requests, next_done_requests : req_arr; --to be signalled "done"
	signal n_completed : integer range 0 to n_channels := 0; -- number of completed requests waiting to be returned to consumer
	signal n_filled_reg, next_n_filled : integer range 0 to n_consumers := 0;
	--whether completed signals were write or not
	signal completed_wen, completed_ren : std_logic_vector(n_channels - 1 downto 0);
begin

assign_regs : process(clock) begin
if rising_edge(clock) then
--	if reset = '1' then
--		consumer_ids <= (others => 0);
--		completed_requests <= (others => 0);
--		consumer_wens <= (others => '0');
--		consumer_rens <= (others => '0');
--		n_filled_reg <= 0;
--	else
--		consumer_ids <= next_consumer_ids;
--		completed_requests <= next_completed_requests;
--		consumer_wens <= next_wens;
--		n_filled_reg <= next_n_filled;
--		consumer_rens <= next_rens;
--	end if;
end if;
end process;

--block reads write req, read req inputs
--updates buffer of pending requests
--updates buffer of completed requests
--maintains signal of number of completed requests, buffered requests
read_requests:
process (clock) --reads incoming r/w requests, stores consumer_id and write_enable in a fifo buffer
	variable n_filled : integer range 0 to n_consumers := 0; -- number of waiting requests in buffer
	variable consumer_req_stored : std_logic_vector(n_consumers - 1 downto 0) := (others => '0'); 
	-- ^^ whether each consumers active request has been stored or not
begin
if rising_edge(clock) then
	if reset = '1' then
		n_filled := 0;
	else
		if n_completed > 0 then
			for i in 0 to n_channels - 1 loop
				if i < n_completed then
					consumer_req_stored(completed_requests(i)) := '0';
				end if;
			end loop;
		end if; --1 cycle back these were removed from the buffer and their done request was returned
		--by now should have removed r/w request
		--same request will be sent twice otherwise
		
		
		--completed requests removed from buffer, buffer << n_channels
		--completed ids stored in buffer of length n_channels
		--n_completed register maintained for the case where there are less
		for channel in 0 to n_channels - 1 loop
			completed_requests(channel) <= consumer_ids(channel);
			completed_wen(channel) <= consumer_wens(channel);
			completed_ren(channel) <= consumer_rens(channel);
		end loop;
		
		if n_filled >= n_channels then
			n_completed <= n_channels;
			n_filled := n_filled - n_channels;
		else
			n_completed <= n_filled;
			n_filled := 0;
		end if;
		
		--combinational logic to determine next edge values of registers
		
		for reg in n_channels to n_consumers-1 loop
			consumer_ids(reg-n_channels) <= consumer_ids(reg);
			consumer_wens(reg-n_channels) <= consumer_wens(reg);
			consumer_rens(reg-n_channels) <= consumer_rens(reg);
		end loop; --
		
		--next edge value for buffer
		--load new requests if they aren't already being served
		for consumer_id in 0 to n_consumers - 1 loop
			if consumer_req_stored(consumer_id) = '0' then
				if consumer_read_req(consumer_id) = '1' then
					consumer_ids(n_filled) <= consumer_id;
					consumer_wens(n_filled) <= '0';
					consumer_rens(n_filled) <= '1';
					n_filled := n_filled + 1;
					consumer_req_stored(consumer_id) := '1';
				elsif consumer_write_req(consumer_id) = '1' then
					consumer_ids(n_filled) <= consumer_id;
					consumer_wens(n_filled) <= '1';
					consumer_rens(n_filled) <= '0';
					n_filled := n_filled + 1;
					consumer_req_stored(consumer_id) := '1';
				end if;
			end if;
		end loop;
		consumer_wens(n_channels-1 downto n_filled) <= (others => '0');
		consumer_rens(n_channels-1 downto n_filled) <= (others => '0');
		--set global register to variable value
		n_filled_reg <= n_filled;
		report integer'image(n_filled);
	end if;
end if;
end process;

--set channel address/data
handle_channel:
process(clock) 
	variable consid : integer; --consumer id
begin
if rising_edge(clock) then
	if reset = '1' then
		mem_write_en <= (others => '0');
		mem_read_addr <= (others => '0');
		mem_write_addr <= (others => '0');
		mem_write_data <= (others => '0');
	else 
		for i in 0 to n_channels - 1 loop
			if i <= n_filled_reg then
				consid := consumer_ids(i);
				if consumer_wens(i) = '0' and consumer_rens(i) = '1' then
					mem_read_addr((i+1)*addr_bits - 1 downto i*addr_bits) <= consumer_read_addr((consid+1)*addr_bits - 1 downto consid*addr_bits);
					mem_write_en(i) <= '0';
				elsif consumer_wens(i) = '1' and consumer_rens(i) = '0' then
					mem_write_addr((i+1)*addr_bits - 1 downto i*addr_bits) <= consumer_write_addr((consid+1)*addr_bits - 1 downto consid*addr_bits);
					mem_write_data((i+1)*data_bits - 1 downto i*data_bits) <= consumer_write_data((consid+1)*data_bits - 1 downto consid*data_bits);
					mem_write_en(i) <= '1';
				else
					mem_write_en(i) <= '0';
				end if;
			else
				mem_write_en(i) <= '0';
			end if;
		end loop;
	end if;
end if;
end process;

--read completed requests
return_data:
process(clock)
	variable consid : integer;
begin
if rising_edge(clock) then
	for i in 0 to n_channels - 1 loop
		consid := completed_requests(i);
		if n_completed > 0 then
			if i <= n_completed then
				if completed_wen(i) = '0' and completed_ren(i) = '1' then
					consumer_read_data((consid+1)*data_bits - 1 downto consid*data_bits) <= mem_read_data((i+1)*data_bits - 1 downto i*data_bits);
					consumer_read_done(i) <= '1';
					consumer_write_done(i) <= '0';
				elsif completed_wen(i) = '1'  and completed_ren(i) = '0' then
					consumer_read_done(i) <= '0';
					consumer_write_done(i) <= '1';
				else
					consumer_read_done(i) <= '0';
					consumer_write_done(i) <= '0';
				end if;
			else
				consumer_read_done(i) <= '0';
				consumer_write_done(i) <= '0';
			end if;
		else
			consumer_read_done(i) <= '0';
			consumer_write_done(i) <= '0';
		end if;
	end loop;
end if;
end process;

end arch;