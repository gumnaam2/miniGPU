library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.types.all;

entity sm is port
(
	clock, reset, start, enable: in std_logic;
	fetcher_mem_read_ready : in std_logic_vector(prog_num_channels - 1 downto 0);
	mem_read_ready_arr, mem_write_ready_arr : in std_logic_vector(n_cores - 1 downto 0); 
	grid_num_threads, block_id : in std_logic_vector(7 downto 0);
	thread_id : in std_logic_vector(n_cores*8 - 1 downto 0);
	thread_count : in std_logic_vector(n_threads_bits - 1 downto 0);
	fetcher_mem_read_valid, done : out std_logic;
	mem_read_data_arr : in  std_logic_vector(8*(n_cores) - 1 downto 0);
	fetcher_mem_read_data : in std_logic_vector(prog_data_bits - 1 downto 0);
	fetcher_mem_read_address : out std_logic_vector(prog_addr_bits-1 downto 0);
	lsu_mem_read_valid_arr, lsu_mem_write_valid_arr : out std_logic_vector(n_cores - 1 downto 0);
	mem_write_data_arr, mem_write_address_arr, mem_read_address_arr : out std_logic_vector(8*(n_cores) - 1 downto 0)
);
end sm;

architecture arch of sm is
	signal decoded_ret, mem_read_enable, mem_write_enable : std_logic;
	signal fetcher_state, sm_state : std_logic_vector(2 downto 0);
	signal lsu_state, new_pc, current_pc : std_logic_vector(7 downto 0);
	signal fetcher_instruction : std_logic_vector(15 downto 0);
	signal fetcher_mem_write_ready: std_logic;
	
	
	signal nzp_instr : std_logic_vector(2 downto 0);
	signal rs_address, rt_address, rd_address: std_logic_vector(3 downto 0);
	signal immediate : std_logic_vector(7 downto 0);
	signal reg_write_enable, nzp_write_enable: std_logic;
	signal reg_input_mux : std_logic_vector(1 downto 0);
	signal alu_select : std_logic_vector(2 downto 0);
	signal pc_out_mux : std_logic;
	signal instruction : std_logic_vector(15 downto 0);

--	signal block_id: std_logic_vector(7 downto 0);
	signal thread_lsu_state_arr : std_logic_vector(n_cores*2 - 1 downto 0);
	signal thread_enable : std_logic_vector(n_cores - 1 downto 0);


--	type vector_7_arr is array(3 downto 0) of std_logic_vector(7 downto 0);
--	signal mem_write_data_arr : vector_7_arr;
--	signal mem_write_address_arr : vector_7_arr;
--	signal mem_read_address_arr : vector_7_arr;
	signal new_pc_arr : vector_8_arr;
--	
	component scheduler is port(
		clock, reset, start						: in std_logic;
		decoded_ret									: in std_logic; --whether the program end is reached
		mem_read_enable, mem_write_enable	: in std_logic; --enable read/write from the memory
		fetcher_state	: in std_logic_vector(2 downto 0);
		lsu_state		: in std_logic_vector(2*n_cores - 1 downto 0);
		new_pc			: in std_logic_vector(7 downto 0); --next program line to be fetched
		
		sm_state		: buffer std_logic_vector(2 downto 0);
		current_pc		: out std_logic_vector(7 downto 0);
		done				: out std_logic
	);
	end component;
	
	component core is port(
		clock, reset, enable								:in std_logic;
		sm_state											:in std_logic_vector(2 downto 0);
		alu_select											:in std_logic_vector(2 downto 0);
		rs_address, rt_address, rd_address			:in std_logic_vector(3 downto 0);
		immediate, current_pc							:in std_logic_vector(7 downto 0);
		block_id, grid_num_threads						:in std_logic_vector(7 downto 0);
		thread_id											:in std_logic_vector(7 downto 0); --ID of a particular thread
		nzp_write_enable, reg_write_enable			:in std_logic;
		pc_out_mux											:in std_logic;
		mem_write_enable, mem_read_enable			:in std_logic;
		nzp_instr											:in std_logic_vector(2 downto 0);
		reg_input_mux										:in std_logic_vector(1 downto 0);
		mem_read_ready, mem_write_ready				:in std_logic;
		mem_read_data										:in std_logic_vector(7 downto 0);
		
		lsu_mem_read_valid, lsu_mem_write_valid	:out std_logic;
		mem_read_address, mem_write_address			:out std_logic_vector(7 downto 0);
		mem_write_data										:out std_logic_vector(7 downto 0);		
		new_pc												:out std_logic_vector(7 downto 0);
		thread_lsu_state									:out std_logic_vector(1 downto 0)
	);
	end component;
