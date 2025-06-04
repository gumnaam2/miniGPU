--
--entity decoder_1_2 is
--	port (x_in: in std_logic;
--			y1, y2: out std_logic);
--end decoder_1_2;
--
--architecture dec_1_2_arch of decoder_1_2 is
--begin
--	y1 <= x_in;
--	y2 <= not x_in;
--end dec_1_2_arch;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity decoder_nbit is --take in binary no. x_in
	--set x_in'th port = 1 rest 0
	generic (
		n: integer := 4
	);
	port (x_in: in std_logic_vector(n-1 downto 0);
			y: out std_logic_vector((2**n)-1 downto 0));
end decoder_nbit;
--apparently, only constants are allowed in a for-generate loop
architecture dec_nbit_arch of decoder_nbit is
	type myarr2d is array(0 to 2**n - 1) of std_logic_vector(n downto 0);
	--signal x_not: std_logic_vector (n-1 downto 0);
	signal and_tmp: myarr2d;
begin
	n_wires: for i in 0 to 2**n - 1 generate--define the output for the 2^n output wires
	constant i_bin :std_logic_vector(n-1 downto 0) := std_logic_vector(to_unsigned(i, n));
	begin
		n_ands: for j in 0 to n generate -- n-1 and statements, taking not x or x depending on the jth bit of the wire no. i, 0th is := 1
		begin
			c1: if j = 0 generate
			begin
				and_tmp(i)(j) <= '1';
			end generate c1;
			c2: if j > 0 generate
			begin
				c3: if (i_bin(j - 1) = '0') generate
				begin
					and_tmp(i)(j) <= and_tmp(i)(j-1) and (not x_in(j-1));
				end generate c3;
				c4: if (i_bin(j - 1) = '1') generate
				begin
					and_tmp(i)(j) <= and_tmp(i)(j-1) and x_in(j-1);
				end generate c4;
			end generate c2;
		end generate n_ands;
		y(i) <= and_tmp(i)(n);
	end generate n_wires;
--	x_not <= not x_in;
--	this process implementation is much simpler
--	process(x_in, x_not)	
--		variable temp_and : std_logic := '1';
--		variable temp_i: std_logic_vector (n-1 downto 0); --vectorized number we loop over
--	begin
--		for i in 0 to 2**n - 1 loop
--			temp_and := '1';
--			temp_i := std_logic_vector(to_unsigned(i, temp_i'length));
--			for j in 0 to n-1 loop
--				if (temp_i(j) = '0') then
--					temp_and := temp_and and x_not(j);
--				else
--					temp_and := temp_and and x_in(j);
--				end if;
--			end loop;
--			y(i) <= temp_and;
--		end loop;
--	end process;
end dec_nbit_arch;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dec_tb is
	generic (
		n: integer := 4
	);
end dec_tb;

architecture dec_tb_arch of dec_tb is

	component decoder_nbit port (x_in: in std_logic_vector(n-1 downto 0);
		y: out std_logic_vector((2**n)-1 downto 0));
	end component;
	
	signal in_sig: std_logic_vector(n-1 downto 0);
	signal out_sig: std_logic_vector((2**n) -1 downto 0);
	
begin
	dut_dec:
		decoder_nbit port map (x_in => in_sig, y => out_sig);
	dut_process: process
		begin
		for j in 0 to 2**n - 1 loop
			in_sig <= std_logic_vector(to_unsigned(j, in_sig'length));
			wait for 10 ns;
		end loop;
		wait;
	end process;
end dec_tb_arch;
	