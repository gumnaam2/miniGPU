library ieee;
use ieee.std_logic_1164.all;
use work.types.all;

entity gpu is
port(	
	--dcr pins
	clock, ext_reset, dcr_write_en, core_enable : in std_logic;
	dcr_data : in std_logic_vector(7 downto 0);
	
	--dispatcher pins
	start : in std_logic;
	
	--memory controller pins
	data_mem_read_ready : in std_logic_vector(data_num_channels - 1 downto 0);
	prog_mem_read_ready : in std_logic_vector(prog_num_channels - 1 downto 0);
	
	data_mem_write_ready : in std_logic_vector(data_num_channels - 1 downto 0);
	
	data_mem_read_data : in std_logic_vector(data_num_channels*data_data_bits - 1 downto 0);
	prog_mem_read_data : in std_logic_vector(prog_num_channels*prog_data_bits - 1 downto 0);
	
	data_mem_read_valid : out std_logic_vector(data_num_channels - 1 downto 0);
	prog_mem_read_valid : out std_logic_vector(prog_num_channels - 1 downto 0);
	
	data_mem_read_address : out std_logic_vector(data_num_channels*data_addr_bits - 1 downto 0);
	prog_mem_read_address : out std_logic_vector(prog_num_channels*prog_addr_bits - 1 downto 0);
	
	data_mem_write_valid : out std_logic_vector(data_num_channels - 1 downto 0);
	data_mem_write_address : out std_logic_vector(data_num_channels *data_addr_bits - 1 downto 0);
	data_mem_write_data : out std_logic_vector(data_num_channels*data_data_bits - 1 downto 0)
);
end gpu;

architecture gpu_arch of gpu is

--internal signals

signal dcr_thread_count : std_logic_vector(7 downto 0);

--core to dispatcher
signal core_done : std_logic_vector(n_cores - 1 downto 0);

--dispatcher to core
signal core_start, core_reset : std_logic_vector(n_cores - 1 downto 0);
signal core_block_id : std_logic_vector(n_cores*8 - 1 downto 0);
signal core_thread_count : core_thread_type;
signal core_thread_id : std_logic_vector(n_cores*n_threads*2 - 1 downto 0);

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

component dispatcher is port(
	clock, reset, start : in std_logic;
	core_done : in std_logic_vector(n_cores-1 downto 0); --DONE from each core
	thread_count : in std_logic_vector(7 downto 0); --total num of threads to be processed
	
	core_start, core_reset : buffer std_logic_vector(n_cores - 1 downto 0);
	core_block_id : out std_logic_vector(n_cores*8 - 1 downto 0);
	core_thread_count : out core_thread_type;
	core_thread_id : out std_logic_vector(n_cores*n_threads*2 - 1 downto 0) --2 bit ID for each thread
);
end component;

begin

dcr_block : entity work.dcr(register_write) port map(
	clock => clock, reset => ext_reset,
	dcr_write_enable => dcr_write_en,
	dcr_data => dcr_data,
	thread_count => dcr_thread_count
);

dispatcher_block : dispatcher port map(
	clock => clock, reset => ext_reset,
	start => start,
	thread_count => dcr_thread_count,
	core_done => core_done,
	core_start => core_start, core_reset => core_reset,
	core_block_id => core_block_id,
	core_thread_count => core_thread_count,
	core_thread_id => core_thread_id
);

data_mem_controller_block: entity work.mem_controller(fsm)
generic map(
	addr_bits => data_addr_bits,
	data_bits => data_data_bits,
	num_consumers => data_num_consumers,
	num_channels => data_num_channels,
	write_enable => '1'
)
port map (
	clock => clock, reset => ext_reset,
	consumer_read_valid => lsu_mem_read_valid_arr,
	consumer_read_address => lsu_mem_read_address_arr,
	consumer_write_valid => lsu_mem_write_valid_arr,
	consumer_write_address => lsu_mem_write_address_arr,
	consumer_write_data => lsu_mem_write_data_arr,
	mem_read_ready => data_mem_read_ready,
	mem_write_ready => data_mem_write_ready,
	mem_read_data => data_mem_read_data,
	consumer_read_ready => lsu_mem_read_ready_arr,
	consumer_read_data => lsu_mem_read_data_arr,
	consumer_write_ready => lsu_mem_write_ready_arr,
	mem_read_valid => data_mem_read_valid,
	mem_read_address => data_mem_read_address,
	mem_write_valid => data_mem_write_valid,
	mem_write_address => data_mem_write_address,
	mem_write_data => data_mem_write_data
);

prog_mem_controller_block: entity work.mem_controller(fsm)
generic map(
	addr_bits => prog_addr_bits,
	data_bits => prog_data_bits,
	num_consumers => prog_num_consumers,
	num_channels => prog_num_channels,
	write_enable => '0'
)
port map (
	clock => clock, reset => ext_reset,
	consumer_read_valid => fetcher_mem_read_valid_arr,
	consumer_read_address => fetcher_mem_read_address_arr,
--	consumer_write_valid => (others => '0'),
--	consumer_write_address => (others => (others => '0')),
--	consumer_write_data => (others => (others => '0')),
	mem_read_ready => prog_mem_read_ready,
--	mem_write_ready => prog_mem_write_ready,
	mem_read_data => prog_mem_read_data,
	consumer_read_ready => fetcher_mem_read_ready_arr,
	consumer_read_data => fetcher_mem_read_data_arr,
--	consumer_write_ready => (others => '0'),
	mem_read_valid => prog_mem_read_valid,
	mem_read_address => prog_mem_read_address
--	mem_write_valid => (others => '0'),
--	mem_write_address => (others => (others => '0')),
--	mem_write_data => (others => (others => '0'))
);

cores : for i in 0 to n_cores - 1 generate
nth_core: entity work.core(connections) port map (
	clock => clock, reset => core_reset(i),
	start => core_start(i),
	enable => core_enable,
	fetcher_mem_read_ready => fetcher_mem_read_ready_arr(i downto i), --change
	mem_read_ready_arr => lsu_mem_read_ready_arr(n_threads*(i+1)-1 downto n_threads*i),
	mem_write_ready_arr => lsu_mem_write_ready_arr(n_threads*(i+1)-1 downto n_threads*i),
	block_id => core_block_id(8*(i+1) - 1 downto 8*i),
	thread_id => core_thread_id(n_threads*2*(i+1) - 1 downto n_threads*2*i),
	fetcher_mem_read_valid => fetcher_mem_read_valid_arr(i),
	done => core_done(i),
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
end gpu_arch;