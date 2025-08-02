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
		alu_select	:	in std_logic_vector (1 downto 0);
		core_state	:	in std_logic_vector(2 downto 0);
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
				if core_state = "101" then
					if (rs < rt) then
						alu_nzp(0) <= '1';
					else
						alu_nzp(0) <= '0';
					end if;
					if (rs = rt) then
						alu_nzp(1) <= '1';
					else
						alu_nzp(1) <= '0';
					end if;
					if (rs > rt) then
						alu_nzp(2) <= '1';
					else
						alu_nzp(2) <= '0';
					end if;
					if alu_select = "00" then
						alu_out <= std_logic_vector(to_unsigned(rs + rt, 8));
					elsif alu_select = "01" then
						alu_out <= std_logic_vector(to_unsigned(rs - rt, 8));
					elsif alu_select = "10" then
						alu_out <= std_logic_vector(to_unsigned(rs * rt, 8));
					elsif alu_select = "11" then
						alu_out <= std_logic_vector(to_unsigned(rs / rt, 8));
					else
						alu_out <= (others => '0');
					end if;
				end if;
			end if;
		end if;
	end process;
end behavioural;