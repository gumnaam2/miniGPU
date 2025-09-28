library ieee;
use ieee.std_logic_1164.all;

use work.types.all;

entity gpu_dut is port(
	clock, start, reset, enable, dcr_write_enable : in std_logic;
	grid_num_blocks_in, grid_num_threads_in : in std_logic_vector(7 downto 0);
	grid_done : out std_logic
);
end gpu_dut;

architecture arch of gpu_dut is

--internal signals

--dcr to dispatcher
signal grid_num_blocks, grid_num_threads : std_logic_vector(7 downto 0);

signal dcr_thread_count : std_logic_vector(7 downto 0);

--core to dispatcher
signal sm_done : std_logic_vector(n_cores - 1 downto 0);

--dispatcher to core
signal sm_start, sm_reset : std_logic_vector(n_cores - 1 downto 0);
signal sm_block_id : std_logic_vector(n_cores*8 - 1 downto 0);
signal sm_thread_count : std_logic_vector(n_cores*n_threads_bits-1 downto 0);
signal sm_thread_id : std_logic_vector(n_cores*n_threads*8 - 1 downto 0);

--core to memory controller
signal fetcher_mem_read_valid_arr : std_logic_vector(n_cores - 1 downto 0);
signal fetcher_mem_read_address_arr : std_logic_vector(prog_num_consumers*prog_addr_bits - 1 downto 0);
signal lsu_mem_read_valid_arr, lsu_mem_write_valid_arr : std_logic_vector(data_num_consumers - 1 downto 0);
signal lsu_mem_write_data_arr : std_logic_vector(data_num_consumers*data_data_bits - 1 downto 0);
signal lsu_mem_read_address_arr, lsu_mem_write_address_arr : std_logic_vector(data_num_consumers*data_addr_bits - 1 downto 0);

--memory controller to core
signal lsu_mem_read_ready_arr, lsu_mem_write_ready_arr : std_logic_vector(data_num_consumers - 1 downto 0);
signal lsu_mem_read_data_arr : std_logic_vector(data_num_consumers*data_data_bits - 1 downto 0);
signal fetcher_mem_read_ready_arr : std_logic_vector(prog_num_consumers - 1 downto 0);
signal fetcher_mem_read_data_arr : std_logic_vector(prog_num_consumers*prog_data_bits - 1 downto 0);

begin

dcr_inst: entity work.dcr(arch) port map(
	clock => clock,
	reset => reset,
	dcr_write_enable => dcr_write_enable,
	grid_num_blocks_in => grid_num_blocks_in,
	grid_num_threads_in => grid_num_threads_in,
	
	grid_num_blocks => grid_num_blocks,
	grid_num_threads => grid_num_threads);

dispatcher_inst: entity work.dispatcher_2(arch) port map(
	grid_num_blocks => grid_num_blocks,
	grid_num_threads => grid_num_threads,
	clock => clock,
	start => start,
	reset => reset,
	sm_done => sm_done,
	thread_ids => sm_thread_id,
	block_ids => sm_block_id,
	sm_thread_count => sm_thread_count,

	sm_reset => sm_reset, 
	sm_start => sm_start,

	grid_done => grid_done);
	
sm_insts: for i in 0 to n_cores - 1 generate
	ith_sm: entity work.core(arch) port map(
		clock => clock, reset => sm_reset(i),
		start => sm_start(i),
		enable => enable,
		fetcher_mem_read_ready => fetcher_mem_read_ready_arr(i downto i), --change
		mem_read_ready_arr => lsu_mem_read_ready_arr(n_threads*(i+1)-1 downto n_threads*i),
		mem_write_ready_arr => lsu_mem_write_ready_arr(n_threads*(i+1)-1 downto n_threads*i),
		block_id => sm_block_id(8*(i+1) - 1 downto 8*i),
		grid_num_threads => grid_num_threads,
		thread_count => sm_thread_count(n_threads_bits*(i+1) - 1 downto n_threads_bits*i),
		thread_id => sm_thread_id(n_threads*8*(i+1) - 1 downto n_threads*8*i),
		fetcher_mem_read_valid => fetcher_mem_read_valid_arr(i),
		done => sm_done(i),
		mem_read_data_arr => lsu_mem_read_data_arr((i+1)*n_threads*data_data_bits-1 downto i*n_threads*data_data_bits),
		fetcher_mem_read_data => fetcher_mem_read_data_arr(prog_data_bits*(i+1) - 1 downto prog_data_bits*i),
		fetcher_mem_read_address => fetcher_mem_read_address_arr(8*(i+1)-1 downto 8*i),
		lsu_mem_read_valid_arr => lsu_mem_read_valid_arr(n_threads*(i+1)-1 downto n_threads*i),
		lsu_mem_write_valid_arr => lsu_mem_write_valid_arr(n_threads*(i+1)-1 downto n_threads*i),
		mem_write_data_arr => lsu_mem_write_data_arr(n_threads*data_data_bits*(i+1)-1 downto n_threads*data_data_bits*i),
		mem_write_address_arr => lsu_mem_write_address_arr(n_threads*data_addr_bits*(i+1) - 1 downto n_threads*data_addr_bits*i),
		mem_read_address_arr => lsu_mem_read_address_arr(n_threads*data_addr_bits*(i+1) - 1 downto n_threads*data_addr_bits*i)
	);
end generate;


data_mem: entity work.ram_with_controller(arch)
	generic map(
		num_consumers => n_threads*n_cores
	)
	port map(
		reset => reset,
		clock => clock,
		consumer_read_addr => lsu_mem_read_address_arr,
		consumer_read_req  => lsu_mem_read_valid_arr,
		consumer_write_addr=> lsu_mem_write_address_arr,
		consumer_write_data=> lsu_mem_write_data_arr,
		consumer_write_req => lsu_mem_write_valid_arr,
		consumer_read_done => lsu_mem_read_ready_arr,
		consumer_write_done=> lsu_mem_write_ready_arr,
		consumer_read_data => lsu_mem_read_data_arr
	);


progmem: entity work.prog_mem_with_controller(arch)
	generic map(
		num_consumers => n_cores
	)
	port map(
		reset => reset,
		clock => clock,

		consumer_read_addr => fetcher_mem_read_address_arr,
		consumer_read_req => fetcher_mem_read_valid_arr,
		consumer_read_done => fetcher_mem_read_ready_arr,
		consumer_read_data => fetcher_mem_read_data_arr,
		
		consumer_write_req => (others => '0'),
		consumer_write_addr => (others => '0'),
		consumer_write_data => (others => '0')
	);

end arch;