library std;
use std.textio.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.types.all;

entity core_sim_2 is
end core_sim_2;

architecture sim of core_sim_2 is
	component core_RAM_dut is port(
		clock, reset, start, enable: in std_logic;
		block_id : in std_logic_vector(7 downto 0);
		thread_id : in std_logic_vector(n_threads*8 - 1 downto 0);
		done : out std_logic
	);
	end component;
	signal clock, reset, start, enable : std_logic;
	signal block_id : std_logic_vector(7 downto 0);
	signal thread_id : std_logic_vector(n_threads*8 - 1 downto 0);
	signal done : std_logic;
begin

dut_inst : core_RAM_dut port map(
	clock, reset, start, enable, block_id, thread_id, done
);

clk_sim : process begin
	for i in 0 to 100 loop
		clock <= '1';
		wait for clk_period;
		clock <= '0';
		wait for clk_period;
	end loop;
		wait;
end process;

stim_proc: process begin
	block_id <= (others => '0');
	for i in 0 to n_threads - 1 loop
		thread_id((i+1)*8 - 1 downto i*8) <= std_logic_vector(to_unsigned(i, 8));
	end loop;
	reset <= '0'; start <= '0'; enable <= '0';
	
	wait for clk_period;
	
	reset <= '1'; start <= '1'; enable <= '1';
	wait for 2*clk_period;
	reset<='0';
	
	wait;
end process;

end sim;