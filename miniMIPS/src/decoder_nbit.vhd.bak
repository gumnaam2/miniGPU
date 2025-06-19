library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity decoder_nbit is
	generic (
		n: integer := 4
	);
	port (x_in: in std_logic_vector(n-1 downto 0);
			y: out std_logic_vector((2**n)-1 downto 0));
end decoder_nbit;

architecture dec_nbit_arch of decoder_nbit is
	type myarr2d is array(0 to 2**n - 1) of std_logic_vector(n downto 0);
	signal and_tmp: myarr2d;
begin
	n_wires: for i in 0 to 2**n - 1 generate
	constant i_bin :std_logic_vector(n-1 downto 0) := std_logic_vector(to_unsigned(i, n));
	begin
		n_ands: for j in 0 to n generate
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
end dec_nbit_arch;