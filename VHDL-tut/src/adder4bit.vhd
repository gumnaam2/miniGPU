library ieee;
use ieee.std_logic_1164.all;

entity fulladder is
	port (x, y, cin: in std_logic;
			s, cout: out std_logic);
end fulladder;

architecture adder_arch of fulladder is
begin
	s <= x xor y xor cin;
	cout <= (x and y) or (x and cin) or (y and cin);
end adder_arch;

library ieee;
use ieee.std_logic_1164.all;

entity adder4bit is
	port (x: in std_logic_vector(15 downto 0);
			y: in std_logic_vector(15 downto 0);
			s: out std_logic_vector(15 downto 0);
			cout: out std_logic);
end adder4bit;

architecture arch4b of adder4bit is
	signal c: std_logic_vector(16 downto 0);
	component fulladder
		port (x, y, cin: in std_logic;
		s, cout: out std_logic);
	end component;
	begin
		c(0) <= '0';
		
		additions:
			for i in 0 to 15 generate
				adders: fulladder port map (cin => c(i), x => x(i), y => y(i), s => s(i), cout => c(i+1));
			end generate;
		
		cout <= c(16);
--		std_logic0: fulladder port map (cin => '0', x => x(0), y => y(0), s => s(0), cout => c1);
--		std_logic1: fulladder port map (cin => c1, x => x(1), y => y(1), s => s(1), cout => c2);
--		std_logic2: fulladder port map (cin => c2, x => x(2), y => y(2), s => s(2), cout => c3);
--		std_logic3: fulladder port map (cin => c3, x => x(3), y => y(3), s => s(3), cout => cout);
end arch4b;