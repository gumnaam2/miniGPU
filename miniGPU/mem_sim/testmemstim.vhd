library std;
use std.textio.all;

library ieee;
use ieee.std_logic_1164.all;

entity stim is
end stim;

architecture behav of stim is
	constant clk_period : time := 10 ns;
--	function to_std_logic_vector(x: bit_vector) return std_logic_vector is
--		alias lx: bit_vector(1 to x'length) is x;
--		variable ret_val: std_logic_vector(1 to x'length);
--	begin
--		for I in 1 to x'length loop
--			if(lx(I) = '1') then
--				ret_val(I) := '1';
--			else
--				ret_val(I) := '0';
--			end if;
--		end loop; 
--		return ret_val;
--	end to_std_logic_vector;
--	
	component sim is port(
		clock, valid1, valid2 : in std_logic
	);
	end component;
	
	signal clock, valid1, valid2 : std_logic;
begin

sim_block: sim port map(clock, valid1, valid2);

lsu_stim : process begin
	wait for 10*clk_period;
	valid1 <= '1';
	valid2 <= '0';
	wait for clk_period;
	report "HI";
	wait;
end process;
end behav;