library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adder_tb is
end adder_tb;

architecture adder_tb_int of adder_tb is
	component adder4bit 	port (x: in std_logic_vector(15 downto 0);
			y: in std_logic_vector(15 downto 0);
			s: out std_logic_vector(15 downto 0);
			cout: out std_logic);
	end component;
	
	signal x_sig, y_sig, s_sig: std_logic_vector(15 downto 0);
	signal cout_sig: std_logic;
begin
	dut_adder: 
		adder4bit port map (x => x_sig, y => y_sig, s => s_sig, cout => cout_sig);
	test_process: process
		begin
		for i in 0 to 15 loop
			for j in 0 to 15 loop
				x_sig <= std_logic_vector(to_unsigned(i, x_sig'length));
				y_sig <= std_logic_vector(to_unsigned(j, y_sig'length));
				wait for 10 ns;
			end loop;
		end loop;
		wait;
	end process;
end adder_tb_int;
	