--2^m rows of 2^n registers each
--takes address outputs byte at address
library ieee;
use ieee.std_logic_1164.all;

entity mem_unit is
	generic(
		n: integer := 2; --2^n bits in a row
		m: integer := 2 --2^m rows
	);
	port(
		clk: in std_logic;
		addr: in std_logic_vector (m-1 downto 0);
		in_byte: in std_logic_vector(2*n-1 downto 0);
		out_byte: out std_logic_vector(2**n-1 downto 0);
		enable: in std_logic
	);
end mem_unit;

architecture structural of mem_unit is
	component reg_1b port (
		d: in std_logic;
		e: in std_logic;
		clk: in std_logic;
		q: out std_logic
	);
	end component;
	
	component muxnbit
		generic(
			n : integer := 2--actually m
		);
		port (choice: in std_logic_vector(n-1 downto 0);
				input: in std_logic_vector(2**n - 1 downto 0);
				output: out std_logic);
	end component;
	
	component decoder_nbit
		generic (
			n: integer := 2 --actually m
		);
		port (x_in: in std_logic_vector(n-1 downto 0);
				y: out std_logic_vector((2**n)-1 downto 0));
	end component;
	signal en: std_logic_vector(2**m-1 downto 0);
	
	type dq_arr is array(0 to 2**m-1) of std_logic_vector(2**n - 1 downto 0);
	signal d_arr: dq_arr;
	signal q_arr: dq_arr;
	type inout_arr is array(0 to 2**n - 1) of std_logic_vector(2**m - 1 downto 0);
	signal out_mux_inp, in_mux_inp: inout_arr;
begin
	--create 2^m rows of 2^n registers each
	reg_row: for row in 0 to 2**m - 1 generate
			reg_ind: for reg in 0 to 2**n - 1 generate
				begin
				reg_single_bit: reg_1b port map (d => d_arr(row)(reg) , e => en(row) and enable, clk => clk, q => q_arr(row)(reg));
			end generate;
		end generate;
	 --set the enable high for the address we want to read/write to
	enabler:
		decoder_nbit port map (x_in => addr, y => en);
	--connect out_byte to the byte we want to read from
	reader:
		for out_bit in 0 to 2**n - 1 generate --mux to select ith out bit 
			out_bit_sel:
				for row in 0 to 2**m - 1 generate begin
					c: out_mux_inp(out_bit)(row) <= q_arr(row)(out_bit);
				end generate;
				out_bit_mux: muxnbit port map(choice => addr, input => out_mux_inp(out_bit), output => out_byte(out_bit));
		end generate;
--
--	writer:
--		for in_bit in 0 to 2**n - 1 generate --mux to select ith out bit 
--			in_bit_sel:
--				for row in 0 to 2**m - 1 generate begin
--					c: in_mux_inp(in_bit)(row) <= d_arr(row)(in_bit);
--				end generate;
--				out_bit_mux: muxnbit port map(choice => addr, input => in_mux_inp(in_bit), output => in_byte(out_bit));
--		end generate;

end structural;