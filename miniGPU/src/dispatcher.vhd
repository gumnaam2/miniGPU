library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.types.all;

entity dispatcher is 
port(
	clock, reset, start : in std_logic;
	core_done : in std_logic_vector(n_cores-1 downto 0); --DONE from each core
	thread_count : in std_logic_vector(7 downto 0); --total num of threads to be processed
	--e.g. if the operation is to add 2 length-10 vectors, should require 10 threads
	
	core_start, core_reset : buffer std_logic_vector(n_cores - 1 downto 0);
	core_block_id : out std_logic_vector(n_cores*8 - 1 downto 0);
	core_thread_count : out core_thread_type;
	core_thread_id : out std_logic_vector(n_cores*n_threads*2 - 1 downto 0) --2 bit ID for each thread
);
end dispatcher;

architecture arch of dispatcher is
	signal done, start_execution : std_logic;
	signal blocks_dispatched, blocks_done : integer := 0;
	constant total_blocks : integer := 2;
begin
process(clock) begin
	if rising_edge(clock) then
		if reset = '1' then
			done <= '0';
			start_execution <= '1';
			blocks_dispatched <= 0;
			blocks_done <= 0;
			core_start <= (others => '0');
			core_reset <= (others => '0');
			core_block_id <= (others => '0');
			core_thread_count <= (others => 0);
			core_thread_id <= (others => '0');
		elsif start = '1' then
			if start_execution = '0' then
				start_execution <= '1';
				core_reset <= (others => '1');
			end if;
			if blocks_done = total_blocks then
				done <= '1';
			end if;
			for j in 0 to n_cores - 1 loop --checking each core
				if core_reset(j) = '1' then --once the core is reset
					core_reset(j) <= '0'; --can start operations on core
					if blocks_dispatched < total_blocks then --not all blocks assigned to cores
						core_start(j) <= '1';
						core_block_id(j*8 + 7 downto j*8) <= std_logic_vector(to_unsigned(blocks_dispatched, 8));
						if blocks_dispatched <= (total_blocks - 1) then
							core_thread_count(j) <= to_integer(unsigned(thread_count)) - (blocks_dispatched * 4);
						else
							core_thread_count(j) <= 4;
						end if;
						blocks_dispatched <= blocks_dispatched + 1;
					end if;
				end if;
			end loop;
			for j in 0 to n_cores - 1 loop
				if core_start(j) = '1' and core_done(j) = '1' then
					core_reset(j) <= '1';
					core_start(j) <= '0';
					blocks_done <= blocks_done + 1;
				end if;
			end loop;
		end if;
	end if;
end process;	
end arch;