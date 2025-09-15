library std;
use std.textio.all;
library ieee;
use ieee.std_logic_1164.all;
use work.types.all;

entity lsu_sim is
end lsu_sim;

architecture sim_arch of lsu_sim is

	component lsu is port (
		clock, reset, enable							:in std_logic;
		mem_read_enable, mem_write_enable		:in std_logic;
		core_state										:in std_logic_vector(2 downto 0);
		rs_out, rt_out									:in std_logic_vector(7 downto 0);
		mem_read_ready, mem_write_ready			:in std_logic;
		mem_read_data									:in std_logic_vector(7 downto 0);
		
		mem_read_valid, mem_write_valid			:out std_logic;
		mem_read_addr, mem_write_addr				:out std_logic_vector(7 downto 0);
		mem_write_data									:out std_logic_vector(7 downto 0);
		out_lsu_state									:out std_logic_vector(1 downto 0);
		lsu_out											:out std_logic_vector(7 downto 0)
	);
	end component;
	
	component data_mem is port(
		clock : in std_logic;
		data_mem_read_address, data_mem_write_address : in std_logic_vector(7 downto 0);
		data_mem_read_valid, data_mem_write_valid : in std_logic;
		data_mem_write_data : in std_logic_vector(7 downto 0);
		
		data_mem_read_data : out std_logic_vector(7 downto 0);
		data_mem_read_ready, data_mem_write_ready: out std_logic
	);
	end component;
	
	signal clock, reset, enable, mem_read_enable, mem_write_enable, mem_read_ready,
			mem_write_ready, mem_read_valid, mem_write_valid: std_logic := '0';
	signal mem_read_address, mem_write_address, rs_out, rt_out, mem_read_data, mem_write_data, lsu_out : std_logic_vector(7 downto 0);
	
	signal core_state: std_logic_vector(2 downto 0);
	signal out_lsu_state : std_logic_vector(1 downto 0);
begin

--prog_mem_block : prog_mem port map(clock, prog_mem_read_address, prog_mem_read_valid, f_instruction, prog_mem_read_ready);

data_mem_block: data_mem port map(
	clock, mem_read_address, mem_write_address, mem_read_valid, mem_write_valid,
	mem_write_data, mem_read_data, mem_read_ready, mem_write_ready);

lsu_block : lsu port map(
		clock, reset, enable,
		mem_read_enable, mem_write_enable,
		core_state,
		rs_out, rt_out,
		mem_read_ready, mem_write_ready,
		mem_read_data,
		mem_read_valid, mem_write_valid,
		mem_read_address, mem_write_address,
		mem_write_data,
		out_lsu_state,
		lsu_out);
clk_sim : process begin
for i in 0 to 100 loop
	clock <= '1';
	wait for clk_period;
	clock <= '0';
	wait for clk_period;
end loop;
	wait;
end process;

lsu_stim : process begin
	reset <= '1';
	enable <= '1';
	wait for 2*clk_period;
	reset <= '0';
	wait for clk_period;
	core_state <= "000";
	wait for clk_period;
	
	--test load instruction
	mem_read_enable <= '1';
	rs_out <= "00000010";
	core_state <= "011";
	wait for 7*clk_period;
--	report to_hstring(lsu_out);
--	wait for 2*clk_period;
	core_state <= "110";
--	mem_read_enable <= '0';
	wait for 5*clk_period;

	report "LOAD DONE";
	--store instruction
	core_state <= "011";
	mem_read_enable <= '0';
	mem_write_enable <= '1';
	rs_out <= "00000010";
	rt_out <= "11101111";
	wait for 7*clk_period;
	core_state <= "110";
	wait for 2*clk_period;
	mem_write_enable <= '0';
	
	report "STORE DONE";

	mem_read_enable <= '1';
	rs_out <= "00000010";
	core_state <= "011";
	wait for 7*clk_period;
--	report to_hstring(lsu_out);
	core_state <= "110";
	wait for 5*clk_period;

	wait;
end process;
end sim_arch;