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
	TYPE MEM IS ARRAY(0 TO 2**data_addr_bits - 1) OF STD_LOGIC_VECTOR(data_data_bits-1 DOWNTO 0);
	SIGNAL ram_block: MEM;
	SIGNAL read_address_reg : std_logic_vector(data_addr_bits - 1 downto 0);
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
			read_address_reg <= read_address;
			q <= ram_block(to_integer(unsigned(read_address_reg)));
		END IF;
	END PROCESS;
END rtl;