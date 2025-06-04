library ieee;
use ieee.std_logic_1164.all;
use work.mux_pkg.all;

entity muxnbit is
	port (choice: in std_logic_vector(3 downto 0);
			input: in std_logic_vector(15 downto 0);
			output: out std_logic);
end muxnbit;

architecture muxnbarch of muxnbit is
	type arr2D is array (0 to 3, 0 to 7) of std_logic;
	signal layers: arr2D;
	signal layer0: std_logic_vector(7 downto 0);
	signal layer1: std_logic_vector(3 downto 0);
	signal layer2: std_logic_vector(1 downto 0);
	signal layer3: std_logic_vector(0 downto 0);
	component mux
		port (x0, x1: in std_logic;
			control: in std_logic;
			selected: out std_logic);
	end component;

begin
	input_layer: for i in 0 to 7 generate 
				muxesinp: mux port map(x0 => input(2*i), x1 => input(2*i+1), control => choice(0), selected => layers(0,i));
		end generate;
	layer_gen: for l in 1 to 3 generate
		mux_gen: for m in 0 to (2**(3 - l) - 1) generate
			mux_inst: mux port map(x0 => layers(l-1,2*m), x1 => layers(l-1, 2*m+1), control => choice(l), selected => layers(l, m));
		end generate;
	end generate;
	output <= layers(3, 0);
--	muxes0: for i in 0 to 7 generate 
--				muxesl0: mux port map(x0 => input(2*i), x1 => input(2*i+1), control => choice(0), selected => layer0(i));
--		end generate;
--	muxes1:
--		for i in 0 to 3 generate
--			muxesl1: mux port map(x0 => layer0(2*i), x1 => layer0(2*i+1), control => choice(1), selected => layer1(i));
--		end generate;
--	muxes2:
--		for i in 0 to 1 generate
--			muxesl2: mux port map(x0 => layer1(2*i), x1 => layer1(2*i+1), control => choice(2), selected => layer2(i));
--		end generate;
--	muxl3: mux port map(x0 => layer2(0), x1 => layer2(1), control => choice(3), selected => output);
	
	--output <= choice(2) and input(0);
end muxnbarch;