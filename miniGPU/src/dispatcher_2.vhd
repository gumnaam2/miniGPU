library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


use work.types.all;

entity dispatcher_2 is port(
	grid_num_blocks, grid_num_threads : in std_logic_vector(7 downto 0); --number of blocks and threads in grid being executed
	clock, start, reset : in std_logic; --signal to start execution
	
	sm_done : in std_logic_vector(n_sms - 1 downto 0); --DONE signal from each SM
	
	thread_ids : out std_logic_vector(n_cores*n_sms*8 - 1 downto 0); --thread_ids to be used by SM
	block_ids : out std_logic_vector(n_sms*8 - 1 downto 0); --block ids for each SM
	
	sm_thread_count : out std_logic_vector(n_sms*n_threads_bits-1 downto 0); --no. of threads in warp being sent
	--will be less than cores/SM when the last few threads are being handled
	
	sm_reset, sm_start : out std_logic_vector(n_sms - 1 downto 0); --start/reset signals to SMs
	
	grid_done : out std_logic --signal to somewhere? grid is done
);
end dispatcher_2;

architecture arch of dispatcher_2 is
	signal started : std_logic := '0';
begin 

process(clock)
	variable num_blocks_dispatched, num_blocks_done : integer := 0;
	type num_arr_type is array (0 to n_sms - 1) of integer range 0 to 2**8;
	variable num_threads_done, num_threads_dispatched : num_arr_type; --for each block, how many threads are done
--	variable sm_block_ids : num_arr_type; --which block is currently running on each SM
	variable sm_started : std_logic_vector(n_sms - 1 downto 0);
	variable sm_block_done : std_logic_vector(n_sms - 1 downto 0) := (others => '0'); --whether the block running on each SM is done
	variable sm_reset_var, sm_start_var : std_logic_vector(n_sms - 1 downto 0) := (others => '0');
begin

if rising_edge(clock) then
	if reset = '1' then
		sm_reset <= (others => '1');
		sm_reset_var := (others => '1');
		sm_start <= (others => '0');
		sm_start_var := (others => '0');
		num_blocks_dispatched := 0;
		num_blocks_done := 0;
		num_threads_done := (others => 0);
		sm_thread_count <= (others => '0');
		num_threads_dispatched := (others => 0);
		grid_done <= '0';
		started <= '0';
	else
		if start = '1' or started = '1' then
			started <= '1';
			if num_blocks_done > 0 and num_blocks_done = to_integer(unsigned(grid_num_blocks)) then
				grid_done <= '1';
			else
				for i in 0 to n_sms - 1 loop
					if i < to_integer(unsigned(grid_num_blocks)) then
						if sm_done(i) = '1' and sm_start_var(i) = '1' then --SM has finished warp execution and is now waiting
							report integer'image(i) & "A";
							sm_reset_var(i) := '1'; --reset to prepare for next warp
							sm_start_var(i) := '0';
						elsif sm_reset_var(i) = '1' then --SM ready to take next warp
							if sm_block_done(i) = '0' and sm_started(i) = '1' then --SM still executing block
								report integer'image(i) & "B";
								num_threads_done(i) := num_threads_done(i) + num_threads_dispatched(i);
								--check if any more threads to be executed from block
								if num_threads_done(i) = to_integer(unsigned(grid_num_threads)) then
									report "XXX";
									sm_block_done(i) := '1';
									num_blocks_done := num_blocks_done + 1;--block done
								else
									report integer'image(i) & "D";
									for j in 0 to n_cores - 1 loop --set thread ids for SM i: num_threads_done to num_threads_done + n_cores - 1
										thread_ids(i*n_cores*8 + (j+1)*8  - 1 downto i*n_cores*8 + j*8) <= std_logic_vector(to_unsigned(num_threads_done(i) + j, 8));
									end loop;
									
									sm_reset_var(i) := '0';
									sm_start_var(i) := '1';
								end if;
							else --SM not executing anything, assign new block if all blocks not already assigned
								report integer'image(i) & "HEY";
								sm_started(i) := '1';
								if num_blocks_dispatched < to_integer(unsigned(grid_num_blocks)) then
									report integer'image(i) & "C";
	--								sm_block_ids(i) := num_blocks_done;
									sm_block_done(i) := '0';
									block_ids((i+1)*8 - 1 downto i*8) <= std_logic_vector(to_unsigned(num_blocks_dispatched, 8));
									num_threads_done(i) := 0;
									num_blocks_dispatched := num_blocks_dispatched + 1;
									
									for j in 0 to n_cores - 1 loop
										thread_ids(i*n_cores*8 + (j+1)*8  - 1 downto i*n_cores*8 + j*8) <= std_logic_vector(to_unsigned(num_threads_done(i) + j, 8));
									end loop;
									sm_reset_var(i) := '0';
									sm_start_var(i) := '1';
								end if;
							end if;
						end if;
						if to_integer(unsigned(grid_num_threads)) - num_threads_done(i) < n_cores then
							num_threads_dispatched(i) := to_integer(unsigned(grid_num_threads)) - num_threads_done(i);
						else
							num_threads_dispatched(i) := n_cores;
						end if;
						sm_thread_count(n_threads_bits*(i+1) - 1 downto n_threads_bits*i) <= std_logic_vector(to_unsigned(num_threads_dispatched(i), n_threads_bits));
						sm_start(i) <= sm_start_var(i);
						sm_reset(i) <= sm_reset_var(i);
					end if;
				end loop;
			end if;
		end if;
	end if;
end if;
end process;

end arch;