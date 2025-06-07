library ieee;
use ieee.std_logic_1164.all;

entity reg_1b is port (
	d: in std_logic;
	e: in std_logic;
	clk: in std_logic;
	q: out std_logic
);
end reg_1b;

architecture reg_arch of reg_1b is

begin
	
	reg: process(clk) begin
		if rising_edge(clk) then
			if e = '1' then
				q <= d;
			end if;
		end if;
	end process;

end reg_arch;

entity sim_reg is
end entity;

library ieee;
use ieee.std_logic_1164.all;

architecture sim_reg_arch of sim_reg is
	component reg_1b port (
		d: in std_logic;
		e: in std_logic;
		clk: in std_logic;
		q: out std_logic
	);
	end component;
	
	signal clk, e, q, d: std_logic := '0';
begin

	clock:
		clk <=  '1' after 0.5 ns when clk = '0' else
			  '0' after 0.5 ns when clk = '1';
	
	simreg: reg_1b port map(clk => clk, e => e, d => d, q => q);
	
	sim_reg: process begin
		e <= '1'; d <= '0';
		wait for 100 ns;
		e <= '1'; d <= '1';
		wait for 100 ns;
		e <= '0'; d <= '1';
		wait for 100 ns;
		e <= '0'; d <= '0';
		wait for 100 ns;
		
		wait;
	end process;
	
end sim_reg_arch;