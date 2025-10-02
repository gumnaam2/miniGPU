library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;

use work.types.all;

entity prog_mem_rom is
	port (
		clock : in std_logic;
		addr : in std_logic_vector(prog_addr_bits - 1 downto 0);
		prog_line : out std_logic_vector(prog_data_bits - 1 downto 0)
	);
end entity;

architecture rtl of prog_mem_rom is
	-- Build a 2-D array type for the ROM
	subtype word_t is std_logic_vector(prog_data_bits-1 downto 0);
	type memory_t is array(0 to 2**prog_addr_bits - 1) of word_t;
	
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

	function init_rom return memory_t is 
		type program_type is array(0 to 2**prog_addr_bits - 1) of std_logic_vector(prog_data_bits-1 downto 0);
		variable program : program_type := (others => (others => '0'));
		variable tmp : memory_t := (others => (others => '0'));
		File INFILE: text open read_mode is "program.txt";
		FILE OUTFILE: text  open write_mode is "outputs.txt";
		variable input_vector_var: bit_vector (15 downto 0);	
		variable inp_line : Line;
		variable line_count: integer := 0;

	begin 
		while (line_count < (2**prog_addr_bits)) and (not endfile(infile))loop
			readLine (INFILE, inp_line);
			read (inp_line, input_vector_var);
			program(line_count) := to_std_logic_vector(input_vector_var);
--			report integer'image(to_integer(unsigned(program(line_count))));
			line_count := line_count + 1;
		end loop;
		
		for addr_pos in 0 to 2**prog_addr_bits - 1 loop 
			-- Initialize each address with the address itselfx
			tmp(addr_pos) := program(addr_pos);
		end loop;
		return tmp;
	end init_rom;

	-- Declare the ROM signal and specify a default initialization value.
	signal rom : memory_t := init_rom;
begin
	process(clock)
	begin
	if (rising_edge(clock)) then
		prog_line <= rom(to_integer(unsigned(addr)));
	end if;
	end process;
end rtl;