begin
	enable_threads: process(clock) begin
		if rising_edge(clock) then
			if enable = '1' then
				for i in 0 to n_cores - 1 loop
					if i < to_integer(unsigned(thread_count)) then
						thread_enable(i) <= '1';
					else
						thread_enable(i) <= '0';
					end if;
				end loop;
			else
				thread_enable <= (others => '0');
			end if;
		end if;
	end process;

	scheduler_block: scheduler port map (
		clock => clock, reset => reset, start => start,
		decoded_ret => decoded_ret, mem_read_enable => mem_read_enable, mem_write_enable => mem_write_enable,
		fetcher_state => fetcher_state, lsu_state => thread_lsu_state_arr,
		new_pc => new_pc, sm_state => sm_state,
		current_pc => current_pc, done => done);
		
	fetcher_block: entity work.fetcher(fsm) port map(
		clock => clock, reset => reset, mem_read_ready => fetcher_mem_read_ready(0),
		sm_state => sm_state, current_pc => current_pc, 
		mem_read_data => fetcher_mem_read_data, mem_read_address => fetcher_mem_read_address, --change on confirmation
		instruction => fetcher_instruction, mem_read_valid => fetcher_mem_read_valid,
		fetcher_state => fetcher_state);
		
	decoder_block: entity work.decoder(arch) port map(
		clock => clock, reset => reset, sm_state => sm_state,
		instr => fetcher_instruction,
		rs_address => rs_address, rt_address => rt_address, rd_address => rd_address,
		nzp_instr => nzp_instr, immediate => immediate,
		reg_write_enable=> reg_write_enable, nzp_write_enable=>nzp_write_enable, mem_read_enable=> mem_read_enable, 
		mem_write_enable=> mem_write_enable,
		reg_input_mux => reg_input_mux,
		alu_select => alu_select,
		pc_out_mux => pc_out_mux, decoded_ret => decoded_ret);
	threads: for i in 0 to n_cores - 1 generate
		thread: entity work.core(arch) port map(
		clock => clock, reset => reset,
		enable => thread_enable(i),
		sm_state => sm_state, alu_select => alu_select,
		rs_address => rs_address, rt_address => rt_address, rd_address => rd_address,
		immediate => immediate, current_pc => current_pc,
		block_id => block_id, grid_num_threads => grid_num_threads,
		thread_id => thread_id((i+1)*8 - 1 downto i*8),
		nzp_write_enable => nzp_write_enable, reg_write_enable => reg_write_enable,
		pc_out_mux => pc_out_mux, mem_write_enable => mem_write_enable, mem_read_enable => mem_read_enable,
		nzp_instr => nzp_instr, reg_input_mux => reg_input_mux, 
		mem_read_ready => mem_read_ready_arr(i),
		mem_write_ready => mem_write_ready_arr(i),
		mem_read_data => mem_read_data_arr(8*(i+1)-1 downto 8*i),
		mem_read_address => mem_read_address_arr(8*(i+1)-1 downto 8*i),
		mem_write_address => mem_write_address_arr(8*(i+1)-1 downto 8*i),
		mem_write_data => mem_write_data_arr(8*(i+1)-1 downto 8*i),
		new_pc => new_pc_arr(i),
		lsu_mem_read_valid => lsu_mem_read_valid_arr(i),
		lsu_mem_write_valid => lsu_mem_write_valid_arr(i),
		thread_lsu_state => thread_lsu_state_arr(2*i+1 downto 2*i)
	);
	end generate;
--	
--	mem_read_address <= mem_read_address_arr(0);
--	mem_write_address <= mem_write_address_arr(0);
--	mem_write_data <= mem_write_data_arr(0);
	new_pc <= new_pc_arr(0);
end arch;