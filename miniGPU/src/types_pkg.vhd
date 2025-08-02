library ieee;
use ieee.std_logic_1164.all;

package types is
	constant n_cores : integer := 2;
	constant n_threads : integer := 4;
	
	constant data_num_channels : integer := 4;
	constant prog_num_channels : integer := 1;
	constant data_num_consumers : integer := 8;
	constant prog_num_consumers : integer := 2;
	constant data_addr_bits : integer := 8;
	constant prog_addr_bits : integer := 8;
	constant data_data_bits : integer := 8;
	constant prog_data_bits : integer := 16;
	
	type logic_arr is array(n_threads - 1 downto 0) of std_logic;
	type vector_2_arr is array(n_threads - 1 downto 0) of std_logic_vector(1 downto 0);
	type vector_8_arr is array(n_threads - 1 downto 0) of std_logic_vector(7 downto 0);
	type vector_16_arr is array(n_threads - 1 downto 0) of std_logic_vector(15 downto 0);
	type core_thread_type is array(n_cores*2 - 1 downto 0) of integer range 1 to 4;
	type data_mem_multicore_type is array (0 to n_cores - 1) of vector_8_arr;
	
	type vector_arr is array(natural range <>) of std_logic_vector;
	
	type bit_arr is array(natural range <>) of std_logic;
end package;
