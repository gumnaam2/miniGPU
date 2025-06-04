library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity tb is
end tb;

architecture tb_int_arc of tb is
	component muxnbit
		port (choice: in std_logic_vector(3 downto 0);
			input: in std_logic_vector(15 downto 0);
			output: out std_logic);
	end component;
	signal choice_sig: std_logic_vector(3 downto 0) := "0000";
	signal input_sig: std_logic_vector(15 downto 0) := "1000000000000000";
	signal output_sig: std_logic := '0';
begin
		dut: muxnbit port map (
			choice => choice_sig,
			input => input_sig,
			output => output_sig
		);
		
		test_process: process
		begin
			for i in 0 to 15 loop
				for j in 0 to 15 loop
					choice_sig <= std_logic_vector(to_unsigned(j, choice_sig'length));					
					input_sig <= (others => '0');
					input_sig(i) <= '1';
					wait for 10 ns;
				end loop;
			end loop;
--				
--			choice_sig <= "0010";
--			
--			input_sig <= "1000000000000000";
--			wait for  10 ns;
--			input_sig <= "0100000000000000";
--			wait for  10 ns;
--			input_sig <= "0010000000000000";
--			wait for  10 ns;
--			input_sig <= "0001000000000000";
--			wait for  10 ns;
--			input_sig <= "0000000000000100";
--			wait for  10 ns;
--			input_sig <= "0000000000000010";
--			wait for  10 ns;
--			input_sig <= "0000000000000001";
--			wait for  10 ns;
			wait;
			--report "output: " & to_hstring(output);
		end process;
end tb_int_arc;