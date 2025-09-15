library ieee;
use ieee.std_logic_1164.all;

use work.types.all;

entity thread_decoder_sim is
end thread_decoder_sim;

architecture behav of thread_decoder_sim is
	signal clock, reset, reg_write_enable, nzp_write_enable, mem_read_enable, mem_write_enable, pc_out_mux, decoded_ret : std_logic;
	signal reg_input_mux, alu_select	: std_logic_vector(1 downto 0);
	signal core_state, nzp_instr : std_logic_vector(2 downto 0);
	signal rs_address, rt_address, rd_address : std_logic_vector(3 downto 0);
	signal immediate : std_logic_vector(7 downto 0);
	signal instr : std_logic_vector(15 downto 0);
	signal enable : std_logic := '1';

	signal mem_read_address, mem_write_address : std_logic_vector(7 downto 0);
	signal lsu_mem_read_valid, lsu_mem_write_valid, mem_read_ready, mem_write_ready : std_logic;
	signal mem_write_data, mem_read_data : std_logic_vector(7 downto 0);		
	signal new_pc : std_logic_vector(7 downto 0);
	signal thread_lsu_state : std_logic_vector(1 downto 0);
	
	signal block_id : std_logic_vector(7 downto 0);
	signal thread_id : std_logic_vector(1 downto 0);
	signal current_pc : std_logic_vector(7 downto 0);
	
begin
thread_inst : entity work.thread_struct(connections) port map (
	clock => clock,
	reset => reset,
	enable => enable,
	core_state => core_state,
	alu_select => alu_select,
	rs_address => rs_address,
	rt_address => rt_address,
	rd_address => rd_address,
	immediate => immediate,
	current_pc => current_pc,
	block_id => block_id,
	thread_id => thread_id,
	nzp_write_enable => nzp_write_enable,
	reg_write_enable => reg_write_enable,
	pc_out_mux => pc_out_mux,
	mem_write_enable => mem_write_enable,
	mem_read_enable => mem_read_enable,
	nzp_instr => nzp_instr,
	reg_input_mux => reg_input_mux,
	mem_read_ready => mem_read_ready,
	mem_write_ready => mem_write_ready,
	mem_read_data => mem_read_data,
	mem_read_address => mem_read_address,
	mem_write_address => mem_write_address,
	lsu_mem_read_valid => lsu_mem_read_valid,
	lsu_mem_write_valid => lsu_mem_write_valid,
	mem_write_data => mem_write_data,
	new_pc => new_pc,
	thread_lsu_state => thread_lsu_state
);

decoder_inst : entity work.decoder port map (
	clock => clock,
	reset => reset,
	core_state => core_state,
	instr => instr,
	rs_address => rs_address,
	rt_address => rt_address,
	rd_address => rd_address,
	nzp_instr => nzp_instr,
	immediate => immediate,
	reg_write_enable => reg_write_enable,
	nzp_write_enable => nzp_write_enable,
	mem_read_enable => mem_read_enable,
	mem_write_enable => mem_write_enable,
	reg_input_mux => reg_input_mux,
	alu_select => alu_select,
	pc_out_mux => pc_out_mux,
	decoded_ret => decoded_ret
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

decod_stim : process begin
	reset <= '1'; wait for clk_period; reset <= '0';
	
	core_state <= "010"; instr <= "1001111110101011";
	wait for clk_period;
	wait;
end process;

end behav;