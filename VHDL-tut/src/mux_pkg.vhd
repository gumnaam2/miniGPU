--define the single bit multiplexer as a package to be used in the n-bit mux
library ieee;
use ieee.std_logic_1164.all;

package mux_pkg is
	component mux
		port (x0, x1: in std_logic;
				control: in std_logic;
				selected: out std_logic);
	end component;
end package;

--architecture of the single-bit mux
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
