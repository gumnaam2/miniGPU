library ieee;
use ieee.std_logic_1164.all;
use work.types.all;
library std;
use std.textio.all;
use ieee.numeric_std.all; 

entity prog_mem is
generic(
	n_channels : integer := 1
);
port(
	clock : in std_logic;
	prog_mem_read_address : in std_logic_vector(8*n_channels-1 downto 0);
	prog_mem_read_valid : in std_logic_vector(n_channels-1 downto 0);
	
	prog_mem_read_data : out std_logic_vector(16*n_channels-1 downto 0);
	prog_mem_read_ready : out std_logic_vector(n_channels-1 downto 0)
);
end prog_mem;

architecture behav of prog_mem is
	constant prog_len : integer := 2**prog_addr_bits - 1;
	type program_type is array(0 to prog_len - 1) of std_logic_vector(15 downto 0);
	signal program : program_type := (others => (others => '0'));
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

begin

data_retrieve: process --read the program in the txt, store in program as logic vectors
	File INFILE: text open read_mode is "program.txt";
	FILE OUTFILE: text  open write_mode is "outputs.txt";
		
	variable input_vector_var: bit_vector (15 downto 0);	
	variable inp_line : Line;
	variable line_count: integer := 0;

begin
	while not endfile(INFILE) loop
		readLine (INFILE, inp_line);
		read (inp_line, input_vector_var);
		program(line_count) <= to_std_logic_vector(input_vector_var);		
		line_count := line_count + 1;
	end loop;
	wait;
end process;

read_addr: process begin
if rising_edge(clock) then
	prog_mem_read_ready <= (others => '0');
	for i in 0 to n_channels - 1 loop
		if prog_mem_read_valid(i) = '1' then
			prog_mem_read_ready(i) <= '1';
			prog_mem_read_data(16*(i+1) - 1 downto 16*i) <= program(to_integer(unsigned(prog_mem_read_address)));
		end if;
	end loop;
end if;
wait on clock;
end process;

end behav;