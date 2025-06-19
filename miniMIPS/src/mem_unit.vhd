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
	
	component demux_nbit
		generic(
			n: integer := 2 --actually m
		);
		port (	
			x_in: in std_logic_vector(n-1 downto 0);
			inp: in std_logic;
			y_out: out std_logic_vector((2**n)-1 downto 0)
		);
	end component;
	signal en: std_logic_vector(2**m-1 downto 0);
	
	type dq_arr is array(0 to 2**m-1) of std_logic_vector(2**n - 1 downto 0);
	signal d_arr: dq_arr;
	signal q_arr: dq_arr;
	type inout_arr is array(0 to 2**n - 1) of std_logic_vector(2**m - 1 downto 0);
	signal out_mux_inp, in_dec_out: inout_arr;
begin
	--set the enable high for the address we want to read/write to
	enabler:
		decoder_nbit port map (x_in => addr, y => en);

	writer:
		for in_bit in 0 to 2**n - 1 generate --demux for in_byte to go to correct address
			in_bit_sel:	for row in 0 to 2**m - 1 generate begin
					d:  d_arr(row)(in_bit) <= in_dec_out(in_bit)(row);
			end generate in_bit_sel;
			in_bit_demux: demux_nbit port map(inp => in_byte(in_bit), x_in => addr, y_out => in_dec_out(in_bit));
		end generate;

	--create 2^m rows of 2^n registers each
	reg_row: for row in 0 to 2**m - 1 generate
			reg_ind: for reg in 0 to 2**n - 1 generate
				begin
				reg_single_bit: reg_1b port map (d => d_arr(row)(reg) , e => en(row) and enable, clk => clk, q => q_arr(row)(reg));
			end generate;
		end generate;

	--connect out_byte to the byte we want to read from
	reader:
		for out_bit in 0 to 2**n - 1 generate --mux to select ith out bit 
			out_bit_sel:
				for row in 0 to 2**m - 1 generate begin
					c: out_mux_inp(out_bit)(row) <= q_arr(row)(out_bit);
				end generate;
				out_bit_mux: muxnbit port map(choice => addr, input => out_mux_inp(out_bit), output => out_byte(out_bit));
		end generate;

end structural;