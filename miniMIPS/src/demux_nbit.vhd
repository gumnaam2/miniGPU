library ieee;
use ieee.std_logic_1164.all;

entity demux_nbit is
	generic(
		n: integer := 2
	);
	port (
		x_in: in std_logic_vector(n-1 downto 0);
		inp: in std_logic;
		y_out: out std_logic_vector((2**n)-1 downto 0)
	);
end demux_nbit;

architecture structural of demux_nbit is
	component decoder_nbit
--	generic (
--		n: integer := 4
--	);
		port (x_in: in std_logic_vector(n-1 downto 0);
			y: out std_logic_vector((2**n)-1 downto 0));
	end component;
	signal demux_out: std_logic_vector(2**n - 1 downto 0);
begin
	seq: decoder_nbit port map(x_in => x_in, y => demux_out);
	
	set_out:
		for i in 0 to n-1 generate
			y_out(i) <= inp and demux_out(i);
		end generate;
end structural;