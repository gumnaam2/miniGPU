library std;
use std.textio.all;
library ieee;
use ieee.std_logic_1164.all;
use work.types.all;

entity fetcher_sim is
end fetcher_sim;

architecture behav of fetcher_sim is

	function to_std_logic_vector(x: bit_vector) return std_logic_vector is
		alias lx: bit_vector(1 to x'length) is x;
		variable ret_val: std_logic_vector(1 to x'length);
	begin
		for I in 1 to x'length loop
			if(lx(I) = '1') then
				ret_val(I) := '1';
			else
				ret_val(I) := '0';
			end if;
		end loop; 
		return ret_val;
	end to_std_logic_vector;

	component prog_mem is port(
		clock : in std_logic;
		prog_mem_read_address : in std_logic_vector(7 downto 0);
		prog_mem_read_valid : in std_logic;
		
		prog_mem_read_data : out std_logic_vector(15 downto 0);
		prog_mem_read_ready : out std_logic
	);
	end component;
	
	component fetcher is port(
		clock, reset, mem_read_ready	: in std_logic;
		core_state				: in std_logic_vector(2 downto 0);
		current_pc			: in std_logic_vector(7 downto 0);
		mem_read_data		: in std_logic_vector(15 downto 0);
		
		mem_read_address	: out std_logic_vector(7 downto 0);
		instruction			: out std_logic_vector(15 downto 0);
		mem_read_valid		: out std_logic;
		
		fetcher_state		: buffer std_logic_vector(2 downto 0)
	);
	end component;
		
	signal clock, reset, prog_mem_read_ready, prog_mem_read_valid: std_logic := '0';
	signal f_mem_read_address, prog_mem_read_address : std_logic_vector(7 downto 0);
	signal f_instruction : std_logic_vector(15 downto 0);
	signal fetcher_state, core_state: std_logic_vector(2 downto 0);
begin

prog_mem_block : prog_mem port map(clock, prog_mem_read_address, prog_mem_read_valid, f_instruction, prog_mem_read_ready);

fetcher_block : fetcher port map(
	clock => clock,
	reset => reset,
	mem_read_ready => prog_mem_read_ready,
	mem_read_address => prog_mem_read_address,
	core_state => core_state,
	current_pc => f_mem_read_address,
	mem_read_data => f_instruction, 
	mem_read_valid => prog_mem_read_valid,
	fetcher_state => fetcher_state
);
clk_sim : process begin
for i in 0 to 100 loop
	clock <= '1';
	wait for clk_period;
	clock <= '0';
	wait for clk_period;
end loop;
	wait;
end process;

--mem_stim : process begin
--	report "1";
--	prog_mem_read_address <= "00000000";
--	report "1";
--	prog_mem_read_valid <= '1';
--	report "1";
--	wait for clk_period;
--	prog_mem_read_valid <= '0';
--	wait for clk_period;
--	prog_mem_read_address <= "00000001";
--	prog_mem_read_valid <= '1';
--	wait for clk_period;
--	wait;
--end process;

fetcher_stim : process begin
	reset <= '1';
	wait for 2*clk_period;
	reset <= '0';
	wait for clk_period;
	core_state <= "000";
	wait for 2*clk_period;
	core_state <= "001";
	f_mem_read_address <= "00000001";
	wait for 50*clk_period;
	report "A";
	if fetcher_state = "010" then
		report "B";
		core_state <= "010";
	end if;
	wait for 3*clk_period;
	f_mem_read_address <= "00000010";
	core_state <= "001";
	wait;
end process;
end behav;