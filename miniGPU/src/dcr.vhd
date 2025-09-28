library ieee;
use ieee.std_logic_1164.all;
use work.types.all;

entity dcr is port(
	clock, reset, dcr_write_enable : in std_logic;
	grid_num_blocks_in, grid_num_threads_in: in std_logic_vector(7 downto 0);
	
	grid_num_blocks, grid_num_threads : out std_logic_vector(7 downto 0)
);
end dcr;

architecture arch of dcr is
begin
	process(clock) begin
	if rising_edge(clock) then
		if reset = '1' then
			grid_num_blocks <= (others => '0');
			grid_num_threads <= (others => '0');
		elsif dcr_write_enable = '1' then
			grid_num_blocks <= grid_num_blocks_in;
			grid_num_threads <= grid_num_threads_in;
		end if;
	end if;
	end process;
end arch;