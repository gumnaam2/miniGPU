library ieee;
use ieee.std_logic_1164.all;
use work.types.all;

entity core is port
(
	clock, reset, start, enable: in std_logic;
	fetcher_mem_read_ready : in std_logic_vector(prog_num_channels - 1 downto 0);
	mem_read_ready_arr, mem_write_ready_arr : in std_logic_vector(n_threads - 1 downto 0); 
	block_id : in std_logic_vector(7 downto 0);
	thread_id : in std_logic_vector(n_threads*2 - 1 downto 0);
	fetcher_mem_read_valid, done : out std_logic;
	mem_read_data_arr : in  std_logic_vector(8*(n_threads) - 1 downto 0);
	fetcher_mem_read_data : in std_logic_vector(prog_data_bits - 1 downto 0);
	fetcher_mem_read_address : out std_logic_vector(prog_addr_bits-1 downto 0);
	lsu_mem_read_valid_arr, lsu_mem_write_valid_arr : out std_logic_vector(n_threads - 1 downto 0);
	mem_write_data_arr, mem_write_address_arr, mem_read_address_arr : out std_logic_vector(8*(n_threads) - 1 downto 0)
);
end core;

architecture connections of core is
	signal decoded_ret, mem_read_enable, mem_write_enable : std_logic;
	signal fetcher_state, core_state : std_logic_vector(2 downto 0);
	signal lsu_state, new_pc, current_pc : std_logic_vector(7 downto 0);
	signal fetcher_instruction : std_logic_vector(15 downto 0);
	signal fetcher_mem_write_ready: std_logic;
	
	signal nzp_instr : std_logic_vector(2 downto 0);
	signal rs_address, rt_address, rd_address: std_logic_vector(3 downto 0);
	signal immediate : std_logic_vector(7 downto 0);
	signal reg_write_enable, nzp_write_enable: std_logic;
	signal reg_input_mux, alu_select : std_logic_vector(1 downto 0);
	signal pc_out_mux : std_logic;
	signal instruction : std_logic_vector(15 downto 0);

--	signal block_id: std_logic_vector(7 downto 0);
	signal thread_lsu_state_arr : std_logic_vector(7 downto 0);


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
		lsu_state		: in std_logic_vector(7 downto 0);
		new_pc			: in std_logic_vector(7 downto 0); --next program line to be fetched
		
		core_state		: buffer std_logic_vector(2 downto 0);
		current_pc		: out std_logic_vector(7 downto 0);
		done				: out std_logic
	);
	end component;

	component decoder is port(
		clock, reset		: in std_logic;
		core_state			: in std_logic_vector(2 downto 0);
		instr			: in std_logic_vector(15 downto 0); -- the program line
		
		rs_address, rt_address, rd_address	: out std_logic_vector(3 downto 0);
		-- Rs, Rt, Rd register addresses respectively.
		-- Generally, Rs, Rt values are operands; Rd is written into; as explained in instruction set
		
		nzp_instr	: out std_logic_vector(2 downto 0); --neg/zero/pos value to be had by the comparison
		immediate	: out std_logic_vector(7 downto 0);
		
		reg_write_enable, nzp_write_enable, mem_read_enable, mem_write_enable	: out std_logic;
		
		reg_input_mux	: out std_logic_vector(1 downto 0); -- RF to read which of ALU/LSU/IMM
		alu_select		: out std_logic_vector(1 downto 0); -- which op ALU performs
		pc_out_mux		: out std_logic; -- whether to load an immediate pc line
		decoded_ret		: out std_logic --RETURN signal, to end the program
	);
	end component;
	
	component thread_struct is port(
		clock, reset, enable								:in std_logic;
		core_state											:in std_logic_vector(2 downto 0);
		alu_select											:in std_logic_vector(1 downto 0);
		rs_address, rt_address, rd_address			:in std_logic_vector(3 downto 0);
		immediate, current_pc							:in std_logic_vector(7 downto 0);
		block_id												:in std_logic_vector(7 downto 0);
		thread_id											:in std_logic_vector(1 downto 0); --ID of a particular thread
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
	scheduler_block: scheduler port map (
		clock => clock, reset => reset, start => start,
		decoded_ret => decoded_ret, mem_read_enable => mem_read_enable, mem_write_enable => mem_write_enable,
		fetcher_state => fetcher_state, lsu_state => thread_lsu_state_arr,
		new_pc => new_pc, core_state => core_state,
		current_pc => current_pc, done => done);
		
	fetcher_block: entity work.fetcher(fsm) port map(
		clock => clock, reset => reset, mem_read_ready => fetcher_mem_read_ready(0),
		core_state => core_state, current_pc => current_pc, 
		mem_read_data => fetcher_mem_read_data, mem_read_address => fetcher_mem_read_address, --change on confirmation
		instruction => fetcher_instruction, mem_read_valid => fetcher_mem_read_valid,
		fetcher_state => fetcher_state);
		
	decoder_block: decoder port map(
		clock => clock, reset => reset, core_state => core_state,
		instr => fetcher_instruction,
		rs_address => rs_address, rt_address => rt_address, rd_address => rd_address,
		nzp_instr => nzp_instr, immediate => immediate,
		reg_write_enable=> reg_write_enable, nzp_write_enable=>nzp_write_enable, mem_read_enable=> mem_read_enable, 
		mem_write_enable=> mem_write_enable,
		reg_input_mux => reg_input_mux, alu_select => alu_select,
		pc_out_mux => pc_out_mux, decoded_ret => decoded_ret);
	threads: for i in 0 to n_threads - 1 generate
		thread: thread_struct port map(
		clock => clock, reset => reset, enable => enable,
		core_state => core_state, alu_select => alu_select,
		rs_address => rs_address, rt_address => rt_address, rd_address => rd_address,
		immediate => immediate, current_pc => current_pc,
		block_id => block_id,
		thread_id => thread_id((i+1)*2 - 1 downto i*2),
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
end connections;