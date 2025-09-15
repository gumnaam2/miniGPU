library std;
use std.textio.all;

library ieee;
use ieee.std_logic_1164.all;

use work.types.all;

entity core_sim is
end core_sim;

architecture behav of core_sim is
	signal clock, reset, start, enable, done : std_logic;
	signal fetcher_mem_read_ready, fetcher_mem_read_valid : std_logic_vector(0 downto 0);
	signal mem_read_ready_arr, mem_write_ready_arr, lsu_mem_read_valid_arr, lsu_mem_write_valid_arr : std_logic_vector(n_threads - 1 downto 0);
	signal block_id, fetcher_mem_read_address : std_logic_vector(7 downto 0);
	signal thread_id : std_logic_vector(n_threads*2 - 1 downto 0);
	signal fetcher_mem_read_data : std_logic_vector(15 downto 0);
	signal mem_read_data_arr, mem_write_data_arr, mem_write_address_arr, mem_read_address_arr : std_logic_vector(8*(n_threads) - 1 downto 0);
begin
prog_mem_inst : entity work.prog_mem(behav) port map(
	clock => clock,
	prog_mem_read_address => fetcher_mem_read_address,
	prog_mem_read_valid => fetcher_mem_read_valid,
	prog_mem_read_data => fetcher_mem_read_data,
	prog_mem_read_ready => fetcher_mem_read_ready);

data_mem_inst : entity work.data_mem(behav) port map(
	clock => clock,
	data_mem_read_address => mem_read_address_arr,
	data_mem_write_address => mem_write_address_arr,
	data_mem_read_valid => lsu_mem_read_valid_arr,
	data_mem_write_valid => lsu_mem_write_valid_arr,
	data_mem_write_data => mem_write_data_arr,
	data_mem_read_data => mem_read_data_arr,
	data_mem_read_ready => mem_read_ready_arr,
	data_mem_write_ready => mem_write_ready_arr);

core_inst : entity work.core(connections) port map(
	clock => clock,
	reset => reset,
	start => start,
	enable => enable,
	fetcher_mem_read_ready => fetcher_mem_read_ready,
	mem_read_ready_arr => mem_read_ready_arr,
	mem_write_ready_arr => mem_write_ready_arr,
	block_id => block_id,
	thread_id => thread_id,
	fetcher_mem_read_valid => fetcher_mem_read_valid(0), --change
	done => done,
	mem_read_data_arr => mem_read_data_arr,
	fetcher_mem_read_data => fetcher_mem_read_data,
	fetcher_mem_read_address => fetcher_mem_read_address,
	lsu_mem_read_valid_arr => lsu_mem_read_valid_arr,
	lsu_mem_write_valid_arr => lsu_mem_write_valid_arr,
	mem_write_data_arr => mem_write_data_arr,
	mem_write_address_arr => mem_write_address_arr,
	mem_read_address_arr => mem_read_address_arr);


clk_sim : process begin
	for i in 0 to 100 loop
		clock <= '1';
		wait for clk_period;
		clock <= '0';
		wait for clk_period;
	end loop;
		wait;
end process;

stim_proc: process begin
	block_id <= (others => '0');
	thread_id <= "11100100";
	reset <= '0'; start <= '0'; enable <= '0';
	
	wait for clk_period;
	
	reset <= '1'; start <= '1'; enable <= '1';
	wait for 2*clk_period;
	reset<='0';
	
	wait;
end process;
end behav;