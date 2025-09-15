library ieee;
use ieee.std_logic_1164.all;

library work;
use work.types.all;

library std;
use std.textio.all;
use ieee.numeric_std.all; 

entity data_mem is 
generic(
	write_en : boolean := false;
	data_bits : integer := 16;
	addr_bits : integer := 8;
	n_channels : integer := 4
);
port(
	clock : in std_logic;
	data_mem_read_address, data_mem_write_address : in std_logic_vector(8*n_channels-1 downto 0); --4 channels
	data_mem_read_valid, data_mem_write_valid : in std_logic_vector(n_channels-1 downto 0);
	data_mem_write_data : in std_logic_vector(8*n_channels - 1 downto 0);
	
	data_mem_read_data : out std_logic_vector(8*n_channels - 1 downto 0);
	data_mem_read_ready, data_mem_write_ready: out std_logic_vector(n_channels - 1 downto 0)
);
end data_mem;

architecture behav of data_mem is
	constant data_len : integer := 2**addr_bits ;
	type data_type is array(0 to data_len - 1) of std_logic_vector(7 downto 0);
--	signal data_sig : data_type := (others => (others => '0'));
	signal data_read : std_logic := '0';
	
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

read_addr: process(clock) 

	File INFILE: text open read_mode is "data.txt";
	File OUTFILE : text;
	variable data_var : data_type := (others => (others => '0'));
	variable input_vector_var: bit_vector (7 downto 0);
	variable inp_line, out_line : Line;
	variable line_count: integer := 0;
	
begin
if rising_edge(clock) then
	if data_read = '0' then
		while not endfile(INFILE) loop
			readLine (INFILE, inp_line);
			read (inp_line, input_vector_var);
			data_var(line_count) := to_std_logic_vector(input_vector_var);
			line_count := line_count + 1;
		end loop;
		data_read <= '1';
	elsif data_read = '1' then
		data_mem_read_ready <= (others => '0');
		data_mem_write_ready <= (others => '0');
		for i in 0 to n_channels-1 loop
			if data_mem_read_valid(i) = '1' then
				data_mem_read_ready(i) <= '1';
				data_mem_read_data(8*(i+1)- 1 downto 8*i) <= data_var(to_integer(unsigned(data_mem_read_address(8*(i+1)- 1 downto 8*i))));
			elsif data_mem_write_valid(i) = '1' then
				data_mem_write_ready(i) <= '1';
				data_var(to_integer(unsigned(data_mem_write_address(8*(i+1)-1 downto 8*i)))) := data_mem_write_data(8*(i+1)-1 downto 8*i);
			else
				null;
			end if;
		end loop;
--		file_open(outfile, "datao.txt", write_mode);
--		for row_line in 0 to 2**addr_bits - 1 loop
--			write(out_line, data_var(row_line));
--			writeline(outfile, out_line);
--		end loop;
--		file_close(outfile);
	end if;
end if;
end process;

end behav;