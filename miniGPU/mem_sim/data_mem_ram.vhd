LIBRARY ieee;
USE ieee.std_logic_1164.all;
use std.textio.all;
use ieee.numeric_std.all;

use work.types.all;

ENTITY data_mem_ram IS
	PORT (
		clock: IN STD_LOGIC;
		data_write : IN STD_LOGIC_VECTOR (data_data_bits - 1 DOWNTO 0);
		write_address: IN std_logic_vector(data_addr_bits - 1 downto 0); --INTEGER RANGE 0 to 2**data_addr_bits-1;
		read_address: IN std_logic_vector(data_addr_bits - 1 downto 0); --INTEGER RANGE 0 to 2**data_addr_bits-1;
		we: IN STD_LOGIC;
		q: OUT STD_LOGIC_VECTOR (data_data_bits-1 DOWNTO 0)
	);
END data_mem_ram;

ARCHITECTURE rtl OF data_mem_ram	 IS
	subtype word_t is std_logic_vector(data_data_bits-1 downto 0);
	type memory_t is array(0 to 2**data_addr_bits - 1) of word_t;
	SIGNAL read_address_reg : std_logic_vector(data_addr_bits - 1 downto 0);
	
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
		type data_type is array(0 to 2**data_addr_bits - 1) of std_logic_vector(data_data_bits-1 downto 0);
		variable data : data_type := (others => (others => '0'));
		variable tmp : memory_t := (others => (others => '0'));
		file infile: text open read_mode is "data.txt";
--		FILE OUTFILE: text  open write_mode is "outputs.txt";
		variable input_vector_var: bit_vector (data_data_bits - 1 downto 0);	
		variable inp_line : Line;
		variable line_count: integer := 0;

	begin 
		while (line_count < (2**data_addr_bits)) and (not endfile(infile))loop
			readLine (INFILE, inp_line);
			read (inp_line, input_vector_var);
			data(line_count) := to_std_logic_vector(input_vector_var);
--			report integer'image(to_integer(unsigned(data(line_count))));
			line_count := line_count + 1;
		end loop;
		
		for addr_pos in 0 to 2**data_addr_bits - 1 loop 
			-- Initialize each address with the address itselfx
			tmp(addr_pos) := data(addr_pos);
		end loop;
		return tmp;
	end init_rom;

	-- Declare the ROM signal and specify a default initialization value.
	signal ram_block : memory_t := init_rom;
BEGIN
	PROCESS (clock)
	BEGIN
		IF (rising_edge(clock)) THEN
			IF (we = '1') THEN
				ram_block(to_integer(unsigned(write_address))) <= data_write;
			END IF;
		END IF;
	END PROCESS;
	
	PROCESS (clock)
	BEGIN
		IF (rising_edge(clock)) THEN
			--read_address_reg <= read_address;
			q <= ram_block(to_integer(unsigned(read_address)));
		END IF;
	END PROCESS;
END rtl;