library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu is
	port(
		clock			:	in std_logic;
		reset			:	in std_logic;
		enable		:	in std_logic;
		operand_1	:	in std_logic_vector(7 downto 0);
		operand_2	:	in std_logic_vector (7 downto 0);
		alu_select	:	in std_logic_vector (2 downto 0);
		sm_state	:	in std_logic_vector(2 downto 0);
		alu_out		:	out std_logic_vector(7 downto 0);
		alu_nzp		:	out std_logic_vector(2 downto 0)
	);
end alu;

architecture behavioural of alu is

begin
	process(clock)
		variable rs : integer;
		variable rt : integer;
	begin
		if rising_edge(clock) then
			rs := to_integer(unsigned(operand_1));
			rt := to_integer(unsigned(operand_2));
			if reset = '1' then
				alu_out <= (others => '0');
				alu_nzp <= (others => '0');
			elsif enable = '1' then
				if sm_state = "101" then
					if (rs < rt) then
						alu_nzp(2) <= '1';
					else
						alu_nzp(2) <= '0';
					end if;
					if (rs = rt) then
						alu_nzp(1) <= '1';
					else
						alu_nzp(1) <= '0';
					end if;
					if (rs > rt) then
						alu_nzp(0) <= '1';
					else
						alu_nzp(0) <= '0';
					end if;
					case alu_select is
						when "000" => 
							alu_out <= std_logic_vector(to_unsigned(rs + rt, 8));
						when "001" =>
							alu_out <= std_logic_vector(to_unsigned(rs - rt, 8));
						when "010" =>
							alu_out <= std_logic_vector(to_unsigned(rs * rt, 8));
						when "011" =>
							alu_out <= std_logic_vector(to_unsigned(rs / rt, 8));
						when "100" =>
							alu_out <= std_logic_vector(to_unsigned(rs, 8) and to_unsigned(rt, 8));
						when "101" =>
							alu_out <= std_logic_vector(to_unsigned(rs, 8) or to_unsigned(rt, 8));
						when "110" =>
							alu_out <= std_logic_vector(to_unsigned(rs, 8) xor to_unsigned(rt, 8));
						when "111" =>
							alu_out <= std_logic_vector(not to_unsigned(rs, 8));
						when others =>
							null;
					end case;
				end if;
			end if;
		end if;
	end process;
end behavioural;