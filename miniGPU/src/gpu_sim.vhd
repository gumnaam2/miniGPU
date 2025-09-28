library ieee;
use ieee.std_logic_1164.all;

use work.types.all;

entity gpu_sim is
end gpu_sim;

architecture sim of gpu_sim is
	signal clock, start, reset, enable, dcr_write_enable : std_logic;
	signal grid_num_blocks, grid_num_threads : std_logic_vector(7 downto 0);
	signal grid_done : std_logic;

begin

gpu_dut_inst : entity work.gpu_dut(arch) port map(clock, start, reset, enable, dcr_write_enable,
	grid_num_blocks, grid_num_threads,
	grid_done);

clk_sim : process begin
	for i in 0 to 2000 loop
		clock <= '1';
		wait for clk_period/2;
		clock <= '0';
		wait for clk_period/2;
	end loop;
		wait;
end process;

gpu_stim : process begin
	enable <= '1';
	grid_num_blocks <= "00001000";
	grid_num_threads <= "00100000";
	dcr_write_enable <= '1';
	start <= '0'; reset <= '0';
	wait for 2*clk_period;
	reset <= '1';
	wait for 2*clk_period;
	reset <= '0';
	wait for clk_period;
	start <= '1'; 
	wait;
end process;

end sim;