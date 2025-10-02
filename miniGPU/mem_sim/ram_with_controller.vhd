
library ieee;
use ieee.std_logic_1164.all;

use work.types.all;

entity core_RAM_dut is port(
	clock, reset, start, enable: in std_logic;
	block_id, grid_num_threads : in std_logic_vector(7 downto 0);
	thread_id : in std_logic_vector(n_cores*2 - 1 downto 0);
);
end core_RAM_dut;

architecture dut_arch of core_RAM_dut is

signal fetcher_mem_read_ready	: std_logic_vector(prog_num_channels - 1 downto 0) := (others => '0');
signal mem_read_ready_arr, mem_write_ready_arr : std_logic_vector(n_cores - 1 downto 0) := (others => '0');
signal fetcher_mem_read_address : std_logic_vector(prog_addr_bits - 1 downto 0) := (others => '0');

signal mem_read_data_arr, mem_write_data_arr, mem_write_address_arr, mem_read_address_arr:
	std_logic_vector(data_addr_bits*n_cores - 1 downto 0) := (others => '0');

signal fetcher_mem_read_data : std_logic_vector(15 downto 0) := (others => '0');

signal fetcher_mem_read_valid, done : std_logic := '0';

signal lsu_mem_read_valid_arr, lsu_mem_write_valid_arr : std_logic_vector(n_cores - 1 downto 0) := (others => '0');

begin

ram: entity work.ram_with_controller(arch) port map(
	reset => reset,
	clock => clock,
	consumer_read_addr => mem_read_address_arr,
	consumer_read_req  => lsu_mem_read_valid_arr,
	consumer_write_addr=> mem_write_address_arr,
	consumer_write_data=> mem_write_data_arr,
	consumer_write_req => lsu_mem_write_valid_arr,
	consumer_read_done => mem_read_ready_arr,
	consumer_write_done=> mem_write_ready_arr,
	consumer_read_data => mem_read_data_arr
);

progmem: entity work.prog_mem_with_controller(arch) port map(
	reset => reset,
	clock => clock,

	consumer_read_addr => fetcher_mem_read_address,
	consumer_read_req(0) => fetcher_mem_read_valid,
	consumer_read_done => fetcher_mem_read_ready,
	consumer_read_data => fetcher_mem_read_data,
	
	consumer_write_req => (others => '0'),
	consumer_write_addr => (others => '0'),
	consumer_write_data => (others => '0')
);

sm: entity work.sm(arch) port map(
	clock => clock,
	reset => reset,
	start => start,
	enable => enable,

	fetcher_mem_read_ready => fetcher_mem_read_ready,
	mem_read_ready_arr => mem_read_ready_arr,
	mem_write_ready_arr => mem_write_ready_arr,

	grid_num_threads => grid_num_threads,
	block_id => block_id,
	thread_id => thread_id,

	fetcher_mem_read_valid => fetcher_mem_read_valid,
	done => done,

	mem_read_data_arr => mem_read_data_arr,
	fetcher_mem_read_data => fetcher_mem_read_data,
	fetcher_mem_read_address=> fetcher_mem_read_address,

	lsu_mem_read_valid_arr => lsu_mem_read_valid_arr,
	lsu_mem_write_valid_arr => lsu_mem_write_valid_arr,

	mem_write_data_arr => mem_write_data_arr,
	mem_write_address_arr => mem_write_address_arr,
	mem_read_address_arr => mem_read_address_arr
);

end dut_arch;
