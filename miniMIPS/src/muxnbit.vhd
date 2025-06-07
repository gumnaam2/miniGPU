--define the single bit multiplexer
library ieee;
use ieee.std_logic_1164.all;

entity mux is
	port (x0, x1: in std_logic;
			control: in std_logic;
			selected: out std_logic);
end mux;

architecture muxarch of mux is
begin
	selected <= (x0 and not control) or (x1 and control);
end muxarch;


--n-bit mux
library ieee;
use ieee.std_logic_1164.all;

entity muxnbit is
	generic(
		n : integer := 4
	);
	
	port (choice: in std_logic_vector(n-1 downto 0);
			input: in std_logic_vector(2**n - 1 downto 0);
			output: out std_logic);
end muxnbit;

architecture muxnbarch of muxnbit is
	type arr2D is array (0 to n-1, 0 to 2**(n-1) - 1) of std_logic;
	signal layers: arr2D;
	component mux
		port (x0, x1: in std_logic;
			control: in std_logic;
			selected: out std_logic);
	end component;

begin
	input_layer: for i in 0 to 2**(n-1) - 1 generate 
				muxesinp: mux port map(x0 => input(2*i), x1 => input(2*i+1), control => choice(0), selected => layers(0,i));
		end generate;
	layer_gen: for l in 1 to n-1 generate
		mux_gen: for m in 0 to (2**(n - 1 - l) - 1) generate
			mux_inst: mux port map(x0 => layers(l-1,2*m), x1 => layers(l-1, 2*m+1), control => choice(l), selected => layers(l, m));
		end generate;
	end generate;
	output <= layers(n-1, 0);
end muxnbarch;