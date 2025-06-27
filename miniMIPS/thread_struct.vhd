library ieee;
use ieee.std_logic_1164.all;

entity thread_struct is
port(
	clock, reset, enable								:in std_logic;
	core_state											:in std_logic_vector(2 downto 0);
	alu_select											:in std_logic_vector(1 downto 0);
	rs_address, rt_address, rd_address			:in std_logic_vector(3 downto 0);
	immediate, current_pc							:in std_logic_vector(7 downto 0);
	block_id												:in std_logic_vector(7 downto 0);
	nzp_write_enable, reg_write_enable			:in std_logic;
	pc_out_mux											:in std_logic;
	mem_write_en, mem_read_en						:in std_logic;
	nzp_instr											:in std_logic_vector(2 downto 0);
	reg_input_mux										:in std_logic_vector(1 downto 0);
	mem_read_ready, mem_write_ready				:in std_logic;
	mem_read_data										:in std_logic_vector(7 downto 0);

	mem_read_address, mem_write_address			:out std_logic_vector(7 downto 0);
	mem_write_data										:out std_logic_vector(7 downto 0);		
	new_pc												:out std_logic_vector(7 downto 0)
);
end thread_struct;

architecture connections of thread_struct is
	component rf is port (
			clock,reset,enable:in std_logic;
			core_state			:in std_logic_vector(2 downto 0);
			reg_write_enable	:in std_logic;
			alu_out,lsu_out	:in std_logic_vector(7 downto 0);
			immediate			:in std_logic_vector(7 downto 0);
			reg_input_mux		:in std_logic_vector(1 downto 0);
			rs_address			:in std_logic_vector(3 downto 0);
			rt_address			:in std_logic_vector(3 downto 0);
			rd_address			:in std_logic_vector(3 downto 0);
			block_id				:in std_logic_vector(7 downto 0);
			
			rs_data				:out std_logic_vector(7 downto 0);
			rt_data				:out std_logic_vector(7 downto 0)
		 );
	end component;
	
	component pc_nzp is port(
		clock, reset, enable, nzp_write_enable 	:in std_logic;
		pc_out_mux	 										:in std_logic;
		core_state 											:in std_logic_vector(2 downto 0);
		nzp_instr, nzp_out 								:in std_logic_vector(2 downto 0);
		current_pc, immediate 							:in std_logic_vector(7 downto 0);
		
		new_pc 												:out std_logic_vector(7 downto 0)
	);
	end component;
	
	component alu is port(
		clock			:in std_logic;
		reset			:in std_logic;
		enable		:in std_logic;
		operand_1	:in std_logic_vector(7 downto 0);
		operand_2	:in std_logic_vector (7 downto 0);
		alu_select	:in std_logic_vector (1 downto 0);
		core_state	:in std_logic_vector(2 downto 0);
		
		alu_out		:out std_logic_vector(7 downto 0);
		alu_nzp		:out std_logic_vector(2 downto 0)
	);
	end component;
	component lsu is port (
		clock, reset, enable					:in std_logic;
		mem_read_en, mem_write_en:in std_logic;
		core_state								:in std_logic_vector(2 downto 0);
		rs_out, rt_out							:in std_logic_vector(7 downto 0);
		mem_read_ready, mem_write_ready	:in std_logic;
		mem_read_data							:in std_logic_vector(7 downto 0);
		
		mem_read_addr, mem_write_addr		:out std_logic_vector(7 downto 0);
		mem_write_data							:out std_logic_vector(7 downto 0);
		out_lsu_state							:out std_logic_vector(1 downto 0);
		lsu_out									:out std_logic_vector(7 downto 0)
	);
	end component;
	signal rs_data_wire, rt_data_wire, alu_out_wire, lsu_out_wire: std_logic_vector(7 downto 0);
	signal alu_nzp_wire: std_logic_vector(2 downto 0);
	signal out_lsu_state_wire: std_logic_vector(1 downto 0);
begin
	rf_block:
		rf port map (
			 clock           => clock,
			 reset           => reset,
			 enable          => enable,
			 core_state      => core_state,
			 reg_write_enable=> reg_write_enable,
			 alu_out         => alu_out_wire,
			 lsu_out         => lsu_out_wire,
			 immediate       => immediate,
			 reg_input_mux   => reg_input_mux,
			 rs_address      => rs_address,
			 rt_address      => rt_address,
			 rd_address      => rd_address,
			 block_id        => block_id,
			 rs_data         => rs_data_wire,
			 rt_data         => rt_data_wire
		);
	alu_block:
		alu port map(
		 clock       => clock,
		 reset       => reset,
		 enable      => enable,
		 operand_1   => rt_data_wire,
		 operand_2   => rs_data_wire,
		 alu_select  => alu_select,
		 core_state  => core_state,
		 alu_out     => alu_out_wire,
		 alu_nzp     => alu_nzp_wire
		);
	pc_nzp_block: pc_nzp port map (
		 clock              => clock,
		 reset              => reset,
		 enable             => enable,
		 nzp_write_enable   => nzp_write_enable,
		 pc_out_mux         => pc_out_mux,
		 core_state         => core_state,
		 nzp_instr          => nzp_instr,
		 nzp_out            => alu_nzp_wire,
		 current_pc         => current_pc,
		 immediate          => immediate,
		 new_pc             => new_pc
	);
	lsu_block: lsu port map(
			clock              => clock,
			reset              => reset,
			enable             => enable,
			mem_read_en        => mem_read_en,
			mem_write_en       => mem_write_en,
			core_state         => core_state,
			rs_out             => rs_data_wire,
			rt_out             => rt_data_wire,
			mem_read_ready     => mem_read_ready,
			mem_write_ready    => mem_write_ready,
			mem_read_data      => mem_read_data,
			mem_read_addr      => mem_read_address,
			mem_write_addr     => mem_write_address,
			mem_write_data     => mem_write_data,
			out_lsu_state      => out_lsu_state_wire,
			lsu_out            => lsu_out_wire
		);
end connections;
	