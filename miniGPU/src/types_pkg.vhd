library ieee;
use ieee.std_logic_1164.all;

package types is
	constant n_sms : integer := 4;
	constant n_cores : integer := 4; --cores per sm
	constant n_threads_bits : integer := 4;
	
	constant clk_period : time := 100 ns;
	
	constant data_num_channels : integer := 1;
	constant prog_num_channels : integer := 1;
	constant data_num_consumers : integer := n_sms*n_cores;
	constant prog_num_consumers : integer := n_sms;
	constant data_addr_bits : integer := 8;
	constant prog_addr_bits : integer := 8;
	constant data_data_bits : integer := 8;
	constant prog_data_bits : integer := 16;
	
	type logic_arr is array(n_cores - 1 downto 0) of std_logic;
	type vector_2_arr is array(n_cores - 1 downto 0) of std_logic_vector(1 downto 0);
	type vector_8_arr is array(n_cores - 1 downto 0) of std_logic_vector(7 downto 0);
	type vector_16_arr is array(n_cores - 1 downto 0) of std_logic_vector(15 downto 0);
	type sm_thread_type is array(n_sms*2 - 1 downto 0) of integer range 1 to 4;
	type data_mem_multicore_type is array (0 to n_sms - 1) of vector_8_arr;
	
	type vector_arr is array(natural range <>) of std_logic_vector;
	
	type bit_arr is array(natural range <>) of std_logic;

--	function to_std_logic_vector(x: bit_vector) return std_logic_vector;
end package;

package body types is

	function to_std_logic_vector(x: bit_vector) return std_logic_vector is
		alias lx: bit_vector(1 to x'length) is x;
		variable ret_val: std_logic_vector(1 to x'length);
	begin
		for I in 1 to x'length loop
			if(lx(I) = '1') then
				ret_val(I) := '1';
			else
				ret_val(I) := '0';
			end if;
		end loop; 
		return ret_val;
	end to_std_logic_vector;

end package body types;
