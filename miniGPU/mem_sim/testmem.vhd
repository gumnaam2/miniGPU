library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

library std;
use std.textio.all;

entity sim is port(
	clock, valid1, valid2 : in std_logic
);
end sim;

architecture behav of sim is
--	
--	function to_std_logic_vector(x: bit_vector) return std_logic_vector is
--		alias lx: bit_vector(1 to x'length) is x;
--		variable ret_val: std_logic_vector(1 to x'length);
--	begin
--		for I in 1 to x'length loop
--			if(lx(I) = '1') then
--				ret_val(I) := '1';
--			else
--				ret_val(I) := '0';
--			end if;
--		end loop; 
--		return ret_val;
--	end to_std_logic_vector;

	constant data_len : integer := 4;
	
	type data_type is array(0 to data_len - 1) of std_logic_vector(7 downto 0);
	signal data_sig : data_type := (others => (others => '0'));
	
begin

data_retrieve: process
	file infile : text open read_mode is "data.txt";
	
	variable data_var : data_type := (others => (others => '0'));
	variable input_vector_var: bit_vector (7 downto 0);
	variable inp_line : Line;
	variable line_count : integer := 0;
begin
	while not endfile(infile) loop
		readLine (infile, inp_line);
		read (inp_line, input_vector_var);
		data_var(line_count) := to_std_logic_vector(input_vector_var);
		
		line_count := line_count + 1;
	end loop;

	wait for 1 ns;

	data_sig <= data_var;

	wait;
end process;

read_write: process(clock) 
	begin
if rising_edge(clock) then
	if valid1 = '1' then
		null;
	elsif valid2 = '1' then
		data_sig(1) <= "01101100";
	else
		null;
	end if;
end if;
end process;

end behav;