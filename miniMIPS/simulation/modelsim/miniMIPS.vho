-- Copyright (C) 2020  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 20.1.1 Build 720 11/11/2020 SJ Lite Edition"

-- DATE "06/27/2025 23:25:03"

-- 
-- Device: Altera 10M08DAF484C8G Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY FIFTYFIVENM;
LIBRARY IEEE;
USE FIFTYFIVENM.FIFTYFIVENM_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	hard_block IS
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic
	);
END hard_block;

-- Design Ports Information
-- ~ALTERA_TMS~	=>  Location: PIN_H2,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_TCK~	=>  Location: PIN_G2,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_TDI~	=>  Location: PIN_L4,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_TDO~	=>  Location: PIN_M5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_CONFIG_SEL~	=>  Location: PIN_H10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_nCONFIG~	=>  Location: PIN_H9,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_nSTATUS~	=>  Location: PIN_G9,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_CONF_DONE~	=>  Location: PIN_F8,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default


ARCHITECTURE structure OF hard_block IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL \~ALTERA_TMS~~padout\ : std_logic;
SIGNAL \~ALTERA_TCK~~padout\ : std_logic;
SIGNAL \~ALTERA_TDI~~padout\ : std_logic;
SIGNAL \~ALTERA_CONFIG_SEL~~padout\ : std_logic;
SIGNAL \~ALTERA_nCONFIG~~padout\ : std_logic;
SIGNAL \~ALTERA_nSTATUS~~padout\ : std_logic;
SIGNAL \~ALTERA_CONF_DONE~~padout\ : std_logic;
SIGNAL \~ALTERA_TMS~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_TCK~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_TDI~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_CONFIG_SEL~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_nCONFIG~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_nSTATUS~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_CONF_DONE~~ibuf_o\ : std_logic;

BEGIN

ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
END structure;


LIBRARY ALTERA;
LIBRARY FIFTYFIVENM;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE FIFTYFIVENM.FIFTYFIVENM_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	thread_struct IS
    PORT (
	clock : IN std_logic;
	reset : IN std_logic;
	enable : IN std_logic;
	core_state : IN std_logic_vector(2 DOWNTO 0);
	alu_select : IN std_logic_vector(1 DOWNTO 0);
	rs_address : IN std_logic_vector(3 DOWNTO 0);
	rt_address : IN std_logic_vector(3 DOWNTO 0);
	rd_address : IN std_logic_vector(3 DOWNTO 0);
	immediate : IN std_logic_vector(7 DOWNTO 0);
	current_pc : IN std_logic_vector(7 DOWNTO 0);
	block_id : IN std_logic_vector(7 DOWNTO 0);
	nzp_write_enable : IN std_logic;
	reg_write_enable : IN std_logic;
	pc_out_mux : IN std_logic;
	mem_write_en : IN std_logic;
	mem_read_en : IN std_logic;
	nzp_instr : IN std_logic_vector(2 DOWNTO 0);
	reg_input_mux : IN std_logic_vector(1 DOWNTO 0);
	mem_read_ready : IN std_logic;
	mem_write_ready : IN std_logic;
	mem_read_data : IN std_logic_vector(7 DOWNTO 0);
	mem_read_address : BUFFER std_logic_vector(7 DOWNTO 0);
	mem_write_address : BUFFER std_logic_vector(7 DOWNTO 0);
	mem_write_data : BUFFER std_logic_vector(7 DOWNTO 0);
	new_pc : BUFFER std_logic_vector(7 DOWNTO 0)
	);
END thread_struct;

-- Design Ports Information
-- mem_read_address[0]	=>  Location: PIN_H14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mem_read_address[1]	=>  Location: PIN_G17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mem_read_address[2]	=>  Location: PIN_A15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mem_read_address[3]	=>  Location: PIN_D14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mem_read_address[4]	=>  Location: PIN_H17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mem_read_address[5]	=>  Location: PIN_B14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mem_read_address[6]	=>  Location: PIN_D19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mem_read_address[7]	=>  Location: PIN_K14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mem_write_address[0]	=>  Location: PIN_D13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mem_write_address[1]	=>  Location: PIN_L15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mem_write_address[2]	=>  Location: PIN_A14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mem_write_address[3]	=>  Location: PIN_J13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mem_write_address[4]	=>  Location: PIN_C21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mem_write_address[5]	=>  Location: PIN_C17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mem_write_address[6]	=>  Location: PIN_E18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mem_write_address[7]	=>  Location: PIN_C20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mem_write_data[0]	=>  Location: PIN_L19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mem_write_data[1]	=>  Location: PIN_C22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mem_write_data[2]	=>  Location: PIN_D22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mem_write_data[3]	=>  Location: PIN_M18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mem_write_data[4]	=>  Location: PIN_L18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mem_write_data[5]	=>  Location: PIN_L20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mem_write_data[6]	=>  Location: PIN_N20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mem_write_data[7]	=>  Location: PIN_L2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- new_pc[0]	=>  Location: PIN_A4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- new_pc[1]	=>  Location: PIN_D8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- new_pc[2]	=>  Location: PIN_D10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- new_pc[3]	=>  Location: PIN_A2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- new_pc[4]	=>  Location: PIN_C6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- new_pc[5]	=>  Location: PIN_C1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- new_pc[6]	=>  Location: PIN_B3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- new_pc[7]	=>  Location: PIN_E9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset	=>  Location: PIN_B7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clock	=>  Location: PIN_M8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- enable	=>  Location: PIN_L14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mem_read_en	=>  Location: PIN_D17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mem_write_en	=>  Location: PIN_E15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- immediate[0]	=>  Location: PIN_K5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- nzp_instr[0]	=>  Location: PIN_C13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- nzp_instr[1]	=>  Location: PIN_E19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pc_out_mux	=>  Location: PIN_D18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- nzp_instr[2]	=>  Location: PIN_V13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- current_pc[0]	=>  Location: PIN_D7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- core_state[1]	=>  Location: PIN_K15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- core_state[0]	=>  Location: PIN_C14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- core_state[2]	=>  Location: PIN_E12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- immediate[1]	=>  Location: PIN_K4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- current_pc[1]	=>  Location: PIN_A6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- immediate[2]	=>  Location: PIN_D2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- current_pc[2]	=>  Location: PIN_E3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- immediate[3]	=>  Location: PIN_H3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- current_pc[3]	=>  Location: PIN_J8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- immediate[4]	=>  Location: PIN_K9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- current_pc[4]	=>  Location: PIN_J9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- immediate[5]	=>  Location: PIN_K8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- current_pc[5]	=>  Location: PIN_D9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- immediate[6]	=>  Location: PIN_J4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- current_pc[6]	=>  Location: PIN_G4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- immediate[7]	=>  Location: PIN_F5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- current_pc[7]	=>  Location: PIN_F3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rs_address[1]	=>  Location: PIN_D1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rs_address[0]	=>  Location: PIN_L9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rs_address[3]	=>  Location: PIN_K2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rs_address[2]	=>  Location: PIN_F2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg_write_enable	=>  Location: PIN_J11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mem_write_ready	=>  Location: PIN_B15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mem_read_ready	=>  Location: PIN_E13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rt_address[1]	=>  Location: PIN_D3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rt_address[0]	=>  Location: PIN_H4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rt_address[3]	=>  Location: PIN_K6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rt_address[2]	=>  Location: PIN_J3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- nzp_write_enable	=>  Location: PIN_A8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg_input_mux[0]	=>  Location: PIN_G3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reg_input_mux[1]	=>  Location: PIN_E1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rd_address[0]	=>  Location: PIN_F18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rd_address[1]	=>  Location: PIN_H11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rd_address[2]	=>  Location: PIN_E4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rd_address[3]	=>  Location: PIN_J10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- block_id[0]	=>  Location: PIN_A3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- block_id[1]	=>  Location: PIN_E10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- block_id[2]	=>  Location: PIN_A9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- block_id[3]	=>  Location: PIN_A5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- block_id[4]	=>  Location: PIN_C4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- block_id[5]	=>  Location: PIN_B8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- block_id[6]	=>  Location: PIN_C9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- block_id[7]	=>  Location: PIN_F4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mem_read_data[0]	=>  Location: PIN_E16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- alu_select[0]	=>  Location: PIN_F21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- alu_select[1]	=>  Location: PIN_L8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mem_read_data[1]	=>  Location: PIN_B10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mem_read_data[2]	=>  Location: PIN_M20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mem_read_data[3]	=>  Location: PIN_C8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mem_read_data[4]	=>  Location: PIN_C7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mem_read_data[5]	=>  Location: PIN_A7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mem_read_data[6]	=>  Location: PIN_E11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mem_read_data[7]	=>  Location: PIN_H12,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF thread_struct IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clock : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_enable : std_logic;
SIGNAL ww_core_state : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_alu_select : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_rs_address : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_rt_address : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_rd_address : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_immediate : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_current_pc : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_block_id : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_nzp_write_enable : std_logic;
SIGNAL ww_reg_write_enable : std_logic;
SIGNAL ww_pc_out_mux : std_logic;
SIGNAL ww_mem_write_en : std_logic;
SIGNAL ww_mem_read_en : std_logic;
SIGNAL ww_nzp_instr : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_reg_input_mux : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_mem_read_ready : std_logic;
SIGNAL ww_mem_write_ready : std_logic;
SIGNAL ww_mem_read_data : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_mem_read_address : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_mem_write_address : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_mem_write_data : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_new_pc : std_logic_vector(7 DOWNTO 0);
SIGNAL \alu_block|Mult0|auto_generated|mac_out2_DATAA_bus\ : std_logic_vector(17 DOWNTO 0);
SIGNAL \alu_block|Mult0|auto_generated|mac_out2_DATAOUT_bus\ : std_logic_vector(17 DOWNTO 0);
SIGNAL \alu_block|Mult0|auto_generated|mac_mult1_DATAA_bus\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \alu_block|Mult0|auto_generated|mac_mult1_DATAB_bus\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \alu_block|Mult0|auto_generated|mac_mult1_DATAOUT_bus\ : std_logic_vector(17 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_ADC1~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \clock~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \alu_block|Mult0|auto_generated|mac_out2~DATAOUT8\ : std_logic;
SIGNAL \alu_block|Mult0|auto_generated|mac_out2~DATAOUT9\ : std_logic;
SIGNAL \alu_block|Mult0|auto_generated|mac_out2~DATAOUT10\ : std_logic;
SIGNAL \alu_block|Mult0|auto_generated|mac_out2~DATAOUT11\ : std_logic;
SIGNAL \alu_block|Mult0|auto_generated|mac_out2~DATAOUT12\ : std_logic;
SIGNAL \alu_block|Mult0|auto_generated|mac_out2~DATAOUT13\ : std_logic;
SIGNAL \alu_block|Mult0|auto_generated|mac_out2~DATAOUT14\ : std_logic;
SIGNAL \alu_block|Mult0|auto_generated|mac_out2~DATAOUT15\ : std_logic;
SIGNAL \alu_block|Mult0|auto_generated|mac_out2~0\ : std_logic;
SIGNAL \alu_block|Mult0|auto_generated|mac_out2~1\ : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \~QUARTUS_CREATED_UNVM~~busy\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC1~~eoc\ : std_logic;
SIGNAL \mem_read_address[0]~output_o\ : std_logic;
SIGNAL \mem_read_address[1]~output_o\ : std_logic;
SIGNAL \mem_read_address[2]~output_o\ : std_logic;
SIGNAL \mem_read_address[3]~output_o\ : std_logic;
SIGNAL \mem_read_address[4]~output_o\ : std_logic;
SIGNAL \mem_read_address[5]~output_o\ : std_logic;
SIGNAL \mem_read_address[6]~output_o\ : std_logic;
SIGNAL \mem_read_address[7]~output_o\ : std_logic;
SIGNAL \mem_write_address[0]~output_o\ : std_logic;
SIGNAL \mem_write_address[1]~output_o\ : std_logic;
SIGNAL \mem_write_address[2]~output_o\ : std_logic;
SIGNAL \mem_write_address[3]~output_o\ : std_logic;
SIGNAL \mem_write_address[4]~output_o\ : std_logic;
SIGNAL \mem_write_address[5]~output_o\ : std_logic;
SIGNAL \mem_write_address[6]~output_o\ : std_logic;
SIGNAL \mem_write_address[7]~output_o\ : std_logic;
SIGNAL \mem_write_data[0]~output_o\ : std_logic;
SIGNAL \mem_write_data[1]~output_o\ : std_logic;
SIGNAL \mem_write_data[2]~output_o\ : std_logic;
SIGNAL \mem_write_data[3]~output_o\ : std_logic;
SIGNAL \mem_write_data[4]~output_o\ : std_logic;
SIGNAL \mem_write_data[5]~output_o\ : std_logic;
SIGNAL \mem_write_data[6]~output_o\ : std_logic;
SIGNAL \mem_write_data[7]~output_o\ : std_logic;
SIGNAL \new_pc[0]~output_o\ : std_logic;
SIGNAL \new_pc[1]~output_o\ : std_logic;
SIGNAL \new_pc[2]~output_o\ : std_logic;
SIGNAL \new_pc[3]~output_o\ : std_logic;
SIGNAL \new_pc[4]~output_o\ : std_logic;
SIGNAL \new_pc[5]~output_o\ : std_logic;
SIGNAL \new_pc[6]~output_o\ : std_logic;
SIGNAL \new_pc[7]~output_o\ : std_logic;
SIGNAL \clock~input_o\ : std_logic;
SIGNAL \clock~inputclkctrl_outclk\ : std_logic;
SIGNAL \rs_address[0]~input_o\ : std_logic;
SIGNAL \immediate[0]~input_o\ : std_logic;
SIGNAL \block_id[0]~input_o\ : std_logic;
SIGNAL \mem_read_data[0]~input_o\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \lsu_block|lsu_out~0_combout\ : std_logic;
SIGNAL \mem_read_en~input_o\ : std_logic;
SIGNAL \enable~input_o\ : std_logic;
SIGNAL \mem_write_ready~input_o\ : std_logic;
SIGNAL \lsu_block|lsu_state[1]~4_combout\ : std_logic;
SIGNAL \lsu_block|lsu_state[0]~0_combout\ : std_logic;
SIGNAL \mem_read_ready~input_o\ : std_logic;
SIGNAL \lsu_block|lsu_state[0]~1_combout\ : std_logic;
SIGNAL \core_state[0]~input_o\ : std_logic;
SIGNAL \core_state[2]~input_o\ : std_logic;
SIGNAL \core_state[1]~input_o\ : std_logic;
SIGNAL \lsu_block|Equal5~0_combout\ : std_logic;
SIGNAL \rf_block|rs_data[7]~10_combout\ : std_logic;
SIGNAL \lsu_block|lsu_state[0]~5_combout\ : std_logic;
SIGNAL \mem_write_en~input_o\ : std_logic;
SIGNAL \lsu_block|lsu_state[0]~2_combout\ : std_logic;
SIGNAL \lsu_block|lsu_state[0]~6_combout\ : std_logic;
SIGNAL \lsu_block|lsu_state[0]~3_combout\ : std_logic;
SIGNAL \lsu_block|lsu_out[2]~1_combout\ : std_logic;
SIGNAL \lsu_block|lsu_out[2]~2_combout\ : std_logic;
SIGNAL \alu_select[1]~input_o\ : std_logic;
SIGNAL \alu_select[0]~input_o\ : std_logic;
SIGNAL \reg_input_mux[0]~input_o\ : std_logic;
SIGNAL \rf_block|registers~0_combout\ : std_logic;
SIGNAL \rf_block|registers[3][0]~feeder_combout\ : std_logic;
SIGNAL \reg_input_mux[1]~input_o\ : std_logic;
SIGNAL \rd_address[2]~input_o\ : std_logic;
SIGNAL \rd_address[0]~input_o\ : std_logic;
SIGNAL \rd_address[3]~input_o\ : std_logic;
SIGNAL \rd_address[1]~input_o\ : std_logic;
SIGNAL \rf_block|Decoder0~11_combout\ : std_logic;
SIGNAL \reg_write_enable~input_o\ : std_logic;
SIGNAL \rf_block|registers[0][2]~2_combout\ : std_logic;
SIGNAL \rf_block|registers~1_combout\ : std_logic;
SIGNAL \rf_block|registers[0][2]~3_combout\ : std_logic;
SIGNAL \rf_block|registers[3][4]~15_combout\ : std_logic;
SIGNAL \rf_block|registers[3][0]~q\ : std_logic;
SIGNAL \rf_block|registers[2][0]~feeder_combout\ : std_logic;
SIGNAL \rf_block|Decoder0~8_combout\ : std_logic;
SIGNAL \rf_block|registers[2][4]~12_combout\ : std_logic;
SIGNAL \rf_block|registers[2][0]~q\ : std_logic;
SIGNAL \rt_address[1]~input_o\ : std_logic;
SIGNAL \rf_block|registers[0][0]~feeder_combout\ : std_logic;
SIGNAL \rf_block|Decoder0~10_combout\ : std_logic;
SIGNAL \rf_block|registers[0][2]~14_combout\ : std_logic;
SIGNAL \rf_block|registers[0][0]~q\ : std_logic;
SIGNAL \rt_address[0]~input_o\ : std_logic;
SIGNAL \rf_block|registers[1][0]~feeder_combout\ : std_logic;
SIGNAL \rf_block|Decoder0~9_combout\ : std_logic;
SIGNAL \rf_block|registers[1][5]~13_combout\ : std_logic;
SIGNAL \rf_block|registers[1][0]~q\ : std_logic;
SIGNAL \rf_block|rt_data~4_combout\ : std_logic;
SIGNAL \rf_block|rt_data~5_combout\ : std_logic;
SIGNAL \rf_block|registers[7][0]~feeder_combout\ : std_logic;
SIGNAL \rf_block|Decoder0~7_combout\ : std_logic;
SIGNAL \rf_block|registers[7][1]~11_combout\ : std_logic;
SIGNAL \rf_block|registers[7][0]~q\ : std_logic;
SIGNAL \rf_block|registers[5][0]~feeder_combout\ : std_logic;
SIGNAL \rf_block|Decoder0~4_combout\ : std_logic;
SIGNAL \rf_block|registers[5][7]~8_combout\ : std_logic;
SIGNAL \rf_block|registers[5][0]~q\ : std_logic;
SIGNAL \rf_block|registers[6][0]~feeder_combout\ : std_logic;
SIGNAL \rf_block|Decoder0~5_combout\ : std_logic;
SIGNAL \rf_block|registers[6][3]~9_combout\ : std_logic;
SIGNAL \rf_block|registers[6][0]~q\ : std_logic;
SIGNAL \rf_block|registers[4][0]~feeder_combout\ : std_logic;
SIGNAL \rf_block|Decoder0~6_combout\ : std_logic;
SIGNAL \rf_block|registers[4][4]~10_combout\ : std_logic;
SIGNAL \rf_block|registers[4][0]~q\ : std_logic;
SIGNAL \rf_block|rt_data~2_combout\ : std_logic;
SIGNAL \rf_block|rt_data~3_combout\ : std_logic;
SIGNAL \rt_address[2]~input_o\ : std_logic;
SIGNAL \rt_address[3]~input_o\ : std_logic;
SIGNAL \rf_block|rt_data~6_combout\ : std_logic;
SIGNAL \rf_block|registers[9][0]~feeder_combout\ : std_logic;
SIGNAL \rf_block|Decoder0~1_combout\ : std_logic;
SIGNAL \rf_block|registers[9][5]~5_combout\ : std_logic;
SIGNAL \rf_block|registers[9][0]~q\ : std_logic;
SIGNAL \rf_block|registers[8][0]~feeder_combout\ : std_logic;
SIGNAL \rf_block|Decoder0~2_combout\ : std_logic;
SIGNAL \rf_block|registers[8][5]~6_combout\ : std_logic;
SIGNAL \rf_block|registers[8][0]~q\ : std_logic;
SIGNAL \rf_block|rt_data~0_combout\ : std_logic;
SIGNAL \rf_block|registers[10][0]~feeder_combout\ : std_logic;
SIGNAL \rf_block|Decoder0~0_combout\ : std_logic;
SIGNAL \rf_block|registers[10][5]~4_combout\ : std_logic;
SIGNAL \rf_block|registers[10][0]~q\ : std_logic;
SIGNAL \rf_block|registers[11][0]~feeder_combout\ : std_logic;
SIGNAL \rf_block|Decoder0~3_combout\ : std_logic;
SIGNAL \rf_block|registers[11][2]~7_combout\ : std_logic;
SIGNAL \rf_block|registers[11][0]~q\ : std_logic;
SIGNAL \rf_block|rt_data~1_combout\ : std_logic;
SIGNAL \rf_block|registers[14][0]~feeder_combout\ : std_logic;
SIGNAL \rf_block|Decoder0~13_combout\ : std_logic;
SIGNAL \rf_block|registers[14][6]~21_combout\ : std_logic;
SIGNAL \rf_block|registers[14][0]~q\ : std_logic;
SIGNAL \rf_block|registers[12][0]~feeder_combout\ : std_logic;
SIGNAL \rf_block|Decoder0~14_combout\ : std_logic;
SIGNAL \rf_block|registers[12][6]~22_combout\ : std_logic;
SIGNAL \rf_block|registers[12][0]~q\ : std_logic;
SIGNAL \rf_block|rt_data~7_combout\ : std_logic;
SIGNAL \rf_block|registers[15][0]~feeder_combout\ : std_logic;
SIGNAL \rf_block|Decoder0~15_combout\ : std_logic;
SIGNAL \rf_block|registers[15][6]~23_combout\ : std_logic;
SIGNAL \rf_block|registers[15][0]~q\ : std_logic;
SIGNAL \rf_block|rt_data~8_combout\ : std_logic;
SIGNAL \rf_block|rt_data~9_combout\ : std_logic;
SIGNAL \rf_block|rt_data[0]~SCLR_LUT_combout\ : std_logic;
SIGNAL \rf_block|rs_data[7]~11_combout\ : std_logic;
SIGNAL \rf_block|rt_data[0]~_Duplicate_1_q\ : std_logic;
SIGNAL \alu_block|Add0~0_combout\ : std_logic;
SIGNAL \alu_block|Add0~2_cout\ : std_logic;
SIGNAL \alu_block|Add0~3_combout\ : std_logic;
SIGNAL \rs_address[1]~input_o\ : std_logic;
SIGNAL \rf_block|registers[9][1]~feeder_combout\ : std_logic;
SIGNAL \immediate[1]~input_o\ : std_logic;
SIGNAL \rf_block|registers[9][1]~q\ : std_logic;
SIGNAL \rf_block|Decoder0~12_combout\ : std_logic;
SIGNAL \rf_block|registers[13][4]~17_combout\ : std_logic;
SIGNAL \rf_block|registers[13][4]~16_combout\ : std_logic;
SIGNAL \rf_block|registers~25_combout\ : std_logic;
SIGNAL \mem_read_data[1]~input_o\ : std_logic;
SIGNAL \lsu_block|lsu_out~3_combout\ : std_logic;
SIGNAL \block_id[1]~input_o\ : std_logic;
SIGNAL \rf_block|registers~26_combout\ : std_logic;
SIGNAL \rf_block|registers[13][4]~20_combout\ : std_logic;
SIGNAL \rf_block|registers[13][1]~q\ : std_logic;
SIGNAL \rs_address[2]~input_o\ : std_logic;
SIGNAL \rs_address[3]~input_o\ : std_logic;
SIGNAL \rf_block|registers[1][1]~feeder_combout\ : std_logic;
SIGNAL \rf_block|registers[1][1]~q\ : std_logic;
SIGNAL \rf_block|rs_data~14_combout\ : std_logic;
SIGNAL \rf_block|rs_data~15_combout\ : std_logic;
SIGNAL \rf_block|registers[8][1]~feeder_combout\ : std_logic;
SIGNAL \rf_block|registers[8][1]~q\ : std_logic;
SIGNAL \rf_block|registers[0][1]~feeder_combout\ : std_logic;
SIGNAL \rf_block|registers[0][1]~q\ : std_logic;
SIGNAL \rf_block|rs_data~16_combout\ : std_logic;
SIGNAL \rf_block|registers[4][1]~feeder_combout\ : std_logic;
SIGNAL \rf_block|registers[4][1]~q\ : std_logic;
SIGNAL \rf_block|registers[12][1]~feeder_combout\ : std_logic;
SIGNAL \rf_block|registers[12][1]~q\ : std_logic;
SIGNAL \rf_block|rs_data~17_combout\ : std_logic;
SIGNAL \rf_block|rs_data~18_combout\ : std_logic;
SIGNAL \rf_block|registers[14][1]~feeder_combout\ : std_logic;
SIGNAL \rf_block|registers[14][1]~q\ : std_logic;
SIGNAL \rf_block|registers[2][1]~feeder_combout\ : std_logic;
SIGNAL \rf_block|registers[2][1]~q\ : std_logic;
SIGNAL \rf_block|registers[10][1]~feeder_combout\ : std_logic;
SIGNAL \rf_block|registers[10][1]~q\ : std_logic;
SIGNAL \rf_block|rs_data~12_combout\ : std_logic;
SIGNAL \rf_block|registers[6][1]~feeder_combout\ : std_logic;
SIGNAL \rf_block|registers[6][1]~q\ : std_logic;
SIGNAL \rf_block|rs_data~13_combout\ : std_logic;
SIGNAL \rf_block|registers[11][1]~feeder_combout\ : std_logic;
SIGNAL \rf_block|registers[11][1]~q\ : std_logic;
SIGNAL \rf_block|registers[3][1]~feeder_combout\ : std_logic;
SIGNAL \rf_block|registers[3][1]~q\ : std_logic;
SIGNAL \rf_block|registers[7][1]~q\ : std_logic;
SIGNAL \rf_block|rs_data~19_combout\ : std_logic;
SIGNAL \rf_block|registers[15][1]~feeder_combout\ : std_logic;
SIGNAL \rf_block|registers[15][1]~q\ : std_logic;
SIGNAL \rf_block|rs_data~20_combout\ : std_logic;
SIGNAL \rf_block|rs_data~21_combout\ : std_logic;
SIGNAL \rf_block|rs_data[1]~SCLR_LUT_combout\ : std_logic;
SIGNAL \rf_block|rs_data[1]~_Duplicate_1_q\ : std_logic;
SIGNAL \alu_block|Add0~9_combout\ : std_logic;
SIGNAL \rf_block|rt_data[1]~_Duplicate_1_q\ : std_logic;
SIGNAL \alu_block|Add0~4\ : std_logic;
SIGNAL \alu_block|Add0~10_combout\ : std_logic;
SIGNAL \rf_block|registers[1][3]~feeder_combout\ : std_logic;
SIGNAL \immediate[3]~input_o\ : std_logic;
SIGNAL \rf_block|registers[1][3]~q\ : std_logic;
SIGNAL \rf_block|registers[9][3]~feeder_combout\ : std_logic;
SIGNAL \rf_block|registers[9][3]~q\ : std_logic;
SIGNAL \rf_block|rt_data~30_combout\ : std_logic;
SIGNAL \rf_block|registers[5][3]~feeder_combout\ : std_logic;
SIGNAL \rf_block|registers[5][3]~q\ : std_logic;
SIGNAL \rf_block|registers~32_combout\ : std_logic;
SIGNAL \block_id[3]~input_o\ : std_logic;
SIGNAL \mem_read_data[3]~input_o\ : std_logic;
SIGNAL \lsu_block|lsu_out~5_combout\ : std_logic;
SIGNAL \rf_block|registers~33_combout\ : std_logic;
SIGNAL \rf_block|registers[13][3]~q\ : std_logic;
SIGNAL \rf_block|rt_data~31_combout\ : std_logic;
SIGNAL \rf_block|registers[0][3]~feeder_combout\ : std_logic;
SIGNAL \rf_block|registers[0][3]~q\ : std_logic;
SIGNAL \rf_block|registers[4][3]~feeder_combout\ : std_logic;
SIGNAL \rf_block|registers[4][3]~q\ : std_logic;
SIGNAL \rf_block|rt_data~34_combout\ : std_logic;
SIGNAL \rf_block|registers[12][3]~feeder_combout\ : std_logic;
SIGNAL \rf_block|registers[12][3]~q\ : std_logic;
SIGNAL \rf_block|rt_data~35_combout\ : std_logic;
SIGNAL \rf_block|registers[2][3]~feeder_combout\ : std_logic;
SIGNAL \rf_block|registers[2][3]~q\ : std_logic;
SIGNAL \rf_block|registers[6][3]~feeder_combout\ : std_logic;
SIGNAL \rf_block|registers[6][3]~q\ : std_logic;
SIGNAL \rf_block|rt_data~32_combout\ : std_logic;
SIGNAL \rf_block|registers[10][3]~feeder_combout\ : std_logic;
SIGNAL \rf_block|registers[10][3]~q\ : std_logic;
SIGNAL \rf_block|registers[14][3]~feeder_combout\ : std_logic;
SIGNAL \rf_block|registers[14][3]~q\ : std_logic;
SIGNAL \rf_block|rt_data~33_combout\ : std_logic;
SIGNAL \rf_block|rt_data~36_combout\ : std_logic;
SIGNAL \rf_block|registers[3][3]~feeder_combout\ : std_logic;
SIGNAL \rf_block|registers[3][3]~q\ : std_logic;
SIGNAL \rf_block|registers[11][3]~feeder_combout\ : std_logic;
SIGNAL \rf_block|registers[11][3]~q\ : std_logic;
SIGNAL \rf_block|rt_data~37_combout\ : std_logic;
SIGNAL \rf_block|registers[7][3]~feeder_combout\ : std_logic;
SIGNAL \rf_block|registers[7][3]~q\ : std_logic;
SIGNAL \rf_block|registers[15][3]~q\ : std_logic;
SIGNAL \rf_block|rt_data~38_combout\ : std_logic;
SIGNAL \rf_block|rt_data~39_combout\ : std_logic;
SIGNAL \rf_block|rt_data[3]~SCLR_LUT_combout\ : std_logic;
SIGNAL \rf_block|rt_data[3]~_Duplicate_1_q\ : std_logic;
SIGNAL \alu_block|Add0~19_combout\ : std_logic;
SIGNAL \mem_read_data[2]~input_o\ : std_logic;
SIGNAL \lsu_block|lsu_out~4_combout\ : std_logic;
SIGNAL \rf_block|registers[4][2]~feeder_combout\ : std_logic;
SIGNAL \immediate[2]~input_o\ : std_logic;
SIGNAL \rf_block|registers[4][2]~q\ : std_logic;
SIGNAL \rf_block|registers[5][2]~feeder_combout\ : std_logic;
SIGNAL \rf_block|registers[5][2]~q\ : std_logic;
SIGNAL \rf_block|rs_data~22_combout\ : std_logic;
SIGNAL \rf_block|registers[6][2]~feeder_combout\ : std_logic;
SIGNAL \rf_block|registers[6][2]~q\ : std_logic;
SIGNAL \rf_block|rs_data~23_combout\ : std_logic;
SIGNAL \rf_block|registers~28_combout\ : std_logic;
SIGNAL \rf_block|registers[14][2]~q\ : std_logic;
SIGNAL \rf_block|registers[15][2]~q\ : std_logic;
SIGNAL \rf_block|registers[12][2]~feeder_combout\ : std_logic;
SIGNAL \rf_block|registers[12][2]~q\ : std_logic;
SIGNAL \rf_block|registers~29_combout\ : std_logic;
SIGNAL \block_id[2]~input_o\ : std_logic;
SIGNAL \rf_block|registers~30_combout\ : std_logic;
SIGNAL \rf_block|registers[13][2]~q\ : std_logic;
SIGNAL \rf_block|rs_data~29_combout\ : std_logic;
SIGNAL \rf_block|rs_data~30_combout\ : std_logic;
SIGNAL \rf_block|registers[2][2]~feeder_combout\ : std_logic;
SIGNAL \rf_block|registers[2][2]~q\ : std_logic;
SIGNAL \rf_block|registers[0][2]~feeder_combout\ : std_logic;
SIGNAL \rf_block|registers[0][2]~q\ : std_logic;
SIGNAL \rf_block|rs_data~26_combout\ : std_logic;
SIGNAL \rf_block|registers[3][2]~feeder_combout\ : std_logic;
SIGNAL \rf_block|registers[3][2]~q\ : std_logic;
SIGNAL \rf_block|registers[1][2]~feeder_combout\ : std_logic;
SIGNAL \rf_block|registers[1][2]~q\ : std_logic;
SIGNAL \rf_block|rs_data~27_combout\ : std_logic;
SIGNAL \rf_block|registers[8][2]~feeder_combout\ : std_logic;
SIGNAL \rf_block|registers[8][2]~q\ : std_logic;
SIGNAL \rf_block|registers[10][2]~feeder_combout\ : std_logic;
SIGNAL \rf_block|registers[10][2]~q\ : std_logic;
SIGNAL \rf_block|rs_data~24_combout\ : std_logic;
SIGNAL \rf_block|registers[11][2]~feeder_combout\ : std_logic;
SIGNAL \rf_block|registers[11][2]~q\ : std_logic;
SIGNAL \rf_block|registers[9][2]~feeder_combout\ : std_logic;
SIGNAL \rf_block|registers[9][2]~q\ : std_logic;
SIGNAL \rf_block|rs_data~25_combout\ : std_logic;
SIGNAL \rf_block|rs_data~28_combout\ : std_logic;
SIGNAL \rf_block|rs_data~31_combout\ : std_logic;
SIGNAL \rf_block|rs_data[2]~SCLR_LUT_combout\ : std_logic;
SIGNAL \rf_block|rs_data[2]~_Duplicate_1_q\ : std_logic;
SIGNAL \alu_block|Add0~14_combout\ : std_logic;
SIGNAL \alu_block|Add0~11\ : std_logic;
SIGNAL \alu_block|Add0~15_combout\ : std_logic;
SIGNAL \rf_block|registers[4][6]~feeder_combout\ : std_logic;
SIGNAL \immediate[6]~input_o\ : std_logic;
SIGNAL \rf_block|registers[4][6]~q\ : std_logic;
SIGNAL \rf_block|registers[5][6]~feeder_combout\ : std_logic;
SIGNAL \rf_block|registers[5][6]~q\ : std_logic;
SIGNAL \rf_block|rt_data~60_combout\ : std_logic;
SIGNAL \rf_block|registers[6][6]~feeder_combout\ : std_logic;
SIGNAL \rf_block|registers[6][6]~q\ : std_logic;
SIGNAL \rf_block|registers[7][6]~feeder_combout\ : std_logic;
SIGNAL \rf_block|registers[7][6]~q\ : std_logic;
SIGNAL \rf_block|rt_data~61_combout\ : std_logic;
SIGNAL \rf_block|registers[8][6]~feeder_combout\ : std_logic;
SIGNAL \rf_block|registers[8][6]~q\ : std_logic;
SIGNAL \rf_block|registers[10][6]~feeder_combout\ : std_logic;
SIGNAL \rf_block|registers[10][6]~q\ : std_logic;
SIGNAL \rf_block|rt_data~62_combout\ : std_logic;
SIGNAL \rf_block|registers[11][6]~feeder_combout\ : std_logic;
SIGNAL \rf_block|registers[11][6]~q\ : std_logic;
SIGNAL \rf_block|registers[9][6]~feeder_combout\ : std_logic;
SIGNAL \rf_block|registers[9][6]~q\ : std_logic;
SIGNAL \rf_block|rt_data~63_combout\ : std_logic;
SIGNAL \rf_block|registers[1][6]~feeder_combout\ : std_logic;
SIGNAL \rf_block|registers[1][6]~q\ : std_logic;
SIGNAL \rf_block|registers[2][6]~feeder_combout\ : std_logic;
SIGNAL \rf_block|registers[2][6]~q\ : std_logic;
SIGNAL \rf_block|registers[0][6]~feeder_combout\ : std_logic;
SIGNAL \rf_block|registers[0][6]~q\ : std_logic;
SIGNAL \rf_block|rt_data~64_combout\ : std_logic;
SIGNAL \rf_block|rt_data~65_combout\ : std_logic;
SIGNAL \rf_block|rt_data~66_combout\ : std_logic;
SIGNAL \block_id[6]~input_o\ : std_logic;
SIGNAL \mem_read_data[6]~input_o\ : std_logic;
SIGNAL \lsu_block|lsu_out~8_combout\ : std_logic;
SIGNAL \rf_block|registers~41_combout\ : std_logic;
SIGNAL \rf_block|registers~42_combout\ : std_logic;
SIGNAL \rf_block|registers[13][6]~q\ : std_logic;
SIGNAL \rf_block|registers[12][6]~feeder_combout\ : std_logic;
SIGNAL \rf_block|registers[12][6]~q\ : std_logic;
SIGNAL \rf_block|rt_data~67_combout\ : std_logic;
SIGNAL \rf_block|registers[15][6]~q\ : std_logic;
SIGNAL \rf_block|registers[14][6]~feeder_combout\ : std_logic;
SIGNAL \rf_block|registers[14][6]~q\ : std_logic;
SIGNAL \rf_block|rt_data~68_combout\ : std_logic;
SIGNAL \rf_block|rt_data~69_combout\ : std_logic;
SIGNAL \rf_block|rt_data[6]~SCLR_LUT_combout\ : std_logic;
SIGNAL \rf_block|rt_data[6]~_Duplicate_1_q\ : std_logic;
SIGNAL \alu_block|Add0~34_combout\ : std_logic;
SIGNAL \mem_read_data[5]~input_o\ : std_logic;
SIGNAL \lsu_block|lsu_out~7_combout\ : std_logic;
SIGNAL \immediate[4]~input_o\ : std_logic;
SIGNAL \block_id[4]~input_o\ : std_logic;
SIGNAL \mem_read_data[4]~input_o\ : std_logic;
SIGNAL \lsu_block|lsu_out~6_combout\ : std_logic;
SIGNAL \rf_block|registers[11][5]~feeder_combout\ : std_logic;
SIGNAL \immediate[5]~input_o\ : std_logic;
SIGNAL \rf_block|registers[11][5]~q\ : std_logic;
SIGNAL \rf_block|registers[3][5]~feeder_combout\ : std_logic;
SIGNAL \rf_block|registers[3][5]~q\ : std_logic;
SIGNAL \rf_block|registers[7][5]~feeder_combout\ : std_logic;
SIGNAL \rf_block|registers[7][5]~q\ : std_logic;
SIGNAL \rf_block|rt_data~57_combout\ : std_logic;
SIGNAL \rf_block|registers[15][5]~q\ : std_logic;
SIGNAL \rf_block|rt_data~58_combout\ : std_logic;
SIGNAL \rf_block|registers~38_combout\ : std_logic;
SIGNAL \block_id[5]~input_o\ : std_logic;
SIGNAL \rf_block|registers~39_combout\ : std_logic;
SIGNAL \rf_block|registers[13][5]~q\ : std_logic;
SIGNAL \rf_block|registers[5][5]~feeder_combout\ : std_logic;
SIGNAL \rf_block|registers[5][5]~q\ : std_logic;
SIGNAL \rf_block|registers[1][5]~feeder_combout\ : std_logic;
SIGNAL \rf_block|registers[1][5]~q\ : std_logic;
SIGNAL \rf_block|rt_data~52_combout\ : std_logic;
SIGNAL \rf_block|registers[9][5]~feeder_combout\ : std_logic;
SIGNAL \rf_block|registers[9][5]~q\ : std_logic;
SIGNAL \rf_block|rt_data~53_combout\ : std_logic;
SIGNAL \rf_block|registers[4][5]~feeder_combout\ : std_logic;
SIGNAL \rf_block|registers[4][5]~q\ : std_logic;
SIGNAL \rf_block|registers[8][5]~feeder_combout\ : std_logic;
SIGNAL \rf_block|registers[8][5]~q\ : std_logic;
SIGNAL \rf_block|registers[0][5]~feeder_combout\ : std_logic;
SIGNAL \rf_block|registers[0][5]~q\ : std_logic;
SIGNAL \rf_block|rt_data~54_combout\ : std_logic;
SIGNAL \rf_block|rt_data~55_combout\ : std_logic;
SIGNAL \rf_block|rt_data~56_combout\ : std_logic;
SIGNAL \rf_block|registers[6][5]~feeder_combout\ : std_logic;
SIGNAL \rf_block|registers[6][5]~q\ : std_logic;
SIGNAL \rf_block|registers[14][5]~feeder_combout\ : std_logic;
SIGNAL \rf_block|registers[14][5]~q\ : std_logic;
SIGNAL \rf_block|registers[10][5]~feeder_combout\ : std_logic;
SIGNAL \rf_block|registers[10][5]~q\ : std_logic;
SIGNAL \rf_block|registers[2][5]~feeder_combout\ : std_logic;
SIGNAL \rf_block|registers[2][5]~q\ : std_logic;
SIGNAL \rf_block|rt_data~50_combout\ : std_logic;
SIGNAL \rf_block|rt_data~51_combout\ : std_logic;
SIGNAL \rf_block|rt_data~59_combout\ : std_logic;
SIGNAL \rf_block|rt_data[5]~SCLR_LUT_combout\ : std_logic;
SIGNAL \rf_block|registers[2][7]~feeder_combout\ : std_logic;
SIGNAL \immediate[7]~input_o\ : std_logic;
SIGNAL \rf_block|registers[2][7]~q\ : std_logic;
SIGNAL \rf_block|registers[6][7]~feeder_combout\ : std_logic;
SIGNAL \rf_block|registers[6][7]~q\ : std_logic;
SIGNAL \rf_block|rt_data~72_combout\ : std_logic;
SIGNAL \rf_block|registers[10][7]~feeder_combout\ : std_logic;
SIGNAL \rf_block|registers[10][7]~q\ : std_logic;
SIGNAL \rf_block|registers[14][7]~feeder_combout\ : std_logic;
SIGNAL \rf_block|registers[14][7]~q\ : std_logic;
SIGNAL \rf_block|rt_data~73_combout\ : std_logic;
SIGNAL \rf_block|registers[0][7]~feeder_combout\ : std_logic;
SIGNAL \rf_block|registers[0][7]~q\ : std_logic;
SIGNAL \rf_block|registers[4][7]~feeder_combout\ : std_logic;
SIGNAL \rf_block|registers[4][7]~q\ : std_logic;
SIGNAL \rf_block|rt_data~74_combout\ : std_logic;
SIGNAL \rf_block|registers[8][7]~feeder_combout\ : std_logic;
SIGNAL \rf_block|registers[8][7]~q\ : std_logic;
SIGNAL \rf_block|registers[12][7]~feeder_combout\ : std_logic;
SIGNAL \rf_block|registers[12][7]~q\ : std_logic;
SIGNAL \rf_block|rt_data~75_combout\ : std_logic;
SIGNAL \rf_block|rt_data~76_combout\ : std_logic;
SIGNAL \rf_block|registers[15][7]~q\ : std_logic;
SIGNAL \rf_block|registers[7][7]~feeder_combout\ : std_logic;
SIGNAL \rf_block|registers[7][7]~q\ : std_logic;
SIGNAL \rf_block|registers[3][7]~feeder_combout\ : std_logic;
SIGNAL \rf_block|registers[3][7]~q\ : std_logic;
SIGNAL \rf_block|registers[11][7]~feeder_combout\ : std_logic;
SIGNAL \rf_block|registers[11][7]~q\ : std_logic;
SIGNAL \rf_block|rt_data~77_combout\ : std_logic;
SIGNAL \rf_block|rt_data~78_combout\ : std_logic;
SIGNAL \rf_block|registers[1][7]~feeder_combout\ : std_logic;
SIGNAL \rf_block|registers[1][7]~q\ : std_logic;
SIGNAL \rf_block|registers[9][7]~feeder_combout\ : std_logic;
SIGNAL \rf_block|registers[9][7]~q\ : std_logic;
SIGNAL \rf_block|rt_data~70_combout\ : std_logic;
SIGNAL \mem_read_data[7]~input_o\ : std_logic;
SIGNAL \lsu_block|lsu_out~9_combout\ : std_logic;
SIGNAL \rf_block|registers~44_combout\ : std_logic;
SIGNAL \block_id[7]~input_o\ : std_logic;
SIGNAL \rf_block|registers~45_combout\ : std_logic;
SIGNAL \rf_block|registers[13][7]~q\ : std_logic;
SIGNAL \rf_block|rt_data~71_combout\ : std_logic;
SIGNAL \rf_block|rt_data~79_combout\ : std_logic;
SIGNAL \rf_block|rt_data[7]~SCLR_LUT_combout\ : std_logic;
SIGNAL \rf_block|registers~34_combout\ : std_logic;
SIGNAL \rf_block|registers[11][4]~feeder_combout\ : std_logic;
SIGNAL \rf_block|registers[11][4]~q\ : std_logic;
SIGNAL \rf_block|registers[10][4]~feeder_combout\ : std_logic;
SIGNAL \rf_block|registers[10][4]~q\ : std_logic;
SIGNAL \rf_block|registers[8][4]~feeder_combout\ : std_logic;
SIGNAL \rf_block|registers[8][4]~q\ : std_logic;
SIGNAL \rf_block|registers[9][4]~feeder_combout\ : std_logic;
SIGNAL \rf_block|registers[9][4]~q\ : std_logic;
SIGNAL \rf_block|rs_data~42_combout\ : std_logic;
SIGNAL \rf_block|rs_data~43_combout\ : std_logic;
SIGNAL \rf_block|registers[15][4]~q\ : std_logic;
SIGNAL \rf_block|registers[12][4]~feeder_combout\ : std_logic;
SIGNAL \rf_block|registers[12][4]~q\ : std_logic;
SIGNAL \rf_block|registers[14][4]~feeder_combout\ : std_logic;
SIGNAL \rf_block|registers[14][4]~q\ : std_logic;
SIGNAL \rf_block|rs_data~49_combout\ : std_logic;
SIGNAL \rf_block|rs_data~50_combout\ : std_logic;
SIGNAL \rf_block|registers[2][4]~feeder_combout\ : std_logic;
SIGNAL \rf_block|registers[2][4]~q\ : std_logic;
SIGNAL \rf_block|registers[3][4]~feeder_combout\ : std_logic;
SIGNAL \rf_block|registers[3][4]~q\ : std_logic;
SIGNAL \rf_block|registers[0][4]~feeder_combout\ : std_logic;
SIGNAL \rf_block|registers[0][4]~q\ : std_logic;
SIGNAL \rf_block|registers[1][4]~feeder_combout\ : std_logic;
SIGNAL \rf_block|registers[1][4]~q\ : std_logic;
SIGNAL \rf_block|rs_data~46_combout\ : std_logic;
SIGNAL \rf_block|rs_data~47_combout\ : std_logic;
SIGNAL \rf_block|registers[5][4]~feeder_combout\ : std_logic;
SIGNAL \rf_block|registers[5][4]~q\ : std_logic;
SIGNAL \rf_block|registers[7][4]~feeder_combout\ : std_logic;
SIGNAL \rf_block|registers[7][4]~q\ : std_logic;
SIGNAL \rf_block|registers[6][4]~feeder_combout\ : std_logic;
SIGNAL \rf_block|registers[6][4]~q\ : std_logic;
SIGNAL \rf_block|registers[4][4]~feeder_combout\ : std_logic;
SIGNAL \rf_block|registers[4][4]~q\ : std_logic;
SIGNAL \rf_block|rs_data~44_combout\ : std_logic;
SIGNAL \rf_block|rs_data~45_combout\ : std_logic;
SIGNAL \rf_block|rs_data~48_combout\ : std_logic;
SIGNAL \rf_block|rs_data~51_combout\ : std_logic;
SIGNAL \rf_block|rs_data[4]~SCLR_LUT_combout\ : std_logic;
SIGNAL \alu_block|Mult0|auto_generated|mac_mult1~DATAOUT2\ : std_logic;
SIGNAL \alu_block|Mult0|auto_generated|mac_mult1~DATAOUT3\ : std_logic;
SIGNAL \alu_block|Mult0|auto_generated|mac_mult1~DATAOUT4\ : std_logic;
SIGNAL \alu_block|Mult0|auto_generated|mac_mult1~DATAOUT5\ : std_logic;
SIGNAL \alu_block|Mult0|auto_generated|mac_mult1~DATAOUT6\ : std_logic;
SIGNAL \alu_block|Mult0|auto_generated|mac_mult1~DATAOUT7\ : std_logic;
SIGNAL \alu_block|Mult0|auto_generated|mac_mult1~DATAOUT8\ : std_logic;
SIGNAL \alu_block|Mult0|auto_generated|mac_mult1~DATAOUT9\ : std_logic;
SIGNAL \alu_block|Mult0|auto_generated|mac_mult1~DATAOUT10\ : std_logic;
SIGNAL \alu_block|Mult0|auto_generated|mac_mult1~DATAOUT11\ : std_logic;
SIGNAL \alu_block|Mult0|auto_generated|mac_mult1~DATAOUT12\ : std_logic;
SIGNAL \alu_block|Mult0|auto_generated|mac_mult1~DATAOUT13\ : std_logic;
SIGNAL \alu_block|Mult0|auto_generated|mac_mult1~DATAOUT14\ : std_logic;
SIGNAL \alu_block|Mult0|auto_generated|mac_mult1~DATAOUT15\ : std_logic;
SIGNAL \alu_block|Mult0|auto_generated|mac_mult1~0\ : std_logic;
SIGNAL \alu_block|Mult0|auto_generated|mac_mult1~1\ : std_logic;
SIGNAL \alu_block|Mult0|auto_generated|mac_out2~DATAOUT4\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|StageOut[9]~0_combout\ : std_logic;
SIGNAL \rf_block|rt_data[7]~_Duplicate_1_q\ : std_logic;
SIGNAL \rf_block|rs_data[4]~_Duplicate_1_q\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|selnose[27]~0_combout\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|StageOut[9]~1_combout\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|StageOut[8]~2_combout\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|StageOut[8]~3_combout\ : std_logic;
SIGNAL \rf_block|rt_data[5]~_Duplicate_1_q\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|add_sub_2_result_int[0]~1\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|add_sub_2_result_int[1]~3\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|add_sub_2_result_int[2]~4_combout\ : std_logic;
SIGNAL \alu_block|Add0~6_combout\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|add_sub_2_result_int[2]~5\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|add_sub_2_result_int[3]~6_combout\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|StageOut[18]~4_combout\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|add_sub_2_result_int[1]~2_combout\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|StageOut[17]~5_combout\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|add_sub_2_result_int[0]~0_combout\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|StageOut[16]~6_combout\ : std_logic;
SIGNAL \rf_block|rt_data[4]~_Duplicate_1_q\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|add_sub_3_result_int[0]~1\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~3\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~5\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~7\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~8_combout\ : std_logic;
SIGNAL \alu_block|Add0~23_combout\ : std_logic;
SIGNAL \alu_block|Add0~24_combout\ : std_logic;
SIGNAL \alu_block|Add0~21\ : std_logic;
SIGNAL \alu_block|Add0~25_combout\ : std_logic;
SIGNAL \alu_block|Add0~27_combout\ : std_logic;
SIGNAL \pc_nzp_block|new_pc[7]~3_combout\ : std_logic;
SIGNAL \pc_nzp_block|new_pc[7]~4_combout\ : std_logic;
SIGNAL \rf_block|registers~35_combout\ : std_logic;
SIGNAL \rf_block|registers~36_combout\ : std_logic;
SIGNAL \rf_block|registers[13][4]~q\ : std_logic;
SIGNAL \rf_block|rt_data~47_combout\ : std_logic;
SIGNAL \rf_block|rt_data~48_combout\ : std_logic;
SIGNAL \rf_block|rt_data~40_combout\ : std_logic;
SIGNAL \rf_block|rt_data~41_combout\ : std_logic;
SIGNAL \rf_block|rt_data~42_combout\ : std_logic;
SIGNAL \rf_block|rt_data~43_combout\ : std_logic;
SIGNAL \rf_block|rt_data~44_combout\ : std_logic;
SIGNAL \rf_block|rt_data~45_combout\ : std_logic;
SIGNAL \rf_block|rt_data~46_combout\ : std_logic;
SIGNAL \rf_block|rt_data~49_combout\ : std_logic;
SIGNAL \rf_block|rt_data[4]~SCLR_LUT_combout\ : std_logic;
SIGNAL \alu_block|Mult0|auto_generated|mac_mult1~DATAOUT1\ : std_logic;
SIGNAL \alu_block|Mult0|auto_generated|mac_out2~DATAOUT5\ : std_logic;
SIGNAL \alu_block|Add0~28_combout\ : std_logic;
SIGNAL \alu_block|Add0~26\ : std_logic;
SIGNAL \alu_block|Add0~30_combout\ : std_logic;
SIGNAL \alu_block|Add0~32_combout\ : std_logic;
SIGNAL \rf_block|registers~37_combout\ : std_logic;
SIGNAL \rf_block|registers[12][5]~feeder_combout\ : std_logic;
SIGNAL \rf_block|registers[12][5]~q\ : std_logic;
SIGNAL \rf_block|rs_data~56_combout\ : std_logic;
SIGNAL \rf_block|rs_data~57_combout\ : std_logic;
SIGNAL \rf_block|rs_data~54_combout\ : std_logic;
SIGNAL \rf_block|rs_data~55_combout\ : std_logic;
SIGNAL \rf_block|rs_data~58_combout\ : std_logic;
SIGNAL \rf_block|rs_data~59_combout\ : std_logic;
SIGNAL \rf_block|rs_data~60_combout\ : std_logic;
SIGNAL \rf_block|rs_data~52_combout\ : std_logic;
SIGNAL \rf_block|rs_data~53_combout\ : std_logic;
SIGNAL \rf_block|rs_data~61_combout\ : std_logic;
SIGNAL \rf_block|rs_data[5]~SCLR_LUT_combout\ : std_logic;
SIGNAL \rf_block|rs_data[5]~_Duplicate_1_q\ : std_logic;
SIGNAL \alu_block|Add0~29_combout\ : std_logic;
SIGNAL \alu_block|Add0~31\ : std_logic;
SIGNAL \alu_block|Add0~35_combout\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|selnose[9]~3_combout\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|selnose[9]~4_combout\ : std_logic;
SIGNAL \alu_block|Mult0|auto_generated|mac_out2~DATAOUT6\ : std_logic;
SIGNAL \alu_block|Add0~33_combout\ : std_logic;
SIGNAL \alu_block|Add0~37_combout\ : std_logic;
SIGNAL \rf_block|registers~40_combout\ : std_logic;
SIGNAL \rf_block|registers[3][6]~feeder_combout\ : std_logic;
SIGNAL \rf_block|registers[3][6]~q\ : std_logic;
SIGNAL \rf_block|rs_data~66_combout\ : std_logic;
SIGNAL \rf_block|rs_data~67_combout\ : std_logic;
SIGNAL \rf_block|rs_data~64_combout\ : std_logic;
SIGNAL \rf_block|rs_data~65_combout\ : std_logic;
SIGNAL \rf_block|rs_data~68_combout\ : std_logic;
SIGNAL \rf_block|rs_data~62_combout\ : std_logic;
SIGNAL \rf_block|rs_data~63_combout\ : std_logic;
SIGNAL \rf_block|rs_data~69_combout\ : std_logic;
SIGNAL \rf_block|rs_data~70_combout\ : std_logic;
SIGNAL \rf_block|rs_data~71_combout\ : std_logic;
SIGNAL \rf_block|rs_data[6]~SCLR_LUT_combout\ : std_logic;
SIGNAL \rf_block|rs_data[6]~_Duplicate_1_q\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|selnose[45]~2_combout\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|selnose[36]~1_combout\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~6_combout\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|StageOut[27]~7_combout\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~4_combout\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|StageOut[26]~8_combout\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~2_combout\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|StageOut[25]~9_combout\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|add_sub_3_result_int[0]~0_combout\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|StageOut[24]~10_combout\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|add_sub_4_result_int[0]~1\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~3\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~5\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~7\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~8_combout\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~9\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|StageOut[36]~11_combout\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~6_combout\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|StageOut[35]~12_combout\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~4_combout\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|StageOut[34]~13_combout\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~2_combout\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|StageOut[33]~14_combout\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|add_sub_4_result_int[0]~0_combout\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|StageOut[32]~15_combout\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[0]~1\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~3\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~5\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~7\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~9\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~11\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\ : std_logic;
SIGNAL \alu_block|Mult0|auto_generated|mac_out2~DATAOUT2\ : std_logic;
SIGNAL \alu_block|Add0~13_combout\ : std_logic;
SIGNAL \alu_block|Add0~17_combout\ : std_logic;
SIGNAL \rf_block|registers~27_combout\ : std_logic;
SIGNAL \rf_block|registers[7][2]~feeder_combout\ : std_logic;
SIGNAL \rf_block|registers[7][2]~q\ : std_logic;
SIGNAL \rf_block|rt_data~20_combout\ : std_logic;
SIGNAL \rf_block|rt_data~21_combout\ : std_logic;
SIGNAL \rf_block|rt_data~24_combout\ : std_logic;
SIGNAL \rf_block|rt_data~25_combout\ : std_logic;
SIGNAL \rf_block|rt_data~22_combout\ : std_logic;
SIGNAL \rf_block|rt_data~23_combout\ : std_logic;
SIGNAL \rf_block|rt_data~26_combout\ : std_logic;
SIGNAL \rf_block|rt_data~27_combout\ : std_logic;
SIGNAL \rf_block|rt_data~28_combout\ : std_logic;
SIGNAL \rf_block|rt_data~29_combout\ : std_logic;
SIGNAL \rf_block|rt_data[2]~SCLR_LUT_combout\ : std_logic;
SIGNAL \rf_block|rt_data[2]~_Duplicate_1_q\ : std_logic;
SIGNAL \alu_block|Add0~16\ : std_logic;
SIGNAL \alu_block|Add0~20_combout\ : std_logic;
SIGNAL \alu_block|Mult0|auto_generated|mac_out2~DATAOUT3\ : std_logic;
SIGNAL \alu_block|Add0~18_combout\ : std_logic;
SIGNAL \alu_block|Add0~22_combout\ : std_logic;
SIGNAL \rf_block|registers~31_combout\ : std_logic;
SIGNAL \rf_block|registers[8][3]~feeder_combout\ : std_logic;
SIGNAL \rf_block|registers[8][3]~q\ : std_logic;
SIGNAL \rf_block|rs_data~36_combout\ : std_logic;
SIGNAL \rf_block|rs_data~37_combout\ : std_logic;
SIGNAL \rf_block|rs_data~34_combout\ : std_logic;
SIGNAL \rf_block|rs_data~35_combout\ : std_logic;
SIGNAL \rf_block|rs_data~38_combout\ : std_logic;
SIGNAL \rf_block|rs_data~39_combout\ : std_logic;
SIGNAL \rf_block|rs_data~40_combout\ : std_logic;
SIGNAL \rf_block|rs_data~32_combout\ : std_logic;
SIGNAL \rf_block|rs_data~33_combout\ : std_logic;
SIGNAL \rf_block|rs_data~41_combout\ : std_logic;
SIGNAL \rf_block|rs_data[3]~SCLR_LUT_combout\ : std_logic;
SIGNAL \rf_block|rs_data[3]~_Duplicate_1_q\ : std_logic;
SIGNAL \alu_block|Add0~38_combout\ : std_logic;
SIGNAL \alu_block|Mult0|auto_generated|mac_out2~DATAOUT7\ : std_logic;
SIGNAL \alu_block|Add0~39_combout\ : std_logic;
SIGNAL \alu_block|Add0~40_combout\ : std_logic;
SIGNAL \alu_block|Add0~41_combout\ : std_logic;
SIGNAL \alu_block|Add0~36\ : std_logic;
SIGNAL \alu_block|Add0~42_combout\ : std_logic;
SIGNAL \alu_block|Add0~44_combout\ : std_logic;
SIGNAL \rf_block|registers~43_combout\ : std_logic;
SIGNAL \rf_block|registers[5][7]~feeder_combout\ : std_logic;
SIGNAL \rf_block|registers[5][7]~q\ : std_logic;
SIGNAL \rf_block|rs_data~72_combout\ : std_logic;
SIGNAL \rf_block|rs_data~73_combout\ : std_logic;
SIGNAL \rf_block|rs_data~74_combout\ : std_logic;
SIGNAL \rf_block|rs_data~75_combout\ : std_logic;
SIGNAL \rf_block|rs_data~76_combout\ : std_logic;
SIGNAL \rf_block|rs_data~77_combout\ : std_logic;
SIGNAL \rf_block|rs_data~78_combout\ : std_logic;
SIGNAL \rf_block|rs_data~79_combout\ : std_logic;
SIGNAL \rf_block|rs_data~80_combout\ : std_logic;
SIGNAL \rf_block|rs_data~81_combout\ : std_logic;
SIGNAL \rf_block|rs_data[7]~SCLR_LUT_combout\ : std_logic;
SIGNAL \rf_block|rs_data[7]~_Duplicate_1_q\ : std_logic;
SIGNAL \alu_block|Mult0|auto_generated|mac_out2~DATAOUT1\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~10_combout\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|StageOut[45]~16_combout\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~8_combout\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|StageOut[44]~17_combout\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~6_combout\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|StageOut[43]~18_combout\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~4_combout\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|StageOut[42]~19_combout\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~2_combout\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|StageOut[41]~20_combout\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[0]~0_combout\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|StageOut[40]~21_combout\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[0]~1\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[1]~3\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[2]~5\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[3]~7\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[4]~9\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~11\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[6]~13\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[7]~14_combout\ : std_logic;
SIGNAL \alu_block|Add0~8_combout\ : std_logic;
SIGNAL \alu_block|Add0~12_combout\ : std_logic;
SIGNAL \rf_block|registers~24_combout\ : std_logic;
SIGNAL \rf_block|registers[5][1]~feeder_combout\ : std_logic;
SIGNAL \rf_block|registers[5][1]~q\ : std_logic;
SIGNAL \rf_block|rt_data~12_combout\ : std_logic;
SIGNAL \rf_block|rt_data~13_combout\ : std_logic;
SIGNAL \rf_block|rt_data~14_combout\ : std_logic;
SIGNAL \rf_block|rt_data~15_combout\ : std_logic;
SIGNAL \rf_block|rt_data~16_combout\ : std_logic;
SIGNAL \rf_block|rt_data~17_combout\ : std_logic;
SIGNAL \rf_block|rt_data~18_combout\ : std_logic;
SIGNAL \rf_block|rt_data~10_combout\ : std_logic;
SIGNAL \rf_block|rt_data~11_combout\ : std_logic;
SIGNAL \rf_block|rt_data~19_combout\ : std_logic;
SIGNAL \rf_block|rt_data[1]~SCLR_LUT_combout\ : std_logic;
SIGNAL \alu_block|Mult0|auto_generated|mac_mult1~dataout\ : std_logic;
SIGNAL \alu_block|Mult0|auto_generated|mac_out2~dataout\ : std_logic;
SIGNAL \alu_block|Add0~5_combout\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[6]~12_combout\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|StageOut[54]~22_combout\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~10_combout\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|StageOut[53]~23_combout\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[4]~8_combout\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|StageOut[52]~24_combout\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[3]~6_combout\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|StageOut[51]~25_combout\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[2]~4_combout\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|StageOut[50]~26_combout\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[1]~2_combout\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|StageOut[49]~27_combout\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[0]~0_combout\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|StageOut[48]~28_combout\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|add_sub_7_result_int[0]~1_cout\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|add_sub_7_result_int[1]~3_cout\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|add_sub_7_result_int[2]~5_cout\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|add_sub_7_result_int[3]~7_cout\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|add_sub_7_result_int[4]~9_cout\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|add_sub_7_result_int[5]~11_cout\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|add_sub_7_result_int[6]~13_cout\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|add_sub_7_result_int[7]~15_cout\ : std_logic;
SIGNAL \alu_block|Div0|auto_generated|divider|divider|add_sub_7_result_int[8]~16_combout\ : std_logic;
SIGNAL \alu_block|Add0~7_combout\ : std_logic;
SIGNAL \rf_block|registers~18_combout\ : std_logic;
SIGNAL \rf_block|registers~19_combout\ : std_logic;
SIGNAL \rf_block|registers[13][0]~q\ : std_logic;
SIGNAL \rf_block|rs_data~7_combout\ : std_logic;
SIGNAL \rf_block|rs_data~8_combout\ : std_logic;
SIGNAL \rf_block|rs_data~0_combout\ : std_logic;
SIGNAL \rf_block|rs_data~1_combout\ : std_logic;
SIGNAL \rf_block|rs_data~2_combout\ : std_logic;
SIGNAL \rf_block|rs_data~3_combout\ : std_logic;
SIGNAL \rf_block|rs_data~4_combout\ : std_logic;
SIGNAL \rf_block|rs_data~5_combout\ : std_logic;
SIGNAL \rf_block|rs_data~6_combout\ : std_logic;
SIGNAL \rf_block|rs_data~9_combout\ : std_logic;
SIGNAL \rf_block|rs_data[0]~SCLR_LUT_combout\ : std_logic;
SIGNAL \rf_block|rs_data[0]~_Duplicate_1_q\ : std_logic;
SIGNAL \lsu_block|mem_read_addr~0_combout\ : std_logic;
SIGNAL \lsu_block|mem_read_addr[0]~feeder_combout\ : std_logic;
SIGNAL \lsu_block|Equal3~0_combout\ : std_logic;
SIGNAL \lsu_block|mem_read_addr[0]~1_combout\ : std_logic;
SIGNAL \lsu_block|mem_read_addr~2_combout\ : std_logic;
SIGNAL \lsu_block|mem_read_addr[1]~feeder_combout\ : std_logic;
SIGNAL \lsu_block|mem_read_addr~3_combout\ : std_logic;
SIGNAL \lsu_block|mem_read_addr[2]~feeder_combout\ : std_logic;
SIGNAL \lsu_block|mem_read_addr~4_combout\ : std_logic;
SIGNAL \lsu_block|mem_read_addr[3]~feeder_combout\ : std_logic;
SIGNAL \lsu_block|mem_read_addr~5_combout\ : std_logic;
SIGNAL \lsu_block|mem_read_addr[4]~feeder_combout\ : std_logic;
SIGNAL \lsu_block|mem_read_addr~6_combout\ : std_logic;
SIGNAL \lsu_block|mem_read_addr~7_combout\ : std_logic;
SIGNAL \lsu_block|mem_read_addr[6]~feeder_combout\ : std_logic;
SIGNAL \lsu_block|mem_read_addr~8_combout\ : std_logic;
SIGNAL \lsu_block|mem_write_addr[0]~0_combout\ : std_logic;
SIGNAL \lsu_block|mem_write_data~0_combout\ : std_logic;
SIGNAL \lsu_block|mem_write_data~1_combout\ : std_logic;
SIGNAL \lsu_block|mem_write_data~2_combout\ : std_logic;
SIGNAL \lsu_block|mem_write_data~3_combout\ : std_logic;
SIGNAL \lsu_block|mem_write_data~4_combout\ : std_logic;
SIGNAL \lsu_block|mem_write_data~5_combout\ : std_logic;
SIGNAL \lsu_block|mem_write_data~6_combout\ : std_logic;
SIGNAL \lsu_block|mem_write_data~7_combout\ : std_logic;
SIGNAL \current_pc[0]~input_o\ : std_logic;
SIGNAL \nzp_instr[2]~input_o\ : std_logic;
SIGNAL \alu_block|Equal1~2_combout\ : std_logic;
SIGNAL \alu_block|Equal1~1_combout\ : std_logic;
SIGNAL \alu_block|Equal1~3_combout\ : std_logic;
SIGNAL \alu_block|Equal1~0_combout\ : std_logic;
SIGNAL \alu_block|Equal1~4_combout\ : std_logic;
SIGNAL \pc_nzp_block|nzp~0_combout\ : std_logic;
SIGNAL \nzp_write_enable~input_o\ : std_logic;
SIGNAL \pc_nzp_block|nzp[2]~1_combout\ : std_logic;
SIGNAL \nzp_instr[0]~input_o\ : std_logic;
SIGNAL \nzp_instr[1]~input_o\ : std_logic;
SIGNAL \alu_block|LessThan0~1_cout\ : std_logic;
SIGNAL \alu_block|LessThan0~3_cout\ : std_logic;
SIGNAL \alu_block|LessThan0~5_cout\ : std_logic;
SIGNAL \alu_block|LessThan0~7_cout\ : std_logic;
SIGNAL \alu_block|LessThan0~9_cout\ : std_logic;
SIGNAL \alu_block|LessThan0~11_cout\ : std_logic;
SIGNAL \alu_block|LessThan0~13_cout\ : std_logic;
SIGNAL \alu_block|LessThan0~14_combout\ : std_logic;
SIGNAL \pc_nzp_block|nzp~2_combout\ : std_logic;
SIGNAL \pc_nzp_block|new_pc~0_combout\ : std_logic;
SIGNAL \pc_out_mux~input_o\ : std_logic;
SIGNAL \alu_block|LessThan1~1_cout\ : std_logic;
SIGNAL \alu_block|LessThan1~3_cout\ : std_logic;
SIGNAL \alu_block|LessThan1~5_cout\ : std_logic;
SIGNAL \alu_block|LessThan1~7_cout\ : std_logic;
SIGNAL \alu_block|LessThan1~9_cout\ : std_logic;
SIGNAL \alu_block|LessThan1~11_cout\ : std_logic;
SIGNAL \alu_block|LessThan1~13_cout\ : std_logic;
SIGNAL \alu_block|LessThan1~14_combout\ : std_logic;
SIGNAL \pc_nzp_block|nzp~3_combout\ : std_logic;
SIGNAL \pc_nzp_block|new_pc~1_combout\ : std_logic;
SIGNAL \pc_nzp_block|new_pc~2_combout\ : std_logic;
SIGNAL \current_pc[1]~input_o\ : std_logic;
SIGNAL \pc_nzp_block|new_pc~5_combout\ : std_logic;
SIGNAL \current_pc[2]~input_o\ : std_logic;
SIGNAL \pc_nzp_block|pc_incrementer|additions:2:adders|s~combout\ : std_logic;
SIGNAL \pc_nzp_block|new_pc~6_combout\ : std_logic;
SIGNAL \current_pc[3]~input_o\ : std_logic;
SIGNAL \pc_nzp_block|pc_incrementer|additions:3:adders|s~combout\ : std_logic;
SIGNAL \pc_nzp_block|new_pc~7_combout\ : std_logic;
SIGNAL \current_pc[4]~input_o\ : std_logic;
SIGNAL \pc_nzp_block|pc_incrementer|additions:3:adders|cout~0_combout\ : std_logic;
SIGNAL \pc_nzp_block|new_pc~8_combout\ : std_logic;
SIGNAL \pc_nzp_block|pc_incrementer|additions:4:adders|cout~0_combout\ : std_logic;
SIGNAL \current_pc[5]~input_o\ : std_logic;
SIGNAL \pc_nzp_block|new_pc~9_combout\ : std_logic;
SIGNAL \current_pc[6]~input_o\ : std_logic;
SIGNAL \pc_nzp_block|pc_incrementer|additions:5:adders|cout~0_combout\ : std_logic;
SIGNAL \pc_nzp_block|new_pc~10_combout\ : std_logic;
SIGNAL \current_pc[7]~input_o\ : std_logic;
SIGNAL \pc_nzp_block|pc_incrementer|additions:6:adders|cout~0_combout\ : std_logic;
SIGNAL \pc_nzp_block|new_pc~11_combout\ : std_logic;
SIGNAL \lsu_block|lsu_state\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \pc_nzp_block|new_pc\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \alu_block|alu_nzp\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \alu_block|alu_out\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \pc_nzp_block|nzp\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \lsu_block|mem_read_addr\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \lsu_block|mem_write_addr\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \lsu_block|mem_write_data\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \lsu_block|lsu_out\ : std_logic_vector(7 DOWNTO 0);

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_clock <= clock;
ww_reset <= reset;
ww_enable <= enable;
ww_core_state <= core_state;
ww_alu_select <= alu_select;
ww_rs_address <= rs_address;
ww_rt_address <= rt_address;
ww_rd_address <= rd_address;
ww_immediate <= immediate;
ww_current_pc <= current_pc;
ww_block_id <= block_id;
ww_nzp_write_enable <= nzp_write_enable;
ww_reg_write_enable <= reg_write_enable;
ww_pc_out_mux <= pc_out_mux;
ww_mem_write_en <= mem_write_en;
ww_mem_read_en <= mem_read_en;
ww_nzp_instr <= nzp_instr;
ww_reg_input_mux <= reg_input_mux;
ww_mem_read_ready <= mem_read_ready;
ww_mem_write_ready <= mem_write_ready;
ww_mem_read_data <= mem_read_data;
mem_read_address <= ww_mem_read_address;
mem_write_address <= ww_mem_write_address;
mem_write_data <= ww_mem_write_data;
new_pc <= ww_new_pc;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\alu_block|Mult0|auto_generated|mac_out2_DATAA_bus\ <= (\alu_block|Mult0|auto_generated|mac_mult1~DATAOUT15\ & \alu_block|Mult0|auto_generated|mac_mult1~DATAOUT14\ & \alu_block|Mult0|auto_generated|mac_mult1~DATAOUT13\ & 
\alu_block|Mult0|auto_generated|mac_mult1~DATAOUT12\ & \alu_block|Mult0|auto_generated|mac_mult1~DATAOUT11\ & \alu_block|Mult0|auto_generated|mac_mult1~DATAOUT10\ & \alu_block|Mult0|auto_generated|mac_mult1~DATAOUT9\ & 
\alu_block|Mult0|auto_generated|mac_mult1~DATAOUT8\ & \alu_block|Mult0|auto_generated|mac_mult1~DATAOUT7\ & \alu_block|Mult0|auto_generated|mac_mult1~DATAOUT6\ & \alu_block|Mult0|auto_generated|mac_mult1~DATAOUT5\ & 
\alu_block|Mult0|auto_generated|mac_mult1~DATAOUT4\ & \alu_block|Mult0|auto_generated|mac_mult1~DATAOUT3\ & \alu_block|Mult0|auto_generated|mac_mult1~DATAOUT2\ & \alu_block|Mult0|auto_generated|mac_mult1~DATAOUT1\ & 
\alu_block|Mult0|auto_generated|mac_mult1~dataout\ & \alu_block|Mult0|auto_generated|mac_mult1~1\ & \alu_block|Mult0|auto_generated|mac_mult1~0\);

\alu_block|Mult0|auto_generated|mac_out2~0\ <= \alu_block|Mult0|auto_generated|mac_out2_DATAOUT_bus\(0);
\alu_block|Mult0|auto_generated|mac_out2~1\ <= \alu_block|Mult0|auto_generated|mac_out2_DATAOUT_bus\(1);
\alu_block|Mult0|auto_generated|mac_out2~dataout\ <= \alu_block|Mult0|auto_generated|mac_out2_DATAOUT_bus\(2);
\alu_block|Mult0|auto_generated|mac_out2~DATAOUT1\ <= \alu_block|Mult0|auto_generated|mac_out2_DATAOUT_bus\(3);
\alu_block|Mult0|auto_generated|mac_out2~DATAOUT2\ <= \alu_block|Mult0|auto_generated|mac_out2_DATAOUT_bus\(4);
\alu_block|Mult0|auto_generated|mac_out2~DATAOUT3\ <= \alu_block|Mult0|auto_generated|mac_out2_DATAOUT_bus\(5);
\alu_block|Mult0|auto_generated|mac_out2~DATAOUT4\ <= \alu_block|Mult0|auto_generated|mac_out2_DATAOUT_bus\(6);
\alu_block|Mult0|auto_generated|mac_out2~DATAOUT5\ <= \alu_block|Mult0|auto_generated|mac_out2_DATAOUT_bus\(7);
\alu_block|Mult0|auto_generated|mac_out2~DATAOUT6\ <= \alu_block|Mult0|auto_generated|mac_out2_DATAOUT_bus\(8);
\alu_block|Mult0|auto_generated|mac_out2~DATAOUT7\ <= \alu_block|Mult0|auto_generated|mac_out2_DATAOUT_bus\(9);
\alu_block|Mult0|auto_generated|mac_out2~DATAOUT8\ <= \alu_block|Mult0|auto_generated|mac_out2_DATAOUT_bus\(10);
\alu_block|Mult0|auto_generated|mac_out2~DATAOUT9\ <= \alu_block|Mult0|auto_generated|mac_out2_DATAOUT_bus\(11);
\alu_block|Mult0|auto_generated|mac_out2~DATAOUT10\ <= \alu_block|Mult0|auto_generated|mac_out2_DATAOUT_bus\(12);
\alu_block|Mult0|auto_generated|mac_out2~DATAOUT11\ <= \alu_block|Mult0|auto_generated|mac_out2_DATAOUT_bus\(13);
\alu_block|Mult0|auto_generated|mac_out2~DATAOUT12\ <= \alu_block|Mult0|auto_generated|mac_out2_DATAOUT_bus\(14);
\alu_block|Mult0|auto_generated|mac_out2~DATAOUT13\ <= \alu_block|Mult0|auto_generated|mac_out2_DATAOUT_bus\(15);
\alu_block|Mult0|auto_generated|mac_out2~DATAOUT14\ <= \alu_block|Mult0|auto_generated|mac_out2_DATAOUT_bus\(16);
\alu_block|Mult0|auto_generated|mac_out2~DATAOUT15\ <= \alu_block|Mult0|auto_generated|mac_out2_DATAOUT_bus\(17);

\alu_block|Mult0|auto_generated|mac_mult1_DATAA_bus\ <= (\rf_block|rt_data[7]~SCLR_LUT_combout\ & \rf_block|rt_data[6]~SCLR_LUT_combout\ & \rf_block|rt_data[5]~SCLR_LUT_combout\ & \rf_block|rt_data[4]~SCLR_LUT_combout\ & 
\rf_block|rt_data[3]~SCLR_LUT_combout\ & \rf_block|rt_data[2]~SCLR_LUT_combout\ & \rf_block|rt_data[1]~SCLR_LUT_combout\ & \rf_block|rt_data[0]~SCLR_LUT_combout\ & gnd);

\alu_block|Mult0|auto_generated|mac_mult1_DATAB_bus\ <= (\rf_block|rs_data[7]~SCLR_LUT_combout\ & \rf_block|rs_data[6]~SCLR_LUT_combout\ & \rf_block|rs_data[5]~SCLR_LUT_combout\ & \rf_block|rs_data[4]~SCLR_LUT_combout\ & 
\rf_block|rs_data[3]~SCLR_LUT_combout\ & \rf_block|rs_data[2]~SCLR_LUT_combout\ & \rf_block|rs_data[1]~SCLR_LUT_combout\ & \rf_block|rs_data[0]~SCLR_LUT_combout\ & gnd);

\alu_block|Mult0|auto_generated|mac_mult1~0\ <= \alu_block|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(0);
\alu_block|Mult0|auto_generated|mac_mult1~1\ <= \alu_block|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(1);
\alu_block|Mult0|auto_generated|mac_mult1~dataout\ <= \alu_block|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(2);
\alu_block|Mult0|auto_generated|mac_mult1~DATAOUT1\ <= \alu_block|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(3);
\alu_block|Mult0|auto_generated|mac_mult1~DATAOUT2\ <= \alu_block|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(4);
\alu_block|Mult0|auto_generated|mac_mult1~DATAOUT3\ <= \alu_block|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(5);
\alu_block|Mult0|auto_generated|mac_mult1~DATAOUT4\ <= \alu_block|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(6);
\alu_block|Mult0|auto_generated|mac_mult1~DATAOUT5\ <= \alu_block|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(7);
\alu_block|Mult0|auto_generated|mac_mult1~DATAOUT6\ <= \alu_block|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(8);
\alu_block|Mult0|auto_generated|mac_mult1~DATAOUT7\ <= \alu_block|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(9);
\alu_block|Mult0|auto_generated|mac_mult1~DATAOUT8\ <= \alu_block|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(10);
\alu_block|Mult0|auto_generated|mac_mult1~DATAOUT9\ <= \alu_block|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(11);
\alu_block|Mult0|auto_generated|mac_mult1~DATAOUT10\ <= \alu_block|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(12);
\alu_block|Mult0|auto_generated|mac_mult1~DATAOUT11\ <= \alu_block|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(13);
\alu_block|Mult0|auto_generated|mac_mult1~DATAOUT12\ <= \alu_block|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(14);
\alu_block|Mult0|auto_generated|mac_mult1~DATAOUT13\ <= \alu_block|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(15);
\alu_block|Mult0|auto_generated|mac_mult1~DATAOUT14\ <= \alu_block|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(16);
\alu_block|Mult0|auto_generated|mac_mult1~DATAOUT15\ <= \alu_block|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(17);

\~QUARTUS_CREATED_ADC1~_CHSEL_bus\ <= (\~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\);

\clock~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clock~input_o\);
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: LCCOMB_X11_Y18_N20
\~QUARTUS_CREATED_GND~I\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \~QUARTUS_CREATED_GND~I_combout\ = GND

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \~QUARTUS_CREATED_GND~I_combout\);

-- Location: IOOBUF_X29_Y25_N30
\mem_read_address[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \lsu_block|mem_read_addr\(0),
	devoe => ww_devoe,
	o => \mem_read_address[0]~output_o\);

-- Location: IOOBUF_X31_Y22_N16
\mem_read_address[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \lsu_block|mem_read_addr\(1),
	devoe => ww_devoe,
	o => \mem_read_address[1]~output_o\);

-- Location: IOOBUF_X27_Y25_N9
\mem_read_address[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \lsu_block|mem_read_addr\(2),
	devoe => ww_devoe,
	o => \mem_read_address[2]~output_o\);

-- Location: IOOBUF_X24_Y25_N16
\mem_read_address[3]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \lsu_block|mem_read_addr\(3),
	devoe => ww_devoe,
	o => \mem_read_address[3]~output_o\);

-- Location: IOOBUF_X31_Y22_N23
\mem_read_address[4]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \lsu_block|mem_read_addr\(4),
	devoe => ww_devoe,
	o => \mem_read_address[4]~output_o\);

-- Location: IOOBUF_X24_Y25_N9
\mem_read_address[5]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \lsu_block|mem_read_addr\(5),
	devoe => ww_devoe,
	o => \mem_read_address[5]~output_o\);

-- Location: IOOBUF_X31_Y21_N2
\mem_read_address[6]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \lsu_block|mem_read_addr\(6),
	devoe => ww_devoe,
	o => \mem_read_address[6]~output_o\);

-- Location: IOOBUF_X31_Y21_N23
\mem_read_address[7]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \lsu_block|mem_read_addr\(7),
	devoe => ww_devoe,
	o => \mem_read_address[7]~output_o\);

-- Location: IOOBUF_X22_Y25_N2
\mem_write_address[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \lsu_block|mem_write_addr\(0),
	devoe => ww_devoe,
	o => \mem_write_address[0]~output_o\);

-- Location: IOOBUF_X31_Y17_N16
\mem_write_address[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \lsu_block|mem_write_addr\(1),
	devoe => ww_devoe,
	o => \mem_write_address[1]~output_o\);

-- Location: IOOBUF_X24_Y25_N2
\mem_write_address[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \lsu_block|mem_write_addr\(2),
	devoe => ww_devoe,
	o => \mem_write_address[2]~output_o\);

-- Location: IOOBUF_X27_Y25_N2
\mem_write_address[3]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \lsu_block|mem_write_addr\(3),
	devoe => ww_devoe,
	o => \mem_write_address[3]~output_o\);

-- Location: IOOBUF_X31_Y17_N2
\mem_write_address[4]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \lsu_block|mem_write_addr\(4),
	devoe => ww_devoe,
	o => \mem_write_address[4]~output_o\);

-- Location: IOOBUF_X29_Y25_N23
\mem_write_address[5]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \lsu_block|mem_write_addr\(5),
	devoe => ww_devoe,
	o => \mem_write_address[5]~output_o\);

-- Location: IOOBUF_X31_Y22_N2
\mem_write_address[6]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \lsu_block|mem_write_addr\(6),
	devoe => ww_devoe,
	o => \mem_write_address[6]~output_o\);

-- Location: IOOBUF_X31_Y21_N9
\mem_write_address[7]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \lsu_block|mem_write_addr\(7),
	devoe => ww_devoe,
	o => \mem_write_address[7]~output_o\);

-- Location: IOOBUF_X31_Y19_N9
\mem_write_data[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \lsu_block|mem_write_data\(0),
	devoe => ww_devoe,
	o => \mem_write_data[0]~output_o\);

-- Location: IOOBUF_X31_Y15_N2
\mem_write_data[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \lsu_block|mem_write_data\(1),
	devoe => ww_devoe,
	o => \mem_write_data[1]~output_o\);

-- Location: IOOBUF_X31_Y15_N9
\mem_write_data[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \lsu_block|mem_write_data\(2),
	devoe => ww_devoe,
	o => \mem_write_data[2]~output_o\);

-- Location: IOOBUF_X31_Y19_N23
\mem_write_data[3]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \lsu_block|mem_write_data\(3),
	devoe => ww_devoe,
	o => \mem_write_data[3]~output_o\);

-- Location: IOOBUF_X31_Y19_N16
\mem_write_data[4]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \lsu_block|mem_write_data\(4),
	devoe => ww_devoe,
	o => \mem_write_data[4]~output_o\);

-- Location: IOOBUF_X31_Y19_N2
\mem_write_data[5]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \lsu_block|mem_write_data\(5),
	devoe => ww_devoe,
	o => \mem_write_data[5]~output_o\);

-- Location: IOOBUF_X31_Y14_N2
\mem_write_data[6]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \lsu_block|mem_write_data\(6),
	devoe => ww_devoe,
	o => \mem_write_data[6]~output_o\);

-- Location: IOOBUF_X10_Y16_N9
\mem_write_data[7]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \lsu_block|mem_write_data\(7),
	devoe => ww_devoe,
	o => \mem_write_data[7]~output_o\);

-- Location: IOOBUF_X13_Y25_N2
\new_pc[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \pc_nzp_block|new_pc\(0),
	devoe => ww_devoe,
	o => \new_pc[0]~output_o\);

-- Location: IOOBUF_X15_Y25_N16
\new_pc[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \pc_nzp_block|new_pc\(1),
	devoe => ww_devoe,
	o => \new_pc[1]~output_o\);

-- Location: IOOBUF_X13_Y25_N9
\new_pc[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \pc_nzp_block|new_pc\(2),
	devoe => ww_devoe,
	o => \new_pc[2]~output_o\);

-- Location: IOOBUF_X11_Y25_N16
\new_pc[3]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \pc_nzp_block|new_pc\(3),
	devoe => ww_devoe,
	o => \new_pc[3]~output_o\);

-- Location: IOOBUF_X13_Y25_N23
\new_pc[4]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \pc_nzp_block|new_pc\(4),
	devoe => ww_devoe,
	o => \new_pc[4]~output_o\);

-- Location: IOOBUF_X10_Y17_N2
\new_pc[5]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \pc_nzp_block|new_pc\(5),
	devoe => ww_devoe,
	o => \new_pc[5]~output_o\);

-- Location: IOOBUF_X11_Y25_N30
\new_pc[6]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \pc_nzp_block|new_pc\(6),
	devoe => ww_devoe,
	o => \new_pc[6]~output_o\);

-- Location: IOOBUF_X13_Y25_N16
\new_pc[7]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \pc_nzp_block|new_pc\(7),
	devoe => ww_devoe,
	o => \new_pc[7]~output_o\);

-- Location: IOIBUF_X0_Y6_N15
\clock~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clock,
	o => \clock~input_o\);

-- Location: CLKCTRL_G3
\clock~inputclkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clock~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clock~inputclkctrl_outclk\);

-- Location: IOIBUF_X10_Y15_N22
\rs_address[0]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rs_address(0),
	o => \rs_address[0]~input_o\);

-- Location: IOIBUF_X10_Y19_N15
\immediate[0]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_immediate(0),
	o => \immediate[0]~input_o\);

-- Location: IOIBUF_X11_Y25_N22
\block_id[0]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_block_id(0),
	o => \block_id[0]~input_o\);

-- Location: IOIBUF_X29_Y25_N1
\mem_read_data[0]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_mem_read_data(0),
	o => \mem_read_data[0]~input_o\);

-- Location: IOIBUF_X15_Y25_N1
\reset~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

-- Location: LCCOMB_X20_Y21_N26
\lsu_block|lsu_out~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \lsu_block|lsu_out~0_combout\ = (\mem_read_data[0]~input_o\ & !\reset~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \mem_read_data[0]~input_o\,
	datad => \reset~input_o\,
	combout => \lsu_block|lsu_out~0_combout\);

-- Location: IOIBUF_X29_Y25_N15
\mem_read_en~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_mem_read_en,
	o => \mem_read_en~input_o\);

-- Location: IOIBUF_X31_Y17_N22
\enable~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_enable,
	o => \enable~input_o\);

-- Location: IOIBUF_X27_Y25_N15
\mem_write_ready~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_mem_write_ready,
	o => \mem_write_ready~input_o\);

-- Location: LCCOMB_X24_Y21_N16
\lsu_block|lsu_state[1]~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \lsu_block|lsu_state[1]~4_combout\ = (!\reset~input_o\ & (\lsu_block|lsu_state\(1) $ (((\lsu_block|lsu_state\(0) & !\lsu_block|lsu_state[0]~6_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \lsu_block|lsu_state\(0),
	datab => \reset~input_o\,
	datac => \lsu_block|lsu_state\(1),
	datad => \lsu_block|lsu_state[0]~6_combout\,
	combout => \lsu_block|lsu_state[1]~4_combout\);

-- Location: FF_X24_Y21_N17
\lsu_block|lsu_state[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \lsu_block|lsu_state[1]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \lsu_block|lsu_state\(1));

-- Location: LCCOMB_X24_Y21_N8
\lsu_block|lsu_state[0]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \lsu_block|lsu_state[0]~0_combout\ = (!\lsu_block|lsu_state\(0) & (\lsu_block|lsu_state\(1) & ((\enable~input_o\) # (!\mem_write_ready~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mem_write_ready~input_o\,
	datab => \enable~input_o\,
	datac => \lsu_block|lsu_state\(0),
	datad => \lsu_block|lsu_state\(1),
	combout => \lsu_block|lsu_state[0]~0_combout\);

-- Location: IOIBUF_X24_Y25_N22
\mem_read_ready~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_mem_read_ready,
	o => \mem_read_ready~input_o\);

-- Location: LCCOMB_X24_Y21_N10
\lsu_block|lsu_state[0]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \lsu_block|lsu_state[0]~1_combout\ = (\lsu_block|lsu_state[0]~0_combout\ & ((!\mem_read_ready~input_o\) # (!\enable~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \enable~input_o\,
	datac => \lsu_block|lsu_state[0]~0_combout\,
	datad => \mem_read_ready~input_o\,
	combout => \lsu_block|lsu_state[0]~1_combout\);

-- Location: IOIBUF_X27_Y25_N22
\core_state[0]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_core_state(0),
	o => \core_state[0]~input_o\);

-- Location: IOIBUF_X24_Y25_N29
\core_state[2]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_core_state(2),
	o => \core_state[2]~input_o\);

-- Location: IOIBUF_X31_Y21_N15
\core_state[1]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_core_state(1),
	o => \core_state[1]~input_o\);

-- Location: LCCOMB_X24_Y21_N0
\lsu_block|Equal5~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \lsu_block|Equal5~0_combout\ = (!\core_state[0]~input_o\ & (\core_state[2]~input_o\ & \core_state[1]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \core_state[0]~input_o\,
	datac => \core_state[2]~input_o\,
	datad => \core_state[1]~input_o\,
	combout => \lsu_block|Equal5~0_combout\);

-- Location: LCCOMB_X24_Y21_N20
\rf_block|rs_data[7]~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rs_data[7]~10_combout\ = (\core_state[0]~input_o\ & (!\core_state[2]~input_o\ & \core_state[1]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \core_state[0]~input_o\,
	datac => \core_state[2]~input_o\,
	datad => \core_state[1]~input_o\,
	combout => \rf_block|rs_data[7]~10_combout\);

-- Location: LCCOMB_X24_Y21_N4
\lsu_block|lsu_state[0]~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \lsu_block|lsu_state[0]~5_combout\ = (\lsu_block|lsu_state\(0) & (!\lsu_block|Equal5~0_combout\ & ((\lsu_block|lsu_state\(1))))) # (!\lsu_block|lsu_state\(0) & (((!\rf_block|rs_data[7]~10_combout\ & !\lsu_block|lsu_state\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \lsu_block|Equal5~0_combout\,
	datab => \rf_block|rs_data[7]~10_combout\,
	datac => \lsu_block|lsu_state\(0),
	datad => \lsu_block|lsu_state\(1),
	combout => \lsu_block|lsu_state[0]~5_combout\);

-- Location: IOIBUF_X29_Y25_N8
\mem_write_en~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_mem_write_en,
	o => \mem_write_en~input_o\);

-- Location: LCCOMB_X24_Y21_N30
\lsu_block|lsu_state[0]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \lsu_block|lsu_state[0]~2_combout\ = (\enable~input_o\ & ((!\mem_read_en~input_o\))) # (!\enable~input_o\ & (!\mem_write_en~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001111001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \enable~input_o\,
	datac => \mem_write_en~input_o\,
	datad => \mem_read_en~input_o\,
	combout => \lsu_block|lsu_state[0]~2_combout\);

-- Location: LCCOMB_X24_Y21_N22
\lsu_block|lsu_state[0]~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \lsu_block|lsu_state[0]~6_combout\ = (\lsu_block|lsu_state[0]~5_combout\) # ((\lsu_block|lsu_state[0]~2_combout\) # ((\lsu_block|lsu_state[0]~1_combout\ & \lsu_block|lsu_state\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \lsu_block|lsu_state[0]~1_combout\,
	datab => \lsu_block|lsu_state[0]~5_combout\,
	datac => \lsu_block|lsu_state[0]~2_combout\,
	datad => \lsu_block|lsu_state\(1),
	combout => \lsu_block|lsu_state[0]~6_combout\);

-- Location: LCCOMB_X24_Y18_N16
\lsu_block|lsu_state[0]~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \lsu_block|lsu_state[0]~3_combout\ = (!\reset~input_o\ & (\lsu_block|lsu_state\(0) $ (!\lsu_block|lsu_state[0]~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \reset~input_o\,
	datac => \lsu_block|lsu_state\(0),
	datad => \lsu_block|lsu_state[0]~6_combout\,
	combout => \lsu_block|lsu_state[0]~3_combout\);

-- Location: FF_X24_Y18_N17
\lsu_block|lsu_state[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \lsu_block|lsu_state[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \lsu_block|lsu_state\(0));

-- Location: LCCOMB_X24_Y21_N24
\lsu_block|lsu_out[2]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \lsu_block|lsu_out[2]~1_combout\ = (((\lsu_block|lsu_state\(0)) # (!\lsu_block|lsu_state\(1))) # (!\enable~input_o\)) # (!\mem_read_en~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mem_read_en~input_o\,
	datab => \enable~input_o\,
	datac => \lsu_block|lsu_state\(0),
	datad => \lsu_block|lsu_state\(1),
	combout => \lsu_block|lsu_out[2]~1_combout\);

-- Location: LCCOMB_X24_Y21_N14
\lsu_block|lsu_out[2]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \lsu_block|lsu_out[2]~2_combout\ = (\reset~input_o\) # ((!\lsu_block|lsu_out[2]~1_combout\ & \mem_read_ready~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \lsu_block|lsu_out[2]~1_combout\,
	datac => \reset~input_o\,
	datad => \mem_read_ready~input_o\,
	combout => \lsu_block|lsu_out[2]~2_combout\);

-- Location: FF_X20_Y21_N27
\lsu_block|lsu_out[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \lsu_block|lsu_out~0_combout\,
	ena => \lsu_block|lsu_out[2]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \lsu_block|lsu_out\(0));

-- Location: IOIBUF_X10_Y15_N15
\alu_select[1]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_alu_select(1),
	o => \alu_select[1]~input_o\);

-- Location: IOIBUF_X31_Y15_N22
\alu_select[0]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_alu_select(0),
	o => \alu_select[0]~input_o\);

-- Location: IOIBUF_X10_Y20_N8
\reg_input_mux[0]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reg_input_mux(0),
	o => \reg_input_mux[0]~input_o\);

-- Location: LCCOMB_X20_Y21_N4
\rf_block|registers~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers~0_combout\ = (\reg_input_mux[0]~input_o\ & (\lsu_block|lsu_out\(0))) # (!\reg_input_mux[0]~input_o\ & ((\alu_block|alu_out\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \lsu_block|lsu_out\(0),
	datab => \reg_input_mux[0]~input_o\,
	datac => \alu_block|alu_out\(0),
	combout => \rf_block|registers~0_combout\);

-- Location: LCCOMB_X15_Y19_N16
\rf_block|registers[3][0]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[3][0]~feeder_combout\ = \rf_block|registers~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rf_block|registers~0_combout\,
	combout => \rf_block|registers[3][0]~feeder_combout\);

-- Location: IOIBUF_X10_Y15_N1
\reg_input_mux[1]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reg_input_mux(1),
	o => \reg_input_mux[1]~input_o\);

-- Location: IOIBUF_X10_Y22_N1
\rd_address[2]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rd_address(2),
	o => \rd_address[2]~input_o\);

-- Location: IOIBUF_X31_Y20_N15
\rd_address[0]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rd_address(0),
	o => \rd_address[0]~input_o\);

-- Location: IOIBUF_X17_Y25_N22
\rd_address[3]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rd_address(3),
	o => \rd_address[3]~input_o\);

-- Location: IOIBUF_X17_Y25_N29
\rd_address[1]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rd_address(1),
	o => \rd_address[1]~input_o\);

-- Location: LCCOMB_X18_Y22_N4
\rf_block|Decoder0~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|Decoder0~11_combout\ = (!\rd_address[2]~input_o\ & (\rd_address[0]~input_o\ & (!\rd_address[3]~input_o\ & \rd_address[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rd_address[2]~input_o\,
	datab => \rd_address[0]~input_o\,
	datac => \rd_address[3]~input_o\,
	datad => \rd_address[1]~input_o\,
	combout => \rf_block|Decoder0~11_combout\);

-- Location: IOIBUF_X22_Y25_N15
\reg_write_enable~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reg_write_enable,
	o => \reg_write_enable~input_o\);

-- Location: LCCOMB_X20_Y20_N16
\rf_block|registers[0][2]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[0][2]~2_combout\ = (\reg_write_enable~input_o\ & (\enable~input_o\ & ((!\reg_input_mux[1]~input_o\) # (!\reg_input_mux[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reg_input_mux[0]~input_o\,
	datab => \reg_write_enable~input_o\,
	datac => \reg_input_mux[1]~input_o\,
	datad => \enable~input_o\,
	combout => \rf_block|registers[0][2]~2_combout\);

-- Location: LCCOMB_X20_Y20_N6
\rf_block|registers~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers~1_combout\ = (((!\rd_address[0]~input_o\ & !\rd_address[1]~input_o\)) # (!\rd_address[2]~input_o\)) # (!\rd_address[3]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111101111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rd_address[0]~input_o\,
	datab => \rd_address[3]~input_o\,
	datac => \rd_address[2]~input_o\,
	datad => \rd_address[1]~input_o\,
	combout => \rf_block|registers~1_combout\);

-- Location: LCCOMB_X20_Y20_N26
\rf_block|registers[0][2]~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[0][2]~3_combout\ = (\rf_block|registers[0][2]~2_combout\ & (\lsu_block|Equal5~0_combout\ & \rf_block|registers~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \rf_block|registers[0][2]~2_combout\,
	datac => \lsu_block|Equal5~0_combout\,
	datad => \rf_block|registers~1_combout\,
	combout => \rf_block|registers[0][2]~3_combout\);

-- Location: LCCOMB_X18_Y22_N10
\rf_block|registers[3][4]~15\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[3][4]~15_combout\ = (\reset~input_o\) # ((\rf_block|Decoder0~11_combout\ & \rf_block|registers[0][2]~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \rf_block|Decoder0~11_combout\,
	datac => \rf_block|registers[0][2]~3_combout\,
	datad => \reset~input_o\,
	combout => \rf_block|registers[3][4]~15_combout\);

-- Location: FF_X15_Y19_N17
\rf_block|registers[3][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[3][0]~feeder_combout\,
	asdata => \immediate[0]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[3][4]~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[3][0]~q\);

-- Location: LCCOMB_X15_Y20_N26
\rf_block|registers[2][0]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[2][0]~feeder_combout\ = \rf_block|registers~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rf_block|registers~0_combout\,
	combout => \rf_block|registers[2][0]~feeder_combout\);

-- Location: LCCOMB_X18_Y22_N24
\rf_block|Decoder0~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|Decoder0~8_combout\ = (!\rd_address[2]~input_o\ & (!\rd_address[0]~input_o\ & (!\rd_address[3]~input_o\ & \rd_address[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rd_address[2]~input_o\,
	datab => \rd_address[0]~input_o\,
	datac => \rd_address[3]~input_o\,
	datad => \rd_address[1]~input_o\,
	combout => \rf_block|Decoder0~8_combout\);

-- Location: LCCOMB_X20_Y19_N10
\rf_block|registers[2][4]~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[2][4]~12_combout\ = (\reset~input_o\) # ((\rf_block|registers[0][2]~3_combout\ & \rf_block|Decoder0~8_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datac => \rf_block|registers[0][2]~3_combout\,
	datad => \rf_block|Decoder0~8_combout\,
	combout => \rf_block|registers[2][4]~12_combout\);

-- Location: FF_X15_Y20_N27
\rf_block|registers[2][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[2][0]~feeder_combout\,
	asdata => \immediate[0]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[2][4]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[2][0]~q\);

-- Location: IOIBUF_X10_Y18_N1
\rt_address[1]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rt_address(1),
	o => \rt_address[1]~input_o\);

-- Location: LCCOMB_X17_Y18_N30
\rf_block|registers[0][0]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[0][0]~feeder_combout\ = \rf_block|registers~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \rf_block|registers~0_combout\,
	combout => \rf_block|registers[0][0]~feeder_combout\);

-- Location: LCCOMB_X18_Y22_N20
\rf_block|Decoder0~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|Decoder0~10_combout\ = (!\rd_address[2]~input_o\ & (!\rd_address[0]~input_o\ & (!\rd_address[3]~input_o\ & !\rd_address[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rd_address[2]~input_o\,
	datab => \rd_address[0]~input_o\,
	datac => \rd_address[3]~input_o\,
	datad => \rd_address[1]~input_o\,
	combout => \rf_block|Decoder0~10_combout\);

-- Location: LCCOMB_X18_Y22_N6
\rf_block|registers[0][2]~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[0][2]~14_combout\ = (\reset~input_o\) # ((\rf_block|registers[0][2]~3_combout\ & \rf_block|Decoder0~10_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \reset~input_o\,
	datac => \rf_block|registers[0][2]~3_combout\,
	datad => \rf_block|Decoder0~10_combout\,
	combout => \rf_block|registers[0][2]~14_combout\);

-- Location: FF_X17_Y18_N31
\rf_block|registers[0][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[0][0]~feeder_combout\,
	asdata => \immediate[0]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[0][2]~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[0][0]~q\);

-- Location: IOIBUF_X10_Y20_N1
\rt_address[0]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rt_address(0),
	o => \rt_address[0]~input_o\);

-- Location: LCCOMB_X18_Y18_N30
\rf_block|registers[1][0]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[1][0]~feeder_combout\ = \rf_block|registers~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rf_block|registers~0_combout\,
	combout => \rf_block|registers[1][0]~feeder_combout\);

-- Location: LCCOMB_X18_Y22_N14
\rf_block|Decoder0~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|Decoder0~9_combout\ = (!\rd_address[2]~input_o\ & (\rd_address[0]~input_o\ & (!\rd_address[3]~input_o\ & !\rd_address[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rd_address[2]~input_o\,
	datab => \rd_address[0]~input_o\,
	datac => \rd_address[3]~input_o\,
	datad => \rd_address[1]~input_o\,
	combout => \rf_block|Decoder0~9_combout\);

-- Location: LCCOMB_X19_Y21_N10
\rf_block|registers[1][5]~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[1][5]~13_combout\ = (\reset~input_o\) # ((\rf_block|Decoder0~9_combout\ & \rf_block|registers[0][2]~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|Decoder0~9_combout\,
	datab => \rf_block|registers[0][2]~3_combout\,
	datad => \reset~input_o\,
	combout => \rf_block|registers[1][5]~13_combout\);

-- Location: FF_X18_Y18_N31
\rf_block|registers[1][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[1][0]~feeder_combout\,
	asdata => \immediate[0]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[1][5]~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[1][0]~q\);

-- Location: LCCOMB_X16_Y18_N18
\rf_block|rt_data~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rt_data~4_combout\ = (\rt_address[0]~input_o\ & (((\rt_address[1]~input_o\) # (\rf_block|registers[1][0]~q\)))) # (!\rt_address[0]~input_o\ & (\rf_block|registers[0][0]~q\ & (!\rt_address[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers[0][0]~q\,
	datab => \rt_address[0]~input_o\,
	datac => \rt_address[1]~input_o\,
	datad => \rf_block|registers[1][0]~q\,
	combout => \rf_block|rt_data~4_combout\);

-- Location: LCCOMB_X16_Y18_N12
\rf_block|rt_data~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rt_data~5_combout\ = (\rt_address[1]~input_o\ & ((\rf_block|rt_data~4_combout\ & (\rf_block|registers[3][0]~q\)) # (!\rf_block|rt_data~4_combout\ & ((\rf_block|registers[2][0]~q\))))) # (!\rt_address[1]~input_o\ & 
-- (((\rf_block|rt_data~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers[3][0]~q\,
	datab => \rf_block|registers[2][0]~q\,
	datac => \rt_address[1]~input_o\,
	datad => \rf_block|rt_data~4_combout\,
	combout => \rf_block|rt_data~5_combout\);

-- Location: LCCOMB_X17_Y19_N30
\rf_block|registers[7][0]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[7][0]~feeder_combout\ = \rf_block|registers~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \rf_block|registers~0_combout\,
	combout => \rf_block|registers[7][0]~feeder_combout\);

-- Location: LCCOMB_X19_Y21_N22
\rf_block|Decoder0~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|Decoder0~7_combout\ = (!\rd_address[3]~input_o\ & (\rd_address[2]~input_o\ & (\rd_address[1]~input_o\ & \rd_address[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rd_address[3]~input_o\,
	datab => \rd_address[2]~input_o\,
	datac => \rd_address[1]~input_o\,
	datad => \rd_address[0]~input_o\,
	combout => \rf_block|Decoder0~7_combout\);

-- Location: LCCOMB_X19_Y21_N0
\rf_block|registers[7][1]~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[7][1]~11_combout\ = (\reset~input_o\) # ((\rf_block|registers[0][2]~3_combout\ & \rf_block|Decoder0~7_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \rf_block|registers[0][2]~3_combout\,
	datac => \rf_block|Decoder0~7_combout\,
	datad => \reset~input_o\,
	combout => \rf_block|registers[7][1]~11_combout\);

-- Location: FF_X17_Y19_N31
\rf_block|registers[7][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[7][0]~feeder_combout\,
	asdata => \immediate[0]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[7][1]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[7][0]~q\);

-- Location: LCCOMB_X17_Y19_N8
\rf_block|registers[5][0]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[5][0]~feeder_combout\ = \rf_block|registers~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \rf_block|registers~0_combout\,
	combout => \rf_block|registers[5][0]~feeder_combout\);

-- Location: LCCOMB_X18_Y22_N28
\rf_block|Decoder0~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|Decoder0~4_combout\ = (\rd_address[2]~input_o\ & (\rd_address[0]~input_o\ & (!\rd_address[3]~input_o\ & !\rd_address[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rd_address[2]~input_o\,
	datab => \rd_address[0]~input_o\,
	datac => \rd_address[3]~input_o\,
	datad => \rd_address[1]~input_o\,
	combout => \rf_block|Decoder0~4_combout\);

-- Location: LCCOMB_X18_Y22_N18
\rf_block|registers[5][7]~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[5][7]~8_combout\ = (\reset~input_o\) # ((\rf_block|registers[0][2]~3_combout\ & \rf_block|Decoder0~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \reset~input_o\,
	datac => \rf_block|registers[0][2]~3_combout\,
	datad => \rf_block|Decoder0~4_combout\,
	combout => \rf_block|registers[5][7]~8_combout\);

-- Location: FF_X17_Y19_N9
\rf_block|registers[5][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[5][0]~feeder_combout\,
	asdata => \immediate[0]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[5][7]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[5][0]~q\);

-- Location: LCCOMB_X15_Y20_N8
\rf_block|registers[6][0]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[6][0]~feeder_combout\ = \rf_block|registers~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rf_block|registers~0_combout\,
	combout => \rf_block|registers[6][0]~feeder_combout\);

-- Location: LCCOMB_X18_Y22_N16
\rf_block|Decoder0~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|Decoder0~5_combout\ = (\rd_address[2]~input_o\ & (!\rd_address[0]~input_o\ & (!\rd_address[3]~input_o\ & \rd_address[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rd_address[2]~input_o\,
	datab => \rd_address[0]~input_o\,
	datac => \rd_address[3]~input_o\,
	datad => \rd_address[1]~input_o\,
	combout => \rf_block|Decoder0~5_combout\);

-- Location: LCCOMB_X18_Y22_N26
\rf_block|registers[6][3]~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[6][3]~9_combout\ = (\reset~input_o\) # ((\rf_block|registers[0][2]~3_combout\ & \rf_block|Decoder0~5_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \reset~input_o\,
	datac => \rf_block|registers[0][2]~3_combout\,
	datad => \rf_block|Decoder0~5_combout\,
	combout => \rf_block|registers[6][3]~9_combout\);

-- Location: FF_X15_Y20_N9
\rf_block|registers[6][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[6][0]~feeder_combout\,
	asdata => \immediate[0]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[6][3]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[6][0]~q\);

-- Location: LCCOMB_X17_Y18_N24
\rf_block|registers[4][0]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[4][0]~feeder_combout\ = \rf_block|registers~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \rf_block|registers~0_combout\,
	combout => \rf_block|registers[4][0]~feeder_combout\);

-- Location: LCCOMB_X18_Y22_N0
\rf_block|Decoder0~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|Decoder0~6_combout\ = (\rd_address[2]~input_o\ & (!\rd_address[0]~input_o\ & (!\rd_address[3]~input_o\ & !\rd_address[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rd_address[2]~input_o\,
	datab => \rd_address[0]~input_o\,
	datac => \rd_address[3]~input_o\,
	datad => \rd_address[1]~input_o\,
	combout => \rf_block|Decoder0~6_combout\);

-- Location: LCCOMB_X18_Y22_N2
\rf_block|registers[4][4]~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[4][4]~10_combout\ = (\reset~input_o\) # ((\rf_block|registers[0][2]~3_combout\ & \rf_block|Decoder0~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \reset~input_o\,
	datac => \rf_block|registers[0][2]~3_combout\,
	datad => \rf_block|Decoder0~6_combout\,
	combout => \rf_block|registers[4][4]~10_combout\);

-- Location: FF_X17_Y18_N25
\rf_block|registers[4][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[4][0]~feeder_combout\,
	asdata => \immediate[0]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[4][4]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[4][0]~q\);

-- Location: LCCOMB_X16_Y18_N26
\rf_block|rt_data~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rt_data~2_combout\ = (\rt_address[0]~input_o\ & (((\rt_address[1]~input_o\)))) # (!\rt_address[0]~input_o\ & ((\rt_address[1]~input_o\ & (\rf_block|registers[6][0]~q\)) # (!\rt_address[1]~input_o\ & ((\rf_block|registers[4][0]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers[6][0]~q\,
	datab => \rt_address[0]~input_o\,
	datac => \rt_address[1]~input_o\,
	datad => \rf_block|registers[4][0]~q\,
	combout => \rf_block|rt_data~2_combout\);

-- Location: LCCOMB_X16_Y18_N24
\rf_block|rt_data~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rt_data~3_combout\ = (\rf_block|rt_data~2_combout\ & ((\rf_block|registers[7][0]~q\) # ((!\rt_address[0]~input_o\)))) # (!\rf_block|rt_data~2_combout\ & (((\rf_block|registers[5][0]~q\ & \rt_address[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers[7][0]~q\,
	datab => \rf_block|registers[5][0]~q\,
	datac => \rf_block|rt_data~2_combout\,
	datad => \rt_address[0]~input_o\,
	combout => \rf_block|rt_data~3_combout\);

-- Location: IOIBUF_X10_Y19_N8
\rt_address[2]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rt_address(2),
	o => \rt_address[2]~input_o\);

-- Location: IOIBUF_X10_Y19_N22
\rt_address[3]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rt_address(3),
	o => \rt_address[3]~input_o\);

-- Location: LCCOMB_X16_Y18_N14
\rf_block|rt_data~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rt_data~6_combout\ = (\rt_address[2]~input_o\ & (((\rf_block|rt_data~3_combout\) # (\rt_address[3]~input_o\)))) # (!\rt_address[2]~input_o\ & (\rf_block|rt_data~5_combout\ & ((!\rt_address[3]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rt_data~5_combout\,
	datab => \rf_block|rt_data~3_combout\,
	datac => \rt_address[2]~input_o\,
	datad => \rt_address[3]~input_o\,
	combout => \rf_block|rt_data~6_combout\);

-- Location: LCCOMB_X18_Y20_N20
\rf_block|registers[9][0]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[9][0]~feeder_combout\ = \rf_block|registers~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rf_block|registers~0_combout\,
	combout => \rf_block|registers[9][0]~feeder_combout\);

-- Location: LCCOMB_X18_Y20_N8
\rf_block|Decoder0~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|Decoder0~1_combout\ = (\rd_address[0]~input_o\ & (!\rd_address[2]~input_o\ & (\rd_address[3]~input_o\ & !\rd_address[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rd_address[0]~input_o\,
	datab => \rd_address[2]~input_o\,
	datac => \rd_address[3]~input_o\,
	datad => \rd_address[1]~input_o\,
	combout => \rf_block|Decoder0~1_combout\);

-- Location: LCCOMB_X18_Y20_N26
\rf_block|registers[9][5]~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[9][5]~5_combout\ = (\reset~input_o\) # ((\rf_block|Decoder0~1_combout\ & \rf_block|registers[0][2]~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datac => \rf_block|Decoder0~1_combout\,
	datad => \rf_block|registers[0][2]~3_combout\,
	combout => \rf_block|registers[9][5]~5_combout\);

-- Location: FF_X18_Y20_N21
\rf_block|registers[9][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[9][0]~feeder_combout\,
	asdata => \immediate[0]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[9][5]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[9][0]~q\);

-- Location: LCCOMB_X16_Y21_N28
\rf_block|registers[8][0]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[8][0]~feeder_combout\ = \rf_block|registers~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rf_block|registers~0_combout\,
	combout => \rf_block|registers[8][0]~feeder_combout\);

-- Location: LCCOMB_X18_Y20_N24
\rf_block|Decoder0~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|Decoder0~2_combout\ = (!\rd_address[0]~input_o\ & (!\rd_address[2]~input_o\ & (\rd_address[3]~input_o\ & !\rd_address[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rd_address[0]~input_o\,
	datab => \rd_address[2]~input_o\,
	datac => \rd_address[3]~input_o\,
	datad => \rd_address[1]~input_o\,
	combout => \rf_block|Decoder0~2_combout\);

-- Location: LCCOMB_X18_Y20_N6
\rf_block|registers[8][5]~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[8][5]~6_combout\ = (\reset~input_o\) # ((\rf_block|Decoder0~2_combout\ & \rf_block|registers[0][2]~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => \rf_block|Decoder0~2_combout\,
	datad => \rf_block|registers[0][2]~3_combout\,
	combout => \rf_block|registers[8][5]~6_combout\);

-- Location: FF_X16_Y21_N29
\rf_block|registers[8][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[8][0]~feeder_combout\,
	asdata => \immediate[0]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[8][5]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[8][0]~q\);

-- Location: LCCOMB_X16_Y18_N22
\rf_block|rt_data~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rt_data~0_combout\ = (\rt_address[0]~input_o\ & ((\rf_block|registers[9][0]~q\) # ((\rt_address[1]~input_o\)))) # (!\rt_address[0]~input_o\ & (((!\rt_address[1]~input_o\ & \rf_block|registers[8][0]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers[9][0]~q\,
	datab => \rt_address[0]~input_o\,
	datac => \rt_address[1]~input_o\,
	datad => \rf_block|registers[8][0]~q\,
	combout => \rf_block|rt_data~0_combout\);

-- Location: LCCOMB_X16_Y20_N24
\rf_block|registers[10][0]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[10][0]~feeder_combout\ = \rf_block|registers~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rf_block|registers~0_combout\,
	combout => \rf_block|registers[10][0]~feeder_combout\);

-- Location: LCCOMB_X18_Y20_N12
\rf_block|Decoder0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|Decoder0~0_combout\ = (!\rd_address[0]~input_o\ & (!\rd_address[2]~input_o\ & (\rd_address[3]~input_o\ & \rd_address[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rd_address[0]~input_o\,
	datab => \rd_address[2]~input_o\,
	datac => \rd_address[3]~input_o\,
	datad => \rd_address[1]~input_o\,
	combout => \rf_block|Decoder0~0_combout\);

-- Location: LCCOMB_X18_Y20_N22
\rf_block|registers[10][5]~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[10][5]~4_combout\ = (\reset~input_o\) # ((\rf_block|Decoder0~0_combout\ & \rf_block|registers[0][2]~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|Decoder0~0_combout\,
	datab => \rf_block|registers[0][2]~3_combout\,
	datad => \reset~input_o\,
	combout => \rf_block|registers[10][5]~4_combout\);

-- Location: FF_X16_Y20_N25
\rf_block|registers[10][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[10][0]~feeder_combout\,
	asdata => \immediate[0]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[10][5]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[10][0]~q\);

-- Location: LCCOMB_X18_Y18_N16
\rf_block|registers[11][0]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[11][0]~feeder_combout\ = \rf_block|registers~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rf_block|registers~0_combout\,
	combout => \rf_block|registers[11][0]~feeder_combout\);

-- Location: LCCOMB_X19_Y21_N18
\rf_block|Decoder0~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|Decoder0~3_combout\ = (\rd_address[3]~input_o\ & (!\rd_address[2]~input_o\ & (\rd_address[1]~input_o\ & \rd_address[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rd_address[3]~input_o\,
	datab => \rd_address[2]~input_o\,
	datac => \rd_address[1]~input_o\,
	datad => \rd_address[0]~input_o\,
	combout => \rf_block|Decoder0~3_combout\);

-- Location: LCCOMB_X19_Y21_N24
\rf_block|registers[11][2]~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[11][2]~7_combout\ = (\reset~input_o\) # ((\rf_block|registers[0][2]~3_combout\ & \rf_block|Decoder0~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \reset~input_o\,
	datac => \rf_block|registers[0][2]~3_combout\,
	datad => \rf_block|Decoder0~3_combout\,
	combout => \rf_block|registers[11][2]~7_combout\);

-- Location: FF_X18_Y18_N17
\rf_block|registers[11][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[11][0]~feeder_combout\,
	asdata => \immediate[0]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[11][2]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[11][0]~q\);

-- Location: LCCOMB_X16_Y18_N28
\rf_block|rt_data~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rt_data~1_combout\ = (\rf_block|rt_data~0_combout\ & (((\rf_block|registers[11][0]~q\) # (!\rt_address[1]~input_o\)))) # (!\rf_block|rt_data~0_combout\ & (\rf_block|registers[10][0]~q\ & (\rt_address[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rt_data~0_combout\,
	datab => \rf_block|registers[10][0]~q\,
	datac => \rt_address[1]~input_o\,
	datad => \rf_block|registers[11][0]~q\,
	combout => \rf_block|rt_data~1_combout\);

-- Location: LCCOMB_X16_Y20_N14
\rf_block|registers[14][0]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[14][0]~feeder_combout\ = \rf_block|registers~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rf_block|registers~0_combout\,
	combout => \rf_block|registers[14][0]~feeder_combout\);

-- Location: LCCOMB_X18_Y22_N12
\rf_block|Decoder0~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|Decoder0~13_combout\ = (\rd_address[2]~input_o\ & (!\rd_address[0]~input_o\ & (\rd_address[3]~input_o\ & \rd_address[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rd_address[2]~input_o\,
	datab => \rd_address[0]~input_o\,
	datac => \rd_address[3]~input_o\,
	datad => \rd_address[1]~input_o\,
	combout => \rf_block|Decoder0~13_combout\);

-- Location: LCCOMB_X18_Y22_N22
\rf_block|registers[14][6]~21\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[14][6]~21_combout\ = (\reset~input_o\) # ((\rf_block|Decoder0~13_combout\ & \rf_block|registers[0][2]~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|Decoder0~13_combout\,
	datab => \reset~input_o\,
	datac => \rf_block|registers[0][2]~3_combout\,
	combout => \rf_block|registers[14][6]~21_combout\);

-- Location: FF_X16_Y20_N15
\rf_block|registers[14][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[14][0]~feeder_combout\,
	asdata => \immediate[0]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[14][6]~21_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[14][0]~q\);

-- Location: LCCOMB_X19_Y20_N24
\rf_block|registers[12][0]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[12][0]~feeder_combout\ = \rf_block|registers~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rf_block|registers~0_combout\,
	combout => \rf_block|registers[12][0]~feeder_combout\);

-- Location: LCCOMB_X18_Y22_N8
\rf_block|Decoder0~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|Decoder0~14_combout\ = (\rd_address[2]~input_o\ & (!\rd_address[0]~input_o\ & (\rd_address[3]~input_o\ & !\rd_address[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rd_address[2]~input_o\,
	datab => \rd_address[0]~input_o\,
	datac => \rd_address[3]~input_o\,
	datad => \rd_address[1]~input_o\,
	combout => \rf_block|Decoder0~14_combout\);

-- Location: LCCOMB_X18_Y22_N30
\rf_block|registers[12][6]~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[12][6]~22_combout\ = (\reset~input_o\) # ((\rf_block|Decoder0~14_combout\ & \rf_block|registers[0][2]~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \rf_block|Decoder0~14_combout\,
	datac => \rf_block|registers[0][2]~3_combout\,
	datad => \reset~input_o\,
	combout => \rf_block|registers[12][6]~22_combout\);

-- Location: FF_X19_Y20_N25
\rf_block|registers[12][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[12][0]~feeder_combout\,
	asdata => \immediate[0]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[12][6]~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[12][0]~q\);

-- Location: LCCOMB_X14_Y19_N14
\rf_block|rt_data~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rt_data~7_combout\ = (\rt_address[0]~input_o\ & (((\rt_address[1]~input_o\)))) # (!\rt_address[0]~input_o\ & ((\rt_address[1]~input_o\ & (\rf_block|registers[14][0]~q\)) # (!\rt_address[1]~input_o\ & ((\rf_block|registers[12][0]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rt_address[0]~input_o\,
	datab => \rf_block|registers[14][0]~q\,
	datac => \rt_address[1]~input_o\,
	datad => \rf_block|registers[12][0]~q\,
	combout => \rf_block|rt_data~7_combout\);

-- Location: LCCOMB_X20_Y21_N8
\rf_block|registers[15][0]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[15][0]~feeder_combout\ = \rf_block|registers~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \rf_block|registers~0_combout\,
	combout => \rf_block|registers[15][0]~feeder_combout\);

-- Location: LCCOMB_X19_Y21_N16
\rf_block|Decoder0~15\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|Decoder0~15_combout\ = (\rd_address[3]~input_o\ & (\rd_address[2]~input_o\ & (\rd_address[1]~input_o\ & \rd_address[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rd_address[3]~input_o\,
	datab => \rd_address[2]~input_o\,
	datac => \rd_address[1]~input_o\,
	datad => \rd_address[0]~input_o\,
	combout => \rf_block|Decoder0~15_combout\);

-- Location: LCCOMB_X19_Y21_N30
\rf_block|registers[15][6]~23\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[15][6]~23_combout\ = (\reset~input_o\) # ((\rf_block|Decoder0~15_combout\ & \rf_block|registers[0][2]~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \rf_block|Decoder0~15_combout\,
	datac => \rf_block|registers[0][2]~3_combout\,
	datad => \reset~input_o\,
	combout => \rf_block|registers[15][6]~23_combout\);

-- Location: FF_X20_Y21_N9
\rf_block|registers[15][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[15][0]~feeder_combout\,
	asdata => \immediate[0]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[15][6]~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[15][0]~q\);

-- Location: LCCOMB_X20_Y19_N18
\rf_block|rt_data~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rt_data~8_combout\ = (\rt_address[0]~input_o\ & ((\rf_block|rt_data~7_combout\ & ((\rf_block|registers[15][0]~q\))) # (!\rf_block|rt_data~7_combout\ & (\rf_block|registers[13][0]~q\)))) # (!\rt_address[0]~input_o\ & 
-- (((\rf_block|rt_data~7_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100000111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers[13][0]~q\,
	datab => \rt_address[0]~input_o\,
	datac => \rf_block|rt_data~7_combout\,
	datad => \rf_block|registers[15][0]~q\,
	combout => \rf_block|rt_data~8_combout\);

-- Location: LCCOMB_X20_Y19_N28
\rf_block|rt_data~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rt_data~9_combout\ = (\rf_block|rt_data~6_combout\ & (((\rf_block|rt_data~8_combout\)) # (!\rt_address[3]~input_o\))) # (!\rf_block|rt_data~6_combout\ & (\rt_address[3]~input_o\ & (\rf_block|rt_data~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rt_data~6_combout\,
	datab => \rt_address[3]~input_o\,
	datac => \rf_block|rt_data~1_combout\,
	datad => \rf_block|rt_data~8_combout\,
	combout => \rf_block|rt_data~9_combout\);

-- Location: LCCOMB_X20_Y19_N8
\rf_block|rt_data[0]~SCLR_LUT\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rt_data[0]~SCLR_LUT_combout\ = (!\reset~input_o\ & \rf_block|rt_data~9_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datad => \rf_block|rt_data~9_combout\,
	combout => \rf_block|rt_data[0]~SCLR_LUT_combout\);

-- Location: LCCOMB_X24_Y21_N26
\rf_block|rs_data[7]~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rs_data[7]~11_combout\ = (\reset~input_o\) # ((\reg_write_enable~input_o\ & (\enable~input_o\ & \rf_block|rs_data[7]~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reg_write_enable~input_o\,
	datab => \enable~input_o\,
	datac => \reset~input_o\,
	datad => \rf_block|rs_data[7]~10_combout\,
	combout => \rf_block|rs_data[7]~11_combout\);

-- Location: FF_X20_Y19_N9
\rf_block|rt_data[0]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|rt_data[0]~SCLR_LUT_combout\,
	ena => \rf_block|rs_data[7]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|rt_data[0]~_Duplicate_1_q\);

-- Location: LCCOMB_X25_Y19_N0
\alu_block|Add0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Add0~0_combout\ = \rf_block|rs_data[0]~_Duplicate_1_q\ $ (((\alu_select[1]~input_o\) # (\alu_select[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rs_data[0]~_Duplicate_1_q\,
	datac => \alu_select[1]~input_o\,
	datad => \alu_select[0]~input_o\,
	combout => \alu_block|Add0~0_combout\);

-- Location: LCCOMB_X25_Y19_N6
\alu_block|Add0~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Add0~2_cout\ = CARRY((\alu_select[1]~input_o\) # (\alu_select[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \alu_select[1]~input_o\,
	datab => \alu_select[0]~input_o\,
	datad => VCC,
	cout => \alu_block|Add0~2_cout\);

-- Location: LCCOMB_X25_Y19_N8
\alu_block|Add0~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Add0~3_combout\ = (\rf_block|rt_data[0]~_Duplicate_1_q\ & ((\alu_block|Add0~0_combout\ & (\alu_block|Add0~2_cout\ & VCC)) # (!\alu_block|Add0~0_combout\ & (!\alu_block|Add0~2_cout\)))) # (!\rf_block|rt_data[0]~_Duplicate_1_q\ & 
-- ((\alu_block|Add0~0_combout\ & (!\alu_block|Add0~2_cout\)) # (!\alu_block|Add0~0_combout\ & ((\alu_block|Add0~2_cout\) # (GND)))))
-- \alu_block|Add0~4\ = CARRY((\rf_block|rt_data[0]~_Duplicate_1_q\ & (!\alu_block|Add0~0_combout\ & !\alu_block|Add0~2_cout\)) # (!\rf_block|rt_data[0]~_Duplicate_1_q\ & ((!\alu_block|Add0~2_cout\) # (!\alu_block|Add0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rt_data[0]~_Duplicate_1_q\,
	datab => \alu_block|Add0~0_combout\,
	datad => VCC,
	cin => \alu_block|Add0~2_cout\,
	combout => \alu_block|Add0~3_combout\,
	cout => \alu_block|Add0~4\);

-- Location: IOIBUF_X10_Y17_N8
\rs_address[1]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rs_address(1),
	o => \rs_address[1]~input_o\);

-- Location: LCCOMB_X18_Y20_N14
\rf_block|registers[9][1]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[9][1]~feeder_combout\ = \rf_block|registers~24_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rf_block|registers~24_combout\,
	combout => \rf_block|registers[9][1]~feeder_combout\);

-- Location: IOIBUF_X10_Y19_N1
\immediate[1]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_immediate(1),
	o => \immediate[1]~input_o\);

-- Location: FF_X18_Y20_N15
\rf_block|registers[9][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[9][1]~feeder_combout\,
	asdata => \immediate[1]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[9][5]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[9][1]~q\);

-- Location: LCCOMB_X20_Y20_N4
\rf_block|Decoder0~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|Decoder0~12_combout\ = (\rd_address[0]~input_o\ & (\rd_address[3]~input_o\ & (\rd_address[2]~input_o\ & !\rd_address[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rd_address[0]~input_o\,
	datab => \rd_address[3]~input_o\,
	datac => \rd_address[2]~input_o\,
	datad => \rd_address[1]~input_o\,
	combout => \rf_block|Decoder0~12_combout\);

-- Location: LCCOMB_X20_Y20_N12
\rf_block|registers[13][4]~17\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[13][4]~17_combout\ = (\reg_input_mux[0]~input_o\) # (((!\rf_block|registers~1_combout\) # (!\lsu_block|Equal5~0_combout\)) # (!\rf_block|Decoder0~12_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reg_input_mux[0]~input_o\,
	datab => \rf_block|Decoder0~12_combout\,
	datac => \lsu_block|Equal5~0_combout\,
	datad => \rf_block|registers~1_combout\,
	combout => \rf_block|registers[13][4]~17_combout\);

-- Location: LCCOMB_X20_Y20_N18
\rf_block|registers[13][4]~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[13][4]~16_combout\ = (((\reg_input_mux[1]~input_o\) # (!\rf_block|registers~1_combout\)) # (!\rf_block|Decoder0~12_combout\)) # (!\lsu_block|Equal5~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \lsu_block|Equal5~0_combout\,
	datab => \rf_block|Decoder0~12_combout\,
	datac => \reg_input_mux[1]~input_o\,
	datad => \rf_block|registers~1_combout\,
	combout => \rf_block|registers[13][4]~16_combout\);

-- Location: LCCOMB_X19_Y21_N12
\rf_block|registers~25\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers~25_combout\ = (\rf_block|registers[13][4]~17_combout\ & (((\rf_block|registers[13][4]~16_combout\)))) # (!\rf_block|registers[13][4]~17_combout\ & ((\rf_block|registers[13][4]~16_combout\ & (\immediate[1]~input_o\)) # 
-- (!\rf_block|registers[13][4]~16_combout\ & ((\alu_block|alu_out\(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \immediate[1]~input_o\,
	datab => \alu_block|alu_out\(1),
	datac => \rf_block|registers[13][4]~17_combout\,
	datad => \rf_block|registers[13][4]~16_combout\,
	combout => \rf_block|registers~25_combout\);

-- Location: IOIBUF_X19_Y25_N1
\mem_read_data[1]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_mem_read_data(1),
	o => \mem_read_data[1]~input_o\);

-- Location: LCCOMB_X20_Y21_N28
\lsu_block|lsu_out~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \lsu_block|lsu_out~3_combout\ = (!\reset~input_o\ & \mem_read_data[1]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \reset~input_o\,
	datad => \mem_read_data[1]~input_o\,
	combout => \lsu_block|lsu_out~3_combout\);

-- Location: FF_X20_Y21_N29
\lsu_block|lsu_out[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \lsu_block|lsu_out~3_combout\,
	ena => \lsu_block|lsu_out[2]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \lsu_block|lsu_out\(1));

-- Location: IOIBUF_X17_Y25_N1
\block_id[1]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_block_id(1),
	o => \block_id[1]~input_o\);

-- Location: LCCOMB_X19_Y21_N14
\rf_block|registers~26\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers~26_combout\ = (\rf_block|registers~25_combout\ & (((\block_id[1]~input_o\) # (!\rf_block|registers[13][4]~17_combout\)))) # (!\rf_block|registers~25_combout\ & (\lsu_block|lsu_out\(1) & (\rf_block|registers[13][4]~17_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers~25_combout\,
	datab => \lsu_block|lsu_out\(1),
	datac => \rf_block|registers[13][4]~17_combout\,
	datad => \block_id[1]~input_o\,
	combout => \rf_block|registers~26_combout\);

-- Location: LCCOMB_X20_Y19_N12
\rf_block|registers[13][4]~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[13][4]~20_combout\ = (\reset~input_o\) # ((\reg_write_enable~input_o\ & \enable~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datac => \reg_write_enable~input_o\,
	datad => \enable~input_o\,
	combout => \rf_block|registers[13][4]~20_combout\);

-- Location: FF_X19_Y21_N15
\rf_block|registers[13][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers~26_combout\,
	sclr => \reset~input_o\,
	ena => \rf_block|registers[13][4]~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[13][1]~q\);

-- Location: IOIBUF_X10_Y15_N8
\rs_address[2]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rs_address(2),
	o => \rs_address[2]~input_o\);

-- Location: IOIBUF_X10_Y16_N1
\rs_address[3]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rs_address(3),
	o => \rs_address[3]~input_o\);

-- Location: LCCOMB_X18_Y18_N20
\rf_block|registers[1][1]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[1][1]~feeder_combout\ = \rf_block|registers~24_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rf_block|registers~24_combout\,
	combout => \rf_block|registers[1][1]~feeder_combout\);

-- Location: FF_X18_Y18_N21
\rf_block|registers[1][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[1][1]~feeder_combout\,
	asdata => \immediate[1]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[1][5]~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[1][1]~q\);

-- Location: LCCOMB_X17_Y21_N0
\rf_block|rs_data~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rs_data~14_combout\ = (\rs_address[2]~input_o\ & ((\rf_block|registers[5][1]~q\) # ((\rs_address[3]~input_o\)))) # (!\rs_address[2]~input_o\ & (((!\rs_address[3]~input_o\ & \rf_block|registers[1][1]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs_address[2]~input_o\,
	datab => \rf_block|registers[5][1]~q\,
	datac => \rs_address[3]~input_o\,
	datad => \rf_block|registers[1][1]~q\,
	combout => \rf_block|rs_data~14_combout\);

-- Location: LCCOMB_X18_Y21_N16
\rf_block|rs_data~15\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rs_data~15_combout\ = (\rf_block|rs_data~14_combout\ & (((\rf_block|registers[13][1]~q\) # (!\rs_address[3]~input_o\)))) # (!\rf_block|rs_data~14_combout\ & (\rf_block|registers[9][1]~q\ & ((\rs_address[3]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers[9][1]~q\,
	datab => \rf_block|registers[13][1]~q\,
	datac => \rf_block|rs_data~14_combout\,
	datad => \rs_address[3]~input_o\,
	combout => \rf_block|rs_data~15_combout\);

-- Location: LCCOMB_X16_Y21_N26
\rf_block|registers[8][1]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[8][1]~feeder_combout\ = \rf_block|registers~24_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rf_block|registers~24_combout\,
	combout => \rf_block|registers[8][1]~feeder_combout\);

-- Location: FF_X16_Y21_N27
\rf_block|registers[8][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[8][1]~feeder_combout\,
	asdata => \immediate[1]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[8][5]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[8][1]~q\);

-- Location: LCCOMB_X17_Y18_N12
\rf_block|registers[0][1]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[0][1]~feeder_combout\ = \rf_block|registers~24_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rf_block|registers~24_combout\,
	combout => \rf_block|registers[0][1]~feeder_combout\);

-- Location: FF_X17_Y18_N13
\rf_block|registers[0][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[0][1]~feeder_combout\,
	asdata => \immediate[1]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[0][2]~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[0][1]~q\);

-- Location: LCCOMB_X17_Y21_N10
\rf_block|rs_data~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rs_data~16_combout\ = (\rs_address[2]~input_o\ & (\rs_address[3]~input_o\)) # (!\rs_address[2]~input_o\ & ((\rs_address[3]~input_o\ & (\rf_block|registers[8][1]~q\)) # (!\rs_address[3]~input_o\ & ((\rf_block|registers[0][1]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs_address[2]~input_o\,
	datab => \rs_address[3]~input_o\,
	datac => \rf_block|registers[8][1]~q\,
	datad => \rf_block|registers[0][1]~q\,
	combout => \rf_block|rs_data~16_combout\);

-- Location: LCCOMB_X17_Y21_N28
\rf_block|registers[4][1]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[4][1]~feeder_combout\ = \rf_block|registers~24_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rf_block|registers~24_combout\,
	combout => \rf_block|registers[4][1]~feeder_combout\);

-- Location: FF_X17_Y21_N29
\rf_block|registers[4][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[4][1]~feeder_combout\,
	asdata => \immediate[1]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[4][4]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[4][1]~q\);

-- Location: LCCOMB_X17_Y21_N2
\rf_block|registers[12][1]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[12][1]~feeder_combout\ = \rf_block|registers~24_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rf_block|registers~24_combout\,
	combout => \rf_block|registers[12][1]~feeder_combout\);

-- Location: FF_X17_Y21_N3
\rf_block|registers[12][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[12][1]~feeder_combout\,
	asdata => \immediate[1]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[12][6]~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[12][1]~q\);

-- Location: LCCOMB_X17_Y21_N20
\rf_block|rs_data~17\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rs_data~17_combout\ = (\rf_block|rs_data~16_combout\ & (((\rf_block|registers[12][1]~q\) # (!\rs_address[2]~input_o\)))) # (!\rf_block|rs_data~16_combout\ & (\rf_block|registers[4][1]~q\ & (\rs_address[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rs_data~16_combout\,
	datab => \rf_block|registers[4][1]~q\,
	datac => \rs_address[2]~input_o\,
	datad => \rf_block|registers[12][1]~q\,
	combout => \rf_block|rs_data~17_combout\);

-- Location: LCCOMB_X18_Y21_N2
\rf_block|rs_data~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rs_data~18_combout\ = (\rs_address[1]~input_o\ & (((\rs_address[0]~input_o\)))) # (!\rs_address[1]~input_o\ & ((\rs_address[0]~input_o\ & (\rf_block|rs_data~15_combout\)) # (!\rs_address[0]~input_o\ & ((\rf_block|rs_data~17_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs_address[1]~input_o\,
	datab => \rf_block|rs_data~15_combout\,
	datac => \rs_address[0]~input_o\,
	datad => \rf_block|rs_data~17_combout\,
	combout => \rf_block|rs_data~18_combout\);

-- Location: LCCOMB_X16_Y20_N22
\rf_block|registers[14][1]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[14][1]~feeder_combout\ = \rf_block|registers~24_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rf_block|registers~24_combout\,
	combout => \rf_block|registers[14][1]~feeder_combout\);

-- Location: FF_X16_Y20_N23
\rf_block|registers[14][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[14][1]~feeder_combout\,
	asdata => \immediate[1]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[14][6]~21_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[14][1]~q\);

-- Location: LCCOMB_X15_Y20_N2
\rf_block|registers[2][1]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[2][1]~feeder_combout\ = \rf_block|registers~24_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rf_block|registers~24_combout\,
	combout => \rf_block|registers[2][1]~feeder_combout\);

-- Location: FF_X15_Y20_N3
\rf_block|registers[2][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[2][1]~feeder_combout\,
	asdata => \immediate[1]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[2][4]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[2][1]~q\);

-- Location: LCCOMB_X16_Y20_N0
\rf_block|registers[10][1]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[10][1]~feeder_combout\ = \rf_block|registers~24_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rf_block|registers~24_combout\,
	combout => \rf_block|registers[10][1]~feeder_combout\);

-- Location: FF_X16_Y20_N1
\rf_block|registers[10][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[10][1]~feeder_combout\,
	asdata => \immediate[1]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[10][5]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[10][1]~q\);

-- Location: LCCOMB_X18_Y21_N8
\rf_block|rs_data~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rs_data~12_combout\ = (\rs_address[3]~input_o\ & ((\rs_address[2]~input_o\) # ((\rf_block|registers[10][1]~q\)))) # (!\rs_address[3]~input_o\ & (!\rs_address[2]~input_o\ & (\rf_block|registers[2][1]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs_address[3]~input_o\,
	datab => \rs_address[2]~input_o\,
	datac => \rf_block|registers[2][1]~q\,
	datad => \rf_block|registers[10][1]~q\,
	combout => \rf_block|rs_data~12_combout\);

-- Location: LCCOMB_X15_Y20_N0
\rf_block|registers[6][1]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[6][1]~feeder_combout\ = \rf_block|registers~24_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rf_block|registers~24_combout\,
	combout => \rf_block|registers[6][1]~feeder_combout\);

-- Location: FF_X15_Y20_N1
\rf_block|registers[6][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[6][1]~feeder_combout\,
	asdata => \immediate[1]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[6][3]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[6][1]~q\);

-- Location: LCCOMB_X18_Y21_N26
\rf_block|rs_data~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rs_data~13_combout\ = (\rs_address[2]~input_o\ & ((\rf_block|rs_data~12_combout\ & (\rf_block|registers[14][1]~q\)) # (!\rf_block|rs_data~12_combout\ & ((\rf_block|registers[6][1]~q\))))) # (!\rs_address[2]~input_o\ & 
-- (((\rf_block|rs_data~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011110010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers[14][1]~q\,
	datab => \rs_address[2]~input_o\,
	datac => \rf_block|rs_data~12_combout\,
	datad => \rf_block|registers[6][1]~q\,
	combout => \rf_block|rs_data~13_combout\);

-- Location: LCCOMB_X18_Y18_N18
\rf_block|registers[11][1]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[11][1]~feeder_combout\ = \rf_block|registers~24_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rf_block|registers~24_combout\,
	combout => \rf_block|registers[11][1]~feeder_combout\);

-- Location: FF_X18_Y18_N19
\rf_block|registers[11][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[11][1]~feeder_combout\,
	asdata => \immediate[1]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[11][2]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[11][1]~q\);

-- Location: LCCOMB_X16_Y21_N12
\rf_block|registers[3][1]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[3][1]~feeder_combout\ = \rf_block|registers~24_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rf_block|registers~24_combout\,
	combout => \rf_block|registers[3][1]~feeder_combout\);

-- Location: FF_X16_Y21_N13
\rf_block|registers[3][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[3][1]~feeder_combout\,
	asdata => \immediate[1]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[3][4]~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[3][1]~q\);

-- Location: FF_X18_Y21_N21
\rf_block|registers[7][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers~24_combout\,
	asdata => \immediate[1]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[7][1]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[7][1]~q\);

-- Location: LCCOMB_X18_Y21_N24
\rf_block|rs_data~19\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rs_data~19_combout\ = (\rs_address[3]~input_o\ & (\rs_address[2]~input_o\)) # (!\rs_address[3]~input_o\ & ((\rs_address[2]~input_o\ & ((\rf_block|registers[7][1]~q\))) # (!\rs_address[2]~input_o\ & (\rf_block|registers[3][1]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs_address[3]~input_o\,
	datab => \rs_address[2]~input_o\,
	datac => \rf_block|registers[3][1]~q\,
	datad => \rf_block|registers[7][1]~q\,
	combout => \rf_block|rs_data~19_combout\);

-- Location: LCCOMB_X18_Y21_N22
\rf_block|registers[15][1]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[15][1]~feeder_combout\ = \rf_block|registers~24_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers~24_combout\,
	combout => \rf_block|registers[15][1]~feeder_combout\);

-- Location: FF_X18_Y21_N23
\rf_block|registers[15][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[15][1]~feeder_combout\,
	asdata => \immediate[1]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[15][6]~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[15][1]~q\);

-- Location: LCCOMB_X18_Y21_N18
\rf_block|rs_data~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rs_data~20_combout\ = (\rf_block|rs_data~19_combout\ & (((\rf_block|registers[15][1]~q\) # (!\rs_address[3]~input_o\)))) # (!\rf_block|rs_data~19_combout\ & (\rf_block|registers[11][1]~q\ & ((\rs_address[3]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers[11][1]~q\,
	datab => \rf_block|rs_data~19_combout\,
	datac => \rf_block|registers[15][1]~q\,
	datad => \rs_address[3]~input_o\,
	combout => \rf_block|rs_data~20_combout\);

-- Location: LCCOMB_X18_Y21_N0
\rf_block|rs_data~21\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rs_data~21_combout\ = (\rs_address[1]~input_o\ & ((\rf_block|rs_data~18_combout\ & ((\rf_block|rs_data~20_combout\))) # (!\rf_block|rs_data~18_combout\ & (\rf_block|rs_data~13_combout\)))) # (!\rs_address[1]~input_o\ & 
-- (\rf_block|rs_data~18_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110001100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs_address[1]~input_o\,
	datab => \rf_block|rs_data~18_combout\,
	datac => \rf_block|rs_data~13_combout\,
	datad => \rf_block|rs_data~20_combout\,
	combout => \rf_block|rs_data~21_combout\);

-- Location: LCCOMB_X22_Y21_N28
\rf_block|rs_data[1]~SCLR_LUT\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rs_data[1]~SCLR_LUT_combout\ = (!\reset~input_o\ & \rf_block|rs_data~21_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \reset~input_o\,
	datad => \rf_block|rs_data~21_combout\,
	combout => \rf_block|rs_data[1]~SCLR_LUT_combout\);

-- Location: FF_X22_Y19_N31
\rf_block|rs_data[1]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	asdata => \rf_block|rs_data[1]~SCLR_LUT_combout\,
	sload => VCC,
	ena => \rf_block|rs_data[7]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|rs_data[1]~_Duplicate_1_q\);

-- Location: LCCOMB_X27_Y19_N26
\alu_block|Add0~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Add0~9_combout\ = \rf_block|rs_data[1]~_Duplicate_1_q\ $ (((\alu_select[1]~input_o\) # (\alu_select[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111101011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \alu_select[1]~input_o\,
	datac => \rf_block|rs_data[1]~_Duplicate_1_q\,
	datad => \alu_select[0]~input_o\,
	combout => \alu_block|Add0~9_combout\);

-- Location: FF_X20_Y20_N9
\rf_block|rt_data[1]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|rt_data[1]~SCLR_LUT_combout\,
	ena => \rf_block|rs_data[7]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|rt_data[1]~_Duplicate_1_q\);

-- Location: LCCOMB_X25_Y19_N10
\alu_block|Add0~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Add0~10_combout\ = ((\alu_block|Add0~9_combout\ $ (\rf_block|rt_data[1]~_Duplicate_1_q\ $ (!\alu_block|Add0~4\)))) # (GND)
-- \alu_block|Add0~11\ = CARRY((\alu_block|Add0~9_combout\ & ((\rf_block|rt_data[1]~_Duplicate_1_q\) # (!\alu_block|Add0~4\))) # (!\alu_block|Add0~9_combout\ & (\rf_block|rt_data[1]~_Duplicate_1_q\ & !\alu_block|Add0~4\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \alu_block|Add0~9_combout\,
	datab => \rf_block|rt_data[1]~_Duplicate_1_q\,
	datad => VCC,
	cin => \alu_block|Add0~4\,
	combout => \alu_block|Add0~10_combout\,
	cout => \alu_block|Add0~11\);

-- Location: LCCOMB_X18_Y18_N26
\rf_block|registers[1][3]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[1][3]~feeder_combout\ = \rf_block|registers~31_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers~31_combout\,
	combout => \rf_block|registers[1][3]~feeder_combout\);

-- Location: IOIBUF_X10_Y20_N22
\immediate[3]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_immediate(3),
	o => \immediate[3]~input_o\);

-- Location: FF_X18_Y18_N27
\rf_block|registers[1][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[1][3]~feeder_combout\,
	asdata => \immediate[3]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[1][5]~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[1][3]~q\);

-- Location: LCCOMB_X18_Y20_N10
\rf_block|registers[9][3]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[9][3]~feeder_combout\ = \rf_block|registers~31_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers~31_combout\,
	combout => \rf_block|registers[9][3]~feeder_combout\);

-- Location: FF_X18_Y20_N11
\rf_block|registers[9][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[9][3]~feeder_combout\,
	asdata => \immediate[3]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[9][5]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[9][3]~q\);

-- Location: LCCOMB_X14_Y19_N18
\rf_block|rt_data~30\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rt_data~30_combout\ = (\rt_address[3]~input_o\ & (((\rf_block|registers[9][3]~q\) # (\rt_address[2]~input_o\)))) # (!\rt_address[3]~input_o\ & (\rf_block|registers[1][3]~q\ & ((!\rt_address[2]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rt_address[3]~input_o\,
	datab => \rf_block|registers[1][3]~q\,
	datac => \rf_block|registers[9][3]~q\,
	datad => \rt_address[2]~input_o\,
	combout => \rf_block|rt_data~30_combout\);

-- Location: LCCOMB_X17_Y19_N26
\rf_block|registers[5][3]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[5][3]~feeder_combout\ = \rf_block|registers~31_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rf_block|registers~31_combout\,
	combout => \rf_block|registers[5][3]~feeder_combout\);

-- Location: FF_X17_Y19_N27
\rf_block|registers[5][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[5][3]~feeder_combout\,
	asdata => \immediate[3]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[5][7]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[5][3]~q\);

-- Location: LCCOMB_X20_Y21_N0
\rf_block|registers~32\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers~32_combout\ = (\rf_block|registers[13][4]~16_combout\ & (((\immediate[3]~input_o\) # (\rf_block|registers[13][4]~17_combout\)))) # (!\rf_block|registers[13][4]~16_combout\ & (\alu_block|alu_out\(3) & 
-- ((!\rf_block|registers[13][4]~17_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \alu_block|alu_out\(3),
	datab => \rf_block|registers[13][4]~16_combout\,
	datac => \immediate[3]~input_o\,
	datad => \rf_block|registers[13][4]~17_combout\,
	combout => \rf_block|registers~32_combout\);

-- Location: IOIBUF_X15_Y25_N29
\block_id[3]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_block_id(3),
	o => \block_id[3]~input_o\);

-- Location: IOIBUF_X17_Y25_N8
\mem_read_data[3]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_mem_read_data(3),
	o => \mem_read_data[3]~input_o\);

-- Location: LCCOMB_X20_Y21_N18
\lsu_block|lsu_out~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \lsu_block|lsu_out~5_combout\ = (\mem_read_data[3]~input_o\ & !\reset~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \mem_read_data[3]~input_o\,
	datad => \reset~input_o\,
	combout => \lsu_block|lsu_out~5_combout\);

-- Location: FF_X20_Y21_N19
\lsu_block|lsu_out[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \lsu_block|lsu_out~5_combout\,
	ena => \lsu_block|lsu_out[2]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \lsu_block|lsu_out\(3));

-- Location: LCCOMB_X19_Y21_N26
\rf_block|registers~33\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers~33_combout\ = (\rf_block|registers~32_combout\ & ((\block_id[3]~input_o\) # ((!\rf_block|registers[13][4]~17_combout\)))) # (!\rf_block|registers~32_combout\ & (((\rf_block|registers[13][4]~17_combout\ & \lsu_block|lsu_out\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101010001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers~32_combout\,
	datab => \block_id[3]~input_o\,
	datac => \rf_block|registers[13][4]~17_combout\,
	datad => \lsu_block|lsu_out\(3),
	combout => \rf_block|registers~33_combout\);

-- Location: FF_X19_Y21_N27
\rf_block|registers[13][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers~33_combout\,
	sclr => \reset~input_o\,
	ena => \rf_block|registers[13][4]~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[13][3]~q\);

-- Location: LCCOMB_X16_Y19_N16
\rf_block|rt_data~31\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rt_data~31_combout\ = (\rf_block|rt_data~30_combout\ & (((\rf_block|registers[13][3]~q\) # (!\rt_address[2]~input_o\)))) # (!\rf_block|rt_data~30_combout\ & (\rf_block|registers[5][3]~q\ & (\rt_address[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rt_data~30_combout\,
	datab => \rf_block|registers[5][3]~q\,
	datac => \rt_address[2]~input_o\,
	datad => \rf_block|registers[13][3]~q\,
	combout => \rf_block|rt_data~31_combout\);

-- Location: LCCOMB_X17_Y18_N8
\rf_block|registers[0][3]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[0][3]~feeder_combout\ = \rf_block|registers~31_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rf_block|registers~31_combout\,
	combout => \rf_block|registers[0][3]~feeder_combout\);

-- Location: FF_X17_Y18_N9
\rf_block|registers[0][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[0][3]~feeder_combout\,
	asdata => \immediate[3]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[0][2]~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[0][3]~q\);

-- Location: LCCOMB_X17_Y18_N6
\rf_block|registers[4][3]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[4][3]~feeder_combout\ = \rf_block|registers~31_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rf_block|registers~31_combout\,
	combout => \rf_block|registers[4][3]~feeder_combout\);

-- Location: FF_X17_Y18_N7
\rf_block|registers[4][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[4][3]~feeder_combout\,
	asdata => \immediate[3]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[4][4]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[4][3]~q\);

-- Location: LCCOMB_X16_Y19_N22
\rf_block|rt_data~34\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rt_data~34_combout\ = (\rt_address[2]~input_o\ & ((\rt_address[3]~input_o\) # ((\rf_block|registers[4][3]~q\)))) # (!\rt_address[2]~input_o\ & (!\rt_address[3]~input_o\ & (\rf_block|registers[0][3]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rt_address[2]~input_o\,
	datab => \rt_address[3]~input_o\,
	datac => \rf_block|registers[0][3]~q\,
	datad => \rf_block|registers[4][3]~q\,
	combout => \rf_block|rt_data~34_combout\);

-- Location: LCCOMB_X16_Y19_N18
\rf_block|registers[12][3]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[12][3]~feeder_combout\ = \rf_block|registers~31_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rf_block|registers~31_combout\,
	combout => \rf_block|registers[12][3]~feeder_combout\);

-- Location: FF_X16_Y19_N19
\rf_block|registers[12][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[12][3]~feeder_combout\,
	asdata => \immediate[3]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[12][6]~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[12][3]~q\);

-- Location: LCCOMB_X16_Y19_N8
\rf_block|rt_data~35\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rt_data~35_combout\ = (\rf_block|rt_data~34_combout\ & ((\rf_block|registers[12][3]~q\) # ((!\rt_address[3]~input_o\)))) # (!\rf_block|rt_data~34_combout\ & (((\rt_address[3]~input_o\ & \rf_block|registers[8][3]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101010001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rt_data~34_combout\,
	datab => \rf_block|registers[12][3]~q\,
	datac => \rt_address[3]~input_o\,
	datad => \rf_block|registers[8][3]~q\,
	combout => \rf_block|rt_data~35_combout\);

-- Location: LCCOMB_X15_Y20_N22
\rf_block|registers[2][3]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[2][3]~feeder_combout\ = \rf_block|registers~31_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers~31_combout\,
	combout => \rf_block|registers[2][3]~feeder_combout\);

-- Location: FF_X15_Y20_N23
\rf_block|registers[2][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[2][3]~feeder_combout\,
	asdata => \immediate[3]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[2][4]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[2][3]~q\);

-- Location: LCCOMB_X15_Y20_N4
\rf_block|registers[6][3]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[6][3]~feeder_combout\ = \rf_block|registers~31_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers~31_combout\,
	combout => \rf_block|registers[6][3]~feeder_combout\);

-- Location: FF_X15_Y20_N5
\rf_block|registers[6][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[6][3]~feeder_combout\,
	asdata => \immediate[3]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[6][3]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[6][3]~q\);

-- Location: LCCOMB_X16_Y19_N30
\rf_block|rt_data~32\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rt_data~32_combout\ = (\rt_address[2]~input_o\ & ((\rt_address[3]~input_o\) # ((\rf_block|registers[6][3]~q\)))) # (!\rt_address[2]~input_o\ & (!\rt_address[3]~input_o\ & (\rf_block|registers[2][3]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rt_address[2]~input_o\,
	datab => \rt_address[3]~input_o\,
	datac => \rf_block|registers[2][3]~q\,
	datad => \rf_block|registers[6][3]~q\,
	combout => \rf_block|rt_data~32_combout\);

-- Location: LCCOMB_X16_Y20_N30
\rf_block|registers[10][3]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[10][3]~feeder_combout\ = \rf_block|registers~31_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rf_block|registers~31_combout\,
	combout => \rf_block|registers[10][3]~feeder_combout\);

-- Location: FF_X16_Y20_N31
\rf_block|registers[10][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[10][3]~feeder_combout\,
	asdata => \immediate[3]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[10][5]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[10][3]~q\);

-- Location: LCCOMB_X16_Y20_N28
\rf_block|registers[14][3]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[14][3]~feeder_combout\ = \rf_block|registers~31_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rf_block|registers~31_combout\,
	combout => \rf_block|registers[14][3]~feeder_combout\);

-- Location: FF_X16_Y20_N29
\rf_block|registers[14][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[14][3]~feeder_combout\,
	asdata => \immediate[3]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[14][6]~21_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[14][3]~q\);

-- Location: LCCOMB_X16_Y19_N24
\rf_block|rt_data~33\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rt_data~33_combout\ = (\rf_block|rt_data~32_combout\ & (((\rf_block|registers[14][3]~q\)) # (!\rt_address[3]~input_o\))) # (!\rf_block|rt_data~32_combout\ & (\rt_address[3]~input_o\ & (\rf_block|registers[10][3]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rt_data~32_combout\,
	datab => \rt_address[3]~input_o\,
	datac => \rf_block|registers[10][3]~q\,
	datad => \rf_block|registers[14][3]~q\,
	combout => \rf_block|rt_data~33_combout\);

-- Location: LCCOMB_X16_Y19_N26
\rf_block|rt_data~36\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rt_data~36_combout\ = (\rt_address[1]~input_o\ & ((\rt_address[0]~input_o\) # ((\rf_block|rt_data~33_combout\)))) # (!\rt_address[1]~input_o\ & (!\rt_address[0]~input_o\ & (\rf_block|rt_data~35_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rt_address[1]~input_o\,
	datab => \rt_address[0]~input_o\,
	datac => \rf_block|rt_data~35_combout\,
	datad => \rf_block|rt_data~33_combout\,
	combout => \rf_block|rt_data~36_combout\);

-- Location: LCCOMB_X16_Y21_N24
\rf_block|registers[3][3]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[3][3]~feeder_combout\ = \rf_block|registers~31_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rf_block|registers~31_combout\,
	combout => \rf_block|registers[3][3]~feeder_combout\);

-- Location: FF_X16_Y21_N25
\rf_block|registers[3][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[3][3]~feeder_combout\,
	asdata => \immediate[3]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[3][4]~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[3][3]~q\);

-- Location: LCCOMB_X18_Y18_N24
\rf_block|registers[11][3]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[11][3]~feeder_combout\ = \rf_block|registers~31_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers~31_combout\,
	combout => \rf_block|registers[11][3]~feeder_combout\);

-- Location: FF_X18_Y18_N25
\rf_block|registers[11][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[11][3]~feeder_combout\,
	asdata => \immediate[3]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[11][2]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[11][3]~q\);

-- Location: LCCOMB_X17_Y21_N14
\rf_block|rt_data~37\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rt_data~37_combout\ = (\rt_address[3]~input_o\ & (((\rt_address[2]~input_o\) # (\rf_block|registers[11][3]~q\)))) # (!\rt_address[3]~input_o\ & (\rf_block|registers[3][3]~q\ & (!\rt_address[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rt_address[3]~input_o\,
	datab => \rf_block|registers[3][3]~q\,
	datac => \rt_address[2]~input_o\,
	datad => \rf_block|registers[11][3]~q\,
	combout => \rf_block|rt_data~37_combout\);

-- Location: LCCOMB_X17_Y19_N20
\rf_block|registers[7][3]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[7][3]~feeder_combout\ = \rf_block|registers~31_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rf_block|registers~31_combout\,
	combout => \rf_block|registers[7][3]~feeder_combout\);

-- Location: FF_X17_Y19_N21
\rf_block|registers[7][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[7][3]~feeder_combout\,
	asdata => \immediate[3]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[7][1]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[7][3]~q\);

-- Location: FF_X20_Y21_N15
\rf_block|registers[15][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers~31_combout\,
	asdata => \immediate[3]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[15][6]~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[15][3]~q\);

-- Location: LCCOMB_X20_Y19_N2
\rf_block|rt_data~38\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rt_data~38_combout\ = (\rf_block|rt_data~37_combout\ & (((\rf_block|registers[15][3]~q\) # (!\rt_address[2]~input_o\)))) # (!\rf_block|rt_data~37_combout\ & (\rf_block|registers[7][3]~q\ & (\rt_address[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rt_data~37_combout\,
	datab => \rf_block|registers[7][3]~q\,
	datac => \rt_address[2]~input_o\,
	datad => \rf_block|registers[15][3]~q\,
	combout => \rf_block|rt_data~38_combout\);

-- Location: LCCOMB_X20_Y19_N20
\rf_block|rt_data~39\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rt_data~39_combout\ = (\rt_address[0]~input_o\ & ((\rf_block|rt_data~36_combout\ & ((\rf_block|rt_data~38_combout\))) # (!\rf_block|rt_data~36_combout\ & (\rf_block|rt_data~31_combout\)))) # (!\rt_address[0]~input_o\ & 
-- (((\rf_block|rt_data~36_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100000111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rt_data~31_combout\,
	datab => \rt_address[0]~input_o\,
	datac => \rf_block|rt_data~36_combout\,
	datad => \rf_block|rt_data~38_combout\,
	combout => \rf_block|rt_data~39_combout\);

-- Location: LCCOMB_X20_Y19_N24
\rf_block|rt_data[3]~SCLR_LUT\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rt_data[3]~SCLR_LUT_combout\ = (!\reset~input_o\ & \rf_block|rt_data~39_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datad => \rf_block|rt_data~39_combout\,
	combout => \rf_block|rt_data[3]~SCLR_LUT_combout\);

-- Location: FF_X20_Y19_N25
\rf_block|rt_data[3]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|rt_data[3]~SCLR_LUT_combout\,
	ena => \rf_block|rs_data[7]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|rt_data[3]~_Duplicate_1_q\);

-- Location: LCCOMB_X24_Y19_N28
\alu_block|Add0~19\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Add0~19_combout\ = \rf_block|rs_data[3]~_Duplicate_1_q\ $ (((\alu_select[0]~input_o\) # (\alu_select[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101011001010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rs_data[3]~_Duplicate_1_q\,
	datab => \alu_select[0]~input_o\,
	datac => \alu_select[1]~input_o\,
	combout => \alu_block|Add0~19_combout\);

-- Location: IOIBUF_X31_Y14_N8
\mem_read_data[2]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_mem_read_data(2),
	o => \mem_read_data[2]~input_o\);

-- Location: LCCOMB_X22_Y21_N8
\lsu_block|lsu_out~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \lsu_block|lsu_out~4_combout\ = (!\reset~input_o\ & \mem_read_data[2]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \reset~input_o\,
	datad => \mem_read_data[2]~input_o\,
	combout => \lsu_block|lsu_out~4_combout\);

-- Location: FF_X22_Y21_N9
\lsu_block|lsu_out[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \lsu_block|lsu_out~4_combout\,
	ena => \lsu_block|lsu_out[2]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \lsu_block|lsu_out\(2));

-- Location: LCCOMB_X17_Y18_N22
\rf_block|registers[4][2]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[4][2]~feeder_combout\ = \rf_block|registers~27_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rf_block|registers~27_combout\,
	combout => \rf_block|registers[4][2]~feeder_combout\);

-- Location: IOIBUF_X10_Y18_N8
\immediate[2]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_immediate(2),
	o => \immediate[2]~input_o\);

-- Location: FF_X17_Y18_N23
\rf_block|registers[4][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[4][2]~feeder_combout\,
	asdata => \immediate[2]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[4][4]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[4][2]~q\);

-- Location: LCCOMB_X17_Y19_N18
\rf_block|registers[5][2]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[5][2]~feeder_combout\ = \rf_block|registers~27_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rf_block|registers~27_combout\,
	combout => \rf_block|registers[5][2]~feeder_combout\);

-- Location: FF_X17_Y19_N19
\rf_block|registers[5][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[5][2]~feeder_combout\,
	asdata => \immediate[2]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[5][7]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[5][2]~q\);

-- Location: LCCOMB_X14_Y19_N26
\rf_block|rs_data~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rs_data~22_combout\ = (\rs_address[1]~input_o\ & (((\rs_address[0]~input_o\)))) # (!\rs_address[1]~input_o\ & ((\rs_address[0]~input_o\ & ((\rf_block|registers[5][2]~q\))) # (!\rs_address[0]~input_o\ & (\rf_block|registers[4][2]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers[4][2]~q\,
	datab => \rs_address[1]~input_o\,
	datac => \rs_address[0]~input_o\,
	datad => \rf_block|registers[5][2]~q\,
	combout => \rf_block|rs_data~22_combout\);

-- Location: LCCOMB_X15_Y20_N12
\rf_block|registers[6][2]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[6][2]~feeder_combout\ = \rf_block|registers~27_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rf_block|registers~27_combout\,
	combout => \rf_block|registers[6][2]~feeder_combout\);

-- Location: FF_X15_Y20_N13
\rf_block|registers[6][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[6][2]~feeder_combout\,
	asdata => \immediate[2]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[6][3]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[6][2]~q\);

-- Location: LCCOMB_X14_Y19_N12
\rf_block|rs_data~23\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rs_data~23_combout\ = (\rs_address[1]~input_o\ & ((\rf_block|rs_data~22_combout\ & (\rf_block|registers[7][2]~q\)) # (!\rf_block|rs_data~22_combout\ & ((\rf_block|registers[6][2]~q\))))) # (!\rs_address[1]~input_o\ & 
-- (((\rf_block|rs_data~22_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011110010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers[7][2]~q\,
	datab => \rs_address[1]~input_o\,
	datac => \rf_block|rs_data~22_combout\,
	datad => \rf_block|registers[6][2]~q\,
	combout => \rf_block|rs_data~23_combout\);

-- Location: LCCOMB_X19_Y18_N0
\rf_block|registers~28\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers~28_combout\ = (\reg_input_mux[1]~input_o\ & ((\immediate[2]~input_o\))) # (!\reg_input_mux[1]~input_o\ & (\rf_block|registers~27_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers~27_combout\,
	datab => \reg_input_mux[1]~input_o\,
	datad => \immediate[2]~input_o\,
	combout => \rf_block|registers~28_combout\);

-- Location: FF_X19_Y18_N1
\rf_block|registers[14][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers~28_combout\,
	asdata => VCC,
	sload => \reset~input_o\,
	ena => \rf_block|registers[14][6]~21_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[14][2]~q\);

-- Location: FF_X17_Y20_N15
\rf_block|registers[15][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers~27_combout\,
	asdata => \immediate[2]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[15][6]~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[15][2]~q\);

-- Location: LCCOMB_X17_Y20_N12
\rf_block|registers[12][2]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[12][2]~feeder_combout\ = \rf_block|registers~27_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \rf_block|registers~27_combout\,
	combout => \rf_block|registers[12][2]~feeder_combout\);

-- Location: FF_X17_Y20_N13
\rf_block|registers[12][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[12][2]~feeder_combout\,
	asdata => \immediate[2]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[12][6]~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[12][2]~q\);

-- Location: LCCOMB_X19_Y20_N2
\rf_block|registers~29\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers~29_combout\ = (\rf_block|registers[13][4]~17_combout\ & (((\lsu_block|lsu_out\(2)) # (\rf_block|registers[13][4]~16_combout\)))) # (!\rf_block|registers[13][4]~17_combout\ & (\alu_block|alu_out\(2) & 
-- ((!\rf_block|registers[13][4]~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \alu_block|alu_out\(2),
	datab => \lsu_block|lsu_out\(2),
	datac => \rf_block|registers[13][4]~17_combout\,
	datad => \rf_block|registers[13][4]~16_combout\,
	combout => \rf_block|registers~29_combout\);

-- Location: IOIBUF_X19_Y25_N15
\block_id[2]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_block_id(2),
	o => \block_id[2]~input_o\);

-- Location: LCCOMB_X19_Y21_N8
\rf_block|registers~30\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers~30_combout\ = (\rf_block|registers~29_combout\ & ((\block_id[2]~input_o\) # ((!\rf_block|registers[13][4]~16_combout\)))) # (!\rf_block|registers~29_combout\ & (((\immediate[2]~input_o\ & \rf_block|registers[13][4]~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers~29_combout\,
	datab => \block_id[2]~input_o\,
	datac => \immediate[2]~input_o\,
	datad => \rf_block|registers[13][4]~16_combout\,
	combout => \rf_block|registers~30_combout\);

-- Location: FF_X19_Y21_N9
\rf_block|registers[13][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers~30_combout\,
	sclr => \reset~input_o\,
	ena => \rf_block|registers[13][4]~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[13][2]~q\);

-- Location: LCCOMB_X17_Y20_N16
\rf_block|rs_data~29\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rs_data~29_combout\ = (\rs_address[1]~input_o\ & (((\rs_address[0]~input_o\)))) # (!\rs_address[1]~input_o\ & ((\rs_address[0]~input_o\ & ((\rf_block|registers[13][2]~q\))) # (!\rs_address[0]~input_o\ & (\rf_block|registers[12][2]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers[12][2]~q\,
	datab => \rs_address[1]~input_o\,
	datac => \rs_address[0]~input_o\,
	datad => \rf_block|registers[13][2]~q\,
	combout => \rf_block|rs_data~29_combout\);

-- Location: LCCOMB_X14_Y19_N0
\rf_block|rs_data~30\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rs_data~30_combout\ = (\rs_address[1]~input_o\ & ((\rf_block|rs_data~29_combout\ & ((\rf_block|registers[15][2]~q\))) # (!\rf_block|rs_data~29_combout\ & (\rf_block|registers[14][2]~q\)))) # (!\rs_address[1]~input_o\ & 
-- (((\rf_block|rs_data~29_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers[14][2]~q\,
	datab => \rs_address[1]~input_o\,
	datac => \rf_block|registers[15][2]~q\,
	datad => \rf_block|rs_data~29_combout\,
	combout => \rf_block|rs_data~30_combout\);

-- Location: LCCOMB_X15_Y20_N18
\rf_block|registers[2][2]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[2][2]~feeder_combout\ = \rf_block|registers~27_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rf_block|registers~27_combout\,
	combout => \rf_block|registers[2][2]~feeder_combout\);

-- Location: FF_X15_Y20_N19
\rf_block|registers[2][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[2][2]~feeder_combout\,
	asdata => \immediate[2]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[2][4]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[2][2]~q\);

-- Location: LCCOMB_X17_Y18_N0
\rf_block|registers[0][2]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[0][2]~feeder_combout\ = \rf_block|registers~27_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rf_block|registers~27_combout\,
	combout => \rf_block|registers[0][2]~feeder_combout\);

-- Location: FF_X17_Y18_N1
\rf_block|registers[0][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[0][2]~feeder_combout\,
	asdata => \immediate[2]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[0][2]~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[0][2]~q\);

-- Location: LCCOMB_X15_Y19_N6
\rf_block|rs_data~26\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rs_data~26_combout\ = (\rs_address[1]~input_o\ & ((\rs_address[0]~input_o\) # ((\rf_block|registers[2][2]~q\)))) # (!\rs_address[1]~input_o\ & (!\rs_address[0]~input_o\ & ((\rf_block|registers[0][2]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs_address[1]~input_o\,
	datab => \rs_address[0]~input_o\,
	datac => \rf_block|registers[2][2]~q\,
	datad => \rf_block|registers[0][2]~q\,
	combout => \rf_block|rs_data~26_combout\);

-- Location: LCCOMB_X15_Y19_N28
\rf_block|registers[3][2]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[3][2]~feeder_combout\ = \rf_block|registers~27_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rf_block|registers~27_combout\,
	combout => \rf_block|registers[3][2]~feeder_combout\);

-- Location: FF_X15_Y19_N29
\rf_block|registers[3][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[3][2]~feeder_combout\,
	asdata => \immediate[2]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[3][4]~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[3][2]~q\);

-- Location: LCCOMB_X15_Y19_N14
\rf_block|registers[1][2]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[1][2]~feeder_combout\ = \rf_block|registers~27_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rf_block|registers~27_combout\,
	combout => \rf_block|registers[1][2]~feeder_combout\);

-- Location: FF_X15_Y19_N15
\rf_block|registers[1][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[1][2]~feeder_combout\,
	asdata => \immediate[2]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[1][5]~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[1][2]~q\);

-- Location: LCCOMB_X15_Y19_N20
\rf_block|rs_data~27\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rs_data~27_combout\ = (\rf_block|rs_data~26_combout\ & ((\rf_block|registers[3][2]~q\) # ((!\rs_address[0]~input_o\)))) # (!\rf_block|rs_data~26_combout\ & (((\rf_block|registers[1][2]~q\ & \rs_address[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rs_data~26_combout\,
	datab => \rf_block|registers[3][2]~q\,
	datac => \rf_block|registers[1][2]~q\,
	datad => \rs_address[0]~input_o\,
	combout => \rf_block|rs_data~27_combout\);

-- Location: LCCOMB_X16_Y21_N18
\rf_block|registers[8][2]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[8][2]~feeder_combout\ = \rf_block|registers~27_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rf_block|registers~27_combout\,
	combout => \rf_block|registers[8][2]~feeder_combout\);

-- Location: FF_X16_Y21_N19
\rf_block|registers[8][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[8][2]~feeder_combout\,
	asdata => \immediate[2]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[8][5]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[8][2]~q\);

-- Location: LCCOMB_X16_Y20_N20
\rf_block|registers[10][2]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[10][2]~feeder_combout\ = \rf_block|registers~27_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rf_block|registers~27_combout\,
	combout => \rf_block|registers[10][2]~feeder_combout\);

-- Location: FF_X16_Y20_N21
\rf_block|registers[10][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[10][2]~feeder_combout\,
	asdata => \immediate[2]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[10][5]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[10][2]~q\);

-- Location: LCCOMB_X15_Y19_N10
\rf_block|rs_data~24\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rs_data~24_combout\ = (\rs_address[0]~input_o\ & (((\rs_address[1]~input_o\)))) # (!\rs_address[0]~input_o\ & ((\rs_address[1]~input_o\ & ((\rf_block|registers[10][2]~q\))) # (!\rs_address[1]~input_o\ & (\rf_block|registers[8][2]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers[8][2]~q\,
	datab => \rs_address[0]~input_o\,
	datac => \rs_address[1]~input_o\,
	datad => \rf_block|registers[10][2]~q\,
	combout => \rf_block|rs_data~24_combout\);

-- Location: LCCOMB_X18_Y18_N0
\rf_block|registers[11][2]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[11][2]~feeder_combout\ = \rf_block|registers~27_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rf_block|registers~27_combout\,
	combout => \rf_block|registers[11][2]~feeder_combout\);

-- Location: FF_X18_Y18_N1
\rf_block|registers[11][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[11][2]~feeder_combout\,
	asdata => \immediate[2]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[11][2]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[11][2]~q\);

-- Location: LCCOMB_X18_Y20_N16
\rf_block|registers[9][2]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[9][2]~feeder_combout\ = \rf_block|registers~27_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rf_block|registers~27_combout\,
	combout => \rf_block|registers[9][2]~feeder_combout\);

-- Location: FF_X18_Y20_N17
\rf_block|registers[9][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[9][2]~feeder_combout\,
	asdata => \immediate[2]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[9][5]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[9][2]~q\);

-- Location: LCCOMB_X15_Y19_N4
\rf_block|rs_data~25\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rs_data~25_combout\ = (\rf_block|rs_data~24_combout\ & (((\rf_block|registers[11][2]~q\)) # (!\rs_address[0]~input_o\))) # (!\rf_block|rs_data~24_combout\ & (\rs_address[0]~input_o\ & ((\rf_block|registers[9][2]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011010100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rs_data~24_combout\,
	datab => \rs_address[0]~input_o\,
	datac => \rf_block|registers[11][2]~q\,
	datad => \rf_block|registers[9][2]~q\,
	combout => \rf_block|rs_data~25_combout\);

-- Location: LCCOMB_X14_Y19_N30
\rf_block|rs_data~28\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rs_data~28_combout\ = (\rs_address[3]~input_o\ & ((\rs_address[2]~input_o\) # ((\rf_block|rs_data~25_combout\)))) # (!\rs_address[3]~input_o\ & (!\rs_address[2]~input_o\ & (\rf_block|rs_data~27_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs_address[3]~input_o\,
	datab => \rs_address[2]~input_o\,
	datac => \rf_block|rs_data~27_combout\,
	datad => \rf_block|rs_data~25_combout\,
	combout => \rf_block|rs_data~28_combout\);

-- Location: LCCOMB_X14_Y19_N10
\rf_block|rs_data~31\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rs_data~31_combout\ = (\rf_block|rs_data~28_combout\ & (((\rf_block|rs_data~30_combout\) # (!\rs_address[2]~input_o\)))) # (!\rf_block|rs_data~28_combout\ & (\rf_block|rs_data~23_combout\ & ((\rs_address[2]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rs_data~23_combout\,
	datab => \rf_block|rs_data~30_combout\,
	datac => \rf_block|rs_data~28_combout\,
	datad => \rs_address[2]~input_o\,
	combout => \rf_block|rs_data~31_combout\);

-- Location: LCCOMB_X22_Y19_N10
\rf_block|rs_data[2]~SCLR_LUT\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rs_data[2]~SCLR_LUT_combout\ = (!\reset~input_o\ & \rf_block|rs_data~31_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datad => \rf_block|rs_data~31_combout\,
	combout => \rf_block|rs_data[2]~SCLR_LUT_combout\);

-- Location: FF_X22_Y19_N17
\rf_block|rs_data[2]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	asdata => \rf_block|rs_data[2]~SCLR_LUT_combout\,
	sload => VCC,
	ena => \rf_block|rs_data[7]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|rs_data[2]~_Duplicate_1_q\);

-- Location: LCCOMB_X25_Y19_N4
\alu_block|Add0~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Add0~14_combout\ = \rf_block|rs_data[2]~_Duplicate_1_q\ $ (((\alu_select[1]~input_o\) # (\alu_select[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \alu_select[1]~input_o\,
	datab => \alu_select[0]~input_o\,
	datad => \rf_block|rs_data[2]~_Duplicate_1_q\,
	combout => \alu_block|Add0~14_combout\);

-- Location: LCCOMB_X25_Y19_N12
\alu_block|Add0~15\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Add0~15_combout\ = (\rf_block|rt_data[2]~_Duplicate_1_q\ & ((\alu_block|Add0~14_combout\ & (\alu_block|Add0~11\ & VCC)) # (!\alu_block|Add0~14_combout\ & (!\alu_block|Add0~11\)))) # (!\rf_block|rt_data[2]~_Duplicate_1_q\ & 
-- ((\alu_block|Add0~14_combout\ & (!\alu_block|Add0~11\)) # (!\alu_block|Add0~14_combout\ & ((\alu_block|Add0~11\) # (GND)))))
-- \alu_block|Add0~16\ = CARRY((\rf_block|rt_data[2]~_Duplicate_1_q\ & (!\alu_block|Add0~14_combout\ & !\alu_block|Add0~11\)) # (!\rf_block|rt_data[2]~_Duplicate_1_q\ & ((!\alu_block|Add0~11\) # (!\alu_block|Add0~14_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rt_data[2]~_Duplicate_1_q\,
	datab => \alu_block|Add0~14_combout\,
	datad => VCC,
	cin => \alu_block|Add0~11\,
	combout => \alu_block|Add0~15_combout\,
	cout => \alu_block|Add0~16\);

-- Location: LCCOMB_X17_Y18_N4
\rf_block|registers[4][6]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[4][6]~feeder_combout\ = \rf_block|registers~40_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rf_block|registers~40_combout\,
	combout => \rf_block|registers[4][6]~feeder_combout\);

-- Location: IOIBUF_X10_Y20_N15
\immediate[6]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_immediate(6),
	o => \immediate[6]~input_o\);

-- Location: FF_X17_Y18_N5
\rf_block|registers[4][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[4][6]~feeder_combout\,
	asdata => \immediate[6]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[4][4]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[4][6]~q\);

-- Location: LCCOMB_X17_Y19_N2
\rf_block|registers[5][6]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[5][6]~feeder_combout\ = \rf_block|registers~40_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers~40_combout\,
	combout => \rf_block|registers[5][6]~feeder_combout\);

-- Location: FF_X17_Y19_N3
\rf_block|registers[5][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[5][6]~feeder_combout\,
	asdata => \immediate[6]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[5][7]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[5][6]~q\);

-- Location: LCCOMB_X14_Y20_N12
\rf_block|rt_data~60\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rt_data~60_combout\ = (\rt_address[0]~input_o\ & ((\rt_address[1]~input_o\) # ((\rf_block|registers[5][6]~q\)))) # (!\rt_address[0]~input_o\ & (!\rt_address[1]~input_o\ & (\rf_block|registers[4][6]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rt_address[0]~input_o\,
	datab => \rt_address[1]~input_o\,
	datac => \rf_block|registers[4][6]~q\,
	datad => \rf_block|registers[5][6]~q\,
	combout => \rf_block|rt_data~60_combout\);

-- Location: LCCOMB_X15_Y20_N16
\rf_block|registers[6][6]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[6][6]~feeder_combout\ = \rf_block|registers~40_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers~40_combout\,
	combout => \rf_block|registers[6][6]~feeder_combout\);

-- Location: FF_X15_Y20_N17
\rf_block|registers[6][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[6][6]~feeder_combout\,
	asdata => \immediate[6]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[6][3]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[6][6]~q\);

-- Location: LCCOMB_X17_Y19_N24
\rf_block|registers[7][6]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[7][6]~feeder_combout\ = \rf_block|registers~40_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers~40_combout\,
	combout => \rf_block|registers[7][6]~feeder_combout\);

-- Location: FF_X17_Y19_N25
\rf_block|registers[7][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[7][6]~feeder_combout\,
	asdata => \immediate[6]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[7][1]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[7][6]~q\);

-- Location: LCCOMB_X14_Y20_N10
\rf_block|rt_data~61\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rt_data~61_combout\ = (\rf_block|rt_data~60_combout\ & (((\rf_block|registers[7][6]~q\) # (!\rt_address[1]~input_o\)))) # (!\rf_block|rt_data~60_combout\ & (\rf_block|registers[6][6]~q\ & (\rt_address[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rt_data~60_combout\,
	datab => \rf_block|registers[6][6]~q\,
	datac => \rt_address[1]~input_o\,
	datad => \rf_block|registers[7][6]~q\,
	combout => \rf_block|rt_data~61_combout\);

-- Location: LCCOMB_X16_Y21_N30
\rf_block|registers[8][6]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[8][6]~feeder_combout\ = \rf_block|registers~40_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rf_block|registers~40_combout\,
	combout => \rf_block|registers[8][6]~feeder_combout\);

-- Location: FF_X16_Y21_N31
\rf_block|registers[8][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[8][6]~feeder_combout\,
	asdata => \immediate[6]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[8][5]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[8][6]~q\);

-- Location: LCCOMB_X18_Y20_N0
\rf_block|registers[10][6]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[10][6]~feeder_combout\ = \rf_block|registers~40_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers~40_combout\,
	combout => \rf_block|registers[10][6]~feeder_combout\);

-- Location: FF_X18_Y20_N1
\rf_block|registers[10][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[10][6]~feeder_combout\,
	asdata => \immediate[6]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[10][5]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[10][6]~q\);

-- Location: LCCOMB_X14_Y20_N28
\rf_block|rt_data~62\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rt_data~62_combout\ = (\rt_address[0]~input_o\ & (\rt_address[1]~input_o\)) # (!\rt_address[0]~input_o\ & ((\rt_address[1]~input_o\ & ((\rf_block|registers[10][6]~q\))) # (!\rt_address[1]~input_o\ & (\rf_block|registers[8][6]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rt_address[0]~input_o\,
	datab => \rt_address[1]~input_o\,
	datac => \rf_block|registers[8][6]~q\,
	datad => \rf_block|registers[10][6]~q\,
	combout => \rf_block|rt_data~62_combout\);

-- Location: LCCOMB_X18_Y18_N2
\rf_block|registers[11][6]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[11][6]~feeder_combout\ = \rf_block|registers~40_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rf_block|registers~40_combout\,
	combout => \rf_block|registers[11][6]~feeder_combout\);

-- Location: FF_X18_Y18_N3
\rf_block|registers[11][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[11][6]~feeder_combout\,
	asdata => \immediate[6]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[11][2]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[11][6]~q\);

-- Location: LCCOMB_X18_Y20_N18
\rf_block|registers[9][6]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[9][6]~feeder_combout\ = \rf_block|registers~40_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers~40_combout\,
	combout => \rf_block|registers[9][6]~feeder_combout\);

-- Location: FF_X18_Y20_N19
\rf_block|registers[9][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[9][6]~feeder_combout\,
	asdata => \immediate[6]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[9][5]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[9][6]~q\);

-- Location: LCCOMB_X14_Y20_N14
\rf_block|rt_data~63\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rt_data~63_combout\ = (\rt_address[0]~input_o\ & ((\rf_block|rt_data~62_combout\ & (\rf_block|registers[11][6]~q\)) # (!\rf_block|rt_data~62_combout\ & ((\rf_block|registers[9][6]~q\))))) # (!\rt_address[0]~input_o\ & 
-- (\rf_block|rt_data~62_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rt_address[0]~input_o\,
	datab => \rf_block|rt_data~62_combout\,
	datac => \rf_block|registers[11][6]~q\,
	datad => \rf_block|registers[9][6]~q\,
	combout => \rf_block|rt_data~63_combout\);

-- Location: LCCOMB_X14_Y20_N24
\rf_block|registers[1][6]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[1][6]~feeder_combout\ = \rf_block|registers~40_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rf_block|registers~40_combout\,
	combout => \rf_block|registers[1][6]~feeder_combout\);

-- Location: FF_X14_Y20_N25
\rf_block|registers[1][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[1][6]~feeder_combout\,
	asdata => \immediate[6]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[1][5]~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[1][6]~q\);

-- Location: LCCOMB_X15_Y20_N6
\rf_block|registers[2][6]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[2][6]~feeder_combout\ = \rf_block|registers~40_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers~40_combout\,
	combout => \rf_block|registers[2][6]~feeder_combout\);

-- Location: FF_X15_Y20_N7
\rf_block|registers[2][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[2][6]~feeder_combout\,
	asdata => \immediate[6]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[2][4]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[2][6]~q\);

-- Location: LCCOMB_X17_Y18_N14
\rf_block|registers[0][6]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[0][6]~feeder_combout\ = \rf_block|registers~40_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rf_block|registers~40_combout\,
	combout => \rf_block|registers[0][6]~feeder_combout\);

-- Location: FF_X17_Y18_N15
\rf_block|registers[0][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[0][6]~feeder_combout\,
	asdata => \immediate[6]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[0][2]~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[0][6]~q\);

-- Location: LCCOMB_X14_Y20_N4
\rf_block|rt_data~64\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rt_data~64_combout\ = (\rt_address[1]~input_o\ & ((\rf_block|registers[2][6]~q\) # ((\rt_address[0]~input_o\)))) # (!\rt_address[1]~input_o\ & (((!\rt_address[0]~input_o\ & \rf_block|registers[0][6]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers[2][6]~q\,
	datab => \rt_address[1]~input_o\,
	datac => \rt_address[0]~input_o\,
	datad => \rf_block|registers[0][6]~q\,
	combout => \rf_block|rt_data~64_combout\);

-- Location: LCCOMB_X14_Y20_N2
\rf_block|rt_data~65\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rt_data~65_combout\ = (\rt_address[0]~input_o\ & ((\rf_block|rt_data~64_combout\ & ((\rf_block|registers[3][6]~q\))) # (!\rf_block|rt_data~64_combout\ & (\rf_block|registers[1][6]~q\)))) # (!\rt_address[0]~input_o\ & 
-- (((\rf_block|rt_data~64_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100001011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rt_address[0]~input_o\,
	datab => \rf_block|registers[1][6]~q\,
	datac => \rf_block|rt_data~64_combout\,
	datad => \rf_block|registers[3][6]~q\,
	combout => \rf_block|rt_data~65_combout\);

-- Location: LCCOMB_X14_Y20_N0
\rf_block|rt_data~66\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rt_data~66_combout\ = (\rt_address[3]~input_o\ & ((\rf_block|rt_data~63_combout\) # ((\rt_address[2]~input_o\)))) # (!\rt_address[3]~input_o\ & (((!\rt_address[2]~input_o\ & \rf_block|rt_data~65_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rt_address[3]~input_o\,
	datab => \rf_block|rt_data~63_combout\,
	datac => \rt_address[2]~input_o\,
	datad => \rf_block|rt_data~65_combout\,
	combout => \rf_block|rt_data~66_combout\);

-- Location: IOIBUF_X19_Y25_N8
\block_id[6]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_block_id(6),
	o => \block_id[6]~input_o\);

-- Location: IOIBUF_X19_Y25_N29
\mem_read_data[6]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_mem_read_data(6),
	o => \mem_read_data[6]~input_o\);

-- Location: LCCOMB_X20_Y21_N20
\lsu_block|lsu_out~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \lsu_block|lsu_out~8_combout\ = (!\reset~input_o\ & \mem_read_data[6]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \reset~input_o\,
	datad => \mem_read_data[6]~input_o\,
	combout => \lsu_block|lsu_out~8_combout\);

-- Location: FF_X20_Y21_N21
\lsu_block|lsu_out[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \lsu_block|lsu_out~8_combout\,
	ena => \lsu_block|lsu_out[2]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \lsu_block|lsu_out\(6));

-- Location: LCCOMB_X20_Y21_N2
\rf_block|registers~41\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers~41_combout\ = (\rf_block|registers[13][4]~16_combout\ & (((\rf_block|registers[13][4]~17_combout\)))) # (!\rf_block|registers[13][4]~16_combout\ & ((\rf_block|registers[13][4]~17_combout\ & ((\lsu_block|lsu_out\(6)))) # 
-- (!\rf_block|registers[13][4]~17_combout\ & (\alu_block|alu_out\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \alu_block|alu_out\(6),
	datab => \lsu_block|lsu_out\(6),
	datac => \rf_block|registers[13][4]~16_combout\,
	datad => \rf_block|registers[13][4]~17_combout\,
	combout => \rf_block|registers~41_combout\);

-- Location: LCCOMB_X19_Y21_N4
\rf_block|registers~42\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers~42_combout\ = (\rf_block|registers[13][4]~16_combout\ & ((\rf_block|registers~41_combout\ & ((\block_id[6]~input_o\))) # (!\rf_block|registers~41_combout\ & (\immediate[6]~input_o\)))) # (!\rf_block|registers[13][4]~16_combout\ & 
-- (((\rf_block|registers~41_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers[13][4]~16_combout\,
	datab => \immediate[6]~input_o\,
	datac => \block_id[6]~input_o\,
	datad => \rf_block|registers~41_combout\,
	combout => \rf_block|registers~42_combout\);

-- Location: FF_X19_Y21_N5
\rf_block|registers[13][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers~42_combout\,
	sclr => \reset~input_o\,
	ena => \rf_block|registers[13][4]~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[13][6]~q\);

-- Location: LCCOMB_X19_Y20_N10
\rf_block|registers[12][6]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[12][6]~feeder_combout\ = \rf_block|registers~40_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers~40_combout\,
	combout => \rf_block|registers[12][6]~feeder_combout\);

-- Location: FF_X19_Y20_N11
\rf_block|registers[12][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[12][6]~feeder_combout\,
	asdata => \immediate[6]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[12][6]~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[12][6]~q\);

-- Location: LCCOMB_X19_Y20_N26
\rf_block|rt_data~67\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rt_data~67_combout\ = (\rt_address[1]~input_o\ & (\rt_address[0]~input_o\)) # (!\rt_address[1]~input_o\ & ((\rt_address[0]~input_o\ & (\rf_block|registers[13][6]~q\)) # (!\rt_address[0]~input_o\ & ((\rf_block|registers[12][6]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rt_address[1]~input_o\,
	datab => \rt_address[0]~input_o\,
	datac => \rf_block|registers[13][6]~q\,
	datad => \rf_block|registers[12][6]~q\,
	combout => \rf_block|rt_data~67_combout\);

-- Location: FF_X20_Y21_N17
\rf_block|registers[15][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers~40_combout\,
	asdata => \immediate[6]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[15][6]~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[15][6]~q\);

-- Location: LCCOMB_X19_Y20_N28
\rf_block|registers[14][6]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[14][6]~feeder_combout\ = \rf_block|registers~40_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers~40_combout\,
	combout => \rf_block|registers[14][6]~feeder_combout\);

-- Location: FF_X19_Y20_N29
\rf_block|registers[14][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[14][6]~feeder_combout\,
	asdata => \immediate[6]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[14][6]~21_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[14][6]~q\);

-- Location: LCCOMB_X19_Y20_N0
\rf_block|rt_data~68\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rt_data~68_combout\ = (\rf_block|rt_data~67_combout\ & ((\rf_block|registers[15][6]~q\) # ((!\rt_address[1]~input_o\)))) # (!\rf_block|rt_data~67_combout\ & (((\rt_address[1]~input_o\ & \rf_block|registers[14][6]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101010001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rt_data~67_combout\,
	datab => \rf_block|registers[15][6]~q\,
	datac => \rt_address[1]~input_o\,
	datad => \rf_block|registers[14][6]~q\,
	combout => \rf_block|rt_data~68_combout\);

-- Location: LCCOMB_X14_Y20_N30
\rf_block|rt_data~69\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rt_data~69_combout\ = (\rf_block|rt_data~66_combout\ & (((\rf_block|rt_data~68_combout\) # (!\rt_address[2]~input_o\)))) # (!\rf_block|rt_data~66_combout\ & (\rf_block|rt_data~61_combout\ & (\rt_address[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110000101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rt_data~61_combout\,
	datab => \rf_block|rt_data~66_combout\,
	datac => \rt_address[2]~input_o\,
	datad => \rf_block|rt_data~68_combout\,
	combout => \rf_block|rt_data~69_combout\);

-- Location: LCCOMB_X20_Y19_N16
\rf_block|rt_data[6]~SCLR_LUT\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rt_data[6]~SCLR_LUT_combout\ = (\rf_block|rt_data~69_combout\ & !\reset~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \rf_block|rt_data~69_combout\,
	datad => \reset~input_o\,
	combout => \rf_block|rt_data[6]~SCLR_LUT_combout\);

-- Location: FF_X22_Y19_N1
\rf_block|rt_data[6]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	asdata => \rf_block|rt_data[6]~SCLR_LUT_combout\,
	sload => VCC,
	ena => \rf_block|rs_data[7]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|rt_data[6]~_Duplicate_1_q\);

-- Location: LCCOMB_X25_Y19_N24
\alu_block|Add0~34\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Add0~34_combout\ = \rf_block|rs_data[6]~_Duplicate_1_q\ $ (((\alu_select[0]~input_o\) # (\alu_select[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \alu_select[0]~input_o\,
	datac => \alu_select[1]~input_o\,
	datad => \rf_block|rs_data[6]~_Duplicate_1_q\,
	combout => \alu_block|Add0~34_combout\);

-- Location: IOIBUF_X22_Y25_N22
\mem_read_data[5]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_mem_read_data(5),
	o => \mem_read_data[5]~input_o\);

-- Location: LCCOMB_X20_Y21_N6
\lsu_block|lsu_out~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \lsu_block|lsu_out~7_combout\ = (!\reset~input_o\ & \mem_read_data[5]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \reset~input_o\,
	datad => \mem_read_data[5]~input_o\,
	combout => \lsu_block|lsu_out~7_combout\);

-- Location: FF_X20_Y21_N7
\lsu_block|lsu_out[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \lsu_block|lsu_out~7_combout\,
	ena => \lsu_block|lsu_out[2]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \lsu_block|lsu_out\(5));

-- Location: IOIBUF_X10_Y18_N22
\immediate[4]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_immediate(4),
	o => \immediate[4]~input_o\);

-- Location: IOIBUF_X6_Y10_N15
\block_id[4]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_block_id(4),
	o => \block_id[4]~input_o\);

-- Location: IOIBUF_X17_Y25_N15
\mem_read_data[4]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_mem_read_data(4),
	o => \mem_read_data[4]~input_o\);

-- Location: LCCOMB_X20_Y21_N10
\lsu_block|lsu_out~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \lsu_block|lsu_out~6_combout\ = (!\reset~input_o\ & \mem_read_data[4]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \reset~input_o\,
	datad => \mem_read_data[4]~input_o\,
	combout => \lsu_block|lsu_out~6_combout\);

-- Location: FF_X20_Y21_N11
\lsu_block|lsu_out[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \lsu_block|lsu_out~6_combout\,
	ena => \lsu_block|lsu_out[2]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \lsu_block|lsu_out\(4));

-- Location: LCCOMB_X18_Y18_N12
\rf_block|registers[11][5]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[11][5]~feeder_combout\ = \rf_block|registers~37_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rf_block|registers~37_combout\,
	combout => \rf_block|registers[11][5]~feeder_combout\);

-- Location: IOIBUF_X10_Y18_N15
\immediate[5]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_immediate(5),
	o => \immediate[5]~input_o\);

-- Location: FF_X18_Y18_N13
\rf_block|registers[11][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[11][5]~feeder_combout\,
	asdata => \immediate[5]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[11][2]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[11][5]~q\);

-- Location: LCCOMB_X16_Y21_N0
\rf_block|registers[3][5]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[3][5]~feeder_combout\ = \rf_block|registers~37_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rf_block|registers~37_combout\,
	combout => \rf_block|registers[3][5]~feeder_combout\);

-- Location: FF_X16_Y21_N1
\rf_block|registers[3][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[3][5]~feeder_combout\,
	asdata => \immediate[5]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[3][4]~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[3][5]~q\);

-- Location: LCCOMB_X17_Y19_N28
\rf_block|registers[7][5]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[7][5]~feeder_combout\ = \rf_block|registers~37_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rf_block|registers~37_combout\,
	combout => \rf_block|registers[7][5]~feeder_combout\);

-- Location: FF_X17_Y19_N29
\rf_block|registers[7][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[7][5]~feeder_combout\,
	asdata => \immediate[5]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[7][1]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[7][5]~q\);

-- Location: LCCOMB_X18_Y19_N30
\rf_block|rt_data~57\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rt_data~57_combout\ = (\rt_address[3]~input_o\ & (((\rt_address[2]~input_o\)))) # (!\rt_address[3]~input_o\ & ((\rt_address[2]~input_o\ & ((\rf_block|registers[7][5]~q\))) # (!\rt_address[2]~input_o\ & (\rf_block|registers[3][5]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers[3][5]~q\,
	datab => \rt_address[3]~input_o\,
	datac => \rt_address[2]~input_o\,
	datad => \rf_block|registers[7][5]~q\,
	combout => \rf_block|rt_data~57_combout\);

-- Location: FF_X20_Y21_N23
\rf_block|registers[15][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers~37_combout\,
	asdata => \immediate[5]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[15][6]~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[15][5]~q\);

-- Location: LCCOMB_X18_Y19_N12
\rf_block|rt_data~58\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rt_data~58_combout\ = (\rt_address[3]~input_o\ & ((\rf_block|rt_data~57_combout\ & ((\rf_block|registers[15][5]~q\))) # (!\rf_block|rt_data~57_combout\ & (\rf_block|registers[11][5]~q\)))) # (!\rt_address[3]~input_o\ & 
-- (((\rf_block|rt_data~57_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100000111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers[11][5]~q\,
	datab => \rt_address[3]~input_o\,
	datac => \rf_block|rt_data~57_combout\,
	datad => \rf_block|registers[15][5]~q\,
	combout => \rf_block|rt_data~58_combout\);

-- Location: LCCOMB_X19_Y21_N2
\rf_block|registers~38\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers~38_combout\ = (\rf_block|registers[13][4]~17_combout\ & (((\rf_block|registers[13][4]~16_combout\)))) # (!\rf_block|registers[13][4]~17_combout\ & ((\rf_block|registers[13][4]~16_combout\ & ((\immediate[5]~input_o\))) # 
-- (!\rf_block|registers[13][4]~16_combout\ & (\alu_block|alu_out\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \alu_block|alu_out\(5),
	datab => \immediate[5]~input_o\,
	datac => \rf_block|registers[13][4]~17_combout\,
	datad => \rf_block|registers[13][4]~16_combout\,
	combout => \rf_block|registers~38_combout\);

-- Location: IOIBUF_X19_Y25_N22
\block_id[5]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_block_id(5),
	o => \block_id[5]~input_o\);

-- Location: LCCOMB_X19_Y21_N6
\rf_block|registers~39\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers~39_combout\ = (\rf_block|registers[13][4]~17_combout\ & ((\rf_block|registers~38_combout\ & ((\block_id[5]~input_o\))) # (!\rf_block|registers~38_combout\ & (\lsu_block|lsu_out\(5))))) # (!\rf_block|registers[13][4]~17_combout\ & 
-- (\rf_block|registers~38_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110001100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers[13][4]~17_combout\,
	datab => \rf_block|registers~38_combout\,
	datac => \lsu_block|lsu_out\(5),
	datad => \block_id[5]~input_o\,
	combout => \rf_block|registers~39_combout\);

-- Location: FF_X19_Y21_N7
\rf_block|registers[13][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers~39_combout\,
	sclr => \reset~input_o\,
	ena => \rf_block|registers[13][4]~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[13][5]~q\);

-- Location: LCCOMB_X17_Y19_N14
\rf_block|registers[5][5]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[5][5]~feeder_combout\ = \rf_block|registers~37_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rf_block|registers~37_combout\,
	combout => \rf_block|registers[5][5]~feeder_combout\);

-- Location: FF_X17_Y19_N15
\rf_block|registers[5][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[5][5]~feeder_combout\,
	asdata => \immediate[5]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[5][7]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[5][5]~q\);

-- Location: LCCOMB_X18_Y18_N10
\rf_block|registers[1][5]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[1][5]~feeder_combout\ = \rf_block|registers~37_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rf_block|registers~37_combout\,
	combout => \rf_block|registers[1][5]~feeder_combout\);

-- Location: FF_X18_Y18_N11
\rf_block|registers[1][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[1][5]~feeder_combout\,
	asdata => \immediate[5]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[1][5]~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[1][5]~q\);

-- Location: LCCOMB_X18_Y19_N8
\rf_block|rt_data~52\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rt_data~52_combout\ = (\rt_address[3]~input_o\ & (((\rt_address[2]~input_o\)))) # (!\rt_address[3]~input_o\ & ((\rt_address[2]~input_o\ & (\rf_block|registers[5][5]~q\)) # (!\rt_address[2]~input_o\ & ((\rf_block|registers[1][5]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers[5][5]~q\,
	datab => \rt_address[3]~input_o\,
	datac => \rt_address[2]~input_o\,
	datad => \rf_block|registers[1][5]~q\,
	combout => \rf_block|rt_data~52_combout\);

-- Location: LCCOMB_X18_Y20_N28
\rf_block|registers[9][5]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[9][5]~feeder_combout\ = \rf_block|registers~37_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rf_block|registers~37_combout\,
	combout => \rf_block|registers[9][5]~feeder_combout\);

-- Location: FF_X18_Y20_N29
\rf_block|registers[9][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[9][5]~feeder_combout\,
	asdata => \immediate[5]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[9][5]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[9][5]~q\);

-- Location: LCCOMB_X18_Y19_N26
\rf_block|rt_data~53\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rt_data~53_combout\ = (\rf_block|rt_data~52_combout\ & ((\rf_block|registers[13][5]~q\) # ((!\rt_address[3]~input_o\)))) # (!\rf_block|rt_data~52_combout\ & (((\rt_address[3]~input_o\ & \rf_block|registers[9][5]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011110010001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers[13][5]~q\,
	datab => \rf_block|rt_data~52_combout\,
	datac => \rt_address[3]~input_o\,
	datad => \rf_block|registers[9][5]~q\,
	combout => \rf_block|rt_data~53_combout\);

-- Location: LCCOMB_X17_Y21_N4
\rf_block|registers[4][5]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[4][5]~feeder_combout\ = \rf_block|registers~37_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers~37_combout\,
	combout => \rf_block|registers[4][5]~feeder_combout\);

-- Location: FF_X17_Y21_N5
\rf_block|registers[4][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[4][5]~feeder_combout\,
	asdata => \immediate[5]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[4][4]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[4][5]~q\);

-- Location: LCCOMB_X16_Y21_N14
\rf_block|registers[8][5]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[8][5]~feeder_combout\ = \rf_block|registers~37_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rf_block|registers~37_combout\,
	combout => \rf_block|registers[8][5]~feeder_combout\);

-- Location: FF_X16_Y21_N15
\rf_block|registers[8][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[8][5]~feeder_combout\,
	asdata => \immediate[5]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[8][5]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[8][5]~q\);

-- Location: LCCOMB_X17_Y18_N18
\rf_block|registers[0][5]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[0][5]~feeder_combout\ = \rf_block|registers~37_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers~37_combout\,
	combout => \rf_block|registers[0][5]~feeder_combout\);

-- Location: FF_X17_Y18_N19
\rf_block|registers[0][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[0][5]~feeder_combout\,
	asdata => \immediate[5]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[0][2]~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[0][5]~q\);

-- Location: LCCOMB_X17_Y21_N24
\rf_block|rt_data~54\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rt_data~54_combout\ = (\rt_address[3]~input_o\ & ((\rf_block|registers[8][5]~q\) # ((\rt_address[2]~input_o\)))) # (!\rt_address[3]~input_o\ & (((!\rt_address[2]~input_o\ & \rf_block|registers[0][5]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers[8][5]~q\,
	datab => \rt_address[3]~input_o\,
	datac => \rt_address[2]~input_o\,
	datad => \rf_block|registers[0][5]~q\,
	combout => \rf_block|rt_data~54_combout\);

-- Location: LCCOMB_X17_Y21_N26
\rf_block|rt_data~55\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rt_data~55_combout\ = (\rt_address[2]~input_o\ & ((\rf_block|rt_data~54_combout\ & (\rf_block|registers[12][5]~q\)) # (!\rf_block|rt_data~54_combout\ & ((\rf_block|registers[4][5]~q\))))) # (!\rt_address[2]~input_o\ & 
-- (((\rf_block|rt_data~54_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers[12][5]~q\,
	datab => \rt_address[2]~input_o\,
	datac => \rf_block|registers[4][5]~q\,
	datad => \rf_block|rt_data~54_combout\,
	combout => \rf_block|rt_data~55_combout\);

-- Location: LCCOMB_X18_Y19_N20
\rf_block|rt_data~56\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rt_data~56_combout\ = (\rt_address[0]~input_o\ & ((\rf_block|rt_data~53_combout\) # ((\rt_address[1]~input_o\)))) # (!\rt_address[0]~input_o\ & (((!\rt_address[1]~input_o\ & \rf_block|rt_data~55_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rt_data~53_combout\,
	datab => \rt_address[0]~input_o\,
	datac => \rt_address[1]~input_o\,
	datad => \rf_block|rt_data~55_combout\,
	combout => \rf_block|rt_data~56_combout\);

-- Location: LCCOMB_X15_Y20_N28
\rf_block|registers[6][5]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[6][5]~feeder_combout\ = \rf_block|registers~37_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rf_block|registers~37_combout\,
	combout => \rf_block|registers[6][5]~feeder_combout\);

-- Location: FF_X15_Y20_N29
\rf_block|registers[6][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[6][5]~feeder_combout\,
	asdata => \immediate[5]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[6][3]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[6][5]~q\);

-- Location: LCCOMB_X19_Y20_N30
\rf_block|registers[14][5]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[14][5]~feeder_combout\ = \rf_block|registers~37_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rf_block|registers~37_combout\,
	combout => \rf_block|registers[14][5]~feeder_combout\);

-- Location: FF_X19_Y20_N31
\rf_block|registers[14][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[14][5]~feeder_combout\,
	asdata => \immediate[5]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[14][6]~21_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[14][5]~q\);

-- Location: LCCOMB_X18_Y20_N30
\rf_block|registers[10][5]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[10][5]~feeder_combout\ = \rf_block|registers~37_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rf_block|registers~37_combout\,
	combout => \rf_block|registers[10][5]~feeder_combout\);

-- Location: FF_X18_Y20_N31
\rf_block|registers[10][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[10][5]~feeder_combout\,
	asdata => \immediate[5]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[10][5]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[10][5]~q\);

-- Location: LCCOMB_X15_Y20_N30
\rf_block|registers[2][5]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[2][5]~feeder_combout\ = \rf_block|registers~37_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rf_block|registers~37_combout\,
	combout => \rf_block|registers[2][5]~feeder_combout\);

-- Location: FF_X15_Y20_N31
\rf_block|registers[2][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[2][5]~feeder_combout\,
	asdata => \immediate[5]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[2][4]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[2][5]~q\);

-- Location: LCCOMB_X18_Y19_N16
\rf_block|rt_data~50\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rt_data~50_combout\ = (\rt_address[2]~input_o\ & (((\rt_address[3]~input_o\)))) # (!\rt_address[2]~input_o\ & ((\rt_address[3]~input_o\ & (\rf_block|registers[10][5]~q\)) # (!\rt_address[3]~input_o\ & ((\rf_block|registers[2][5]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers[10][5]~q\,
	datab => \rt_address[2]~input_o\,
	datac => \rt_address[3]~input_o\,
	datad => \rf_block|registers[2][5]~q\,
	combout => \rf_block|rt_data~50_combout\);

-- Location: LCCOMB_X18_Y19_N6
\rf_block|rt_data~51\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rt_data~51_combout\ = (\rt_address[2]~input_o\ & ((\rf_block|rt_data~50_combout\ & ((\rf_block|registers[14][5]~q\))) # (!\rf_block|rt_data~50_combout\ & (\rf_block|registers[6][5]~q\)))) # (!\rt_address[2]~input_o\ & 
-- (((\rf_block|rt_data~50_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers[6][5]~q\,
	datab => \rt_address[2]~input_o\,
	datac => \rf_block|registers[14][5]~q\,
	datad => \rf_block|rt_data~50_combout\,
	combout => \rf_block|rt_data~51_combout\);

-- Location: LCCOMB_X18_Y19_N2
\rf_block|rt_data~59\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rt_data~59_combout\ = (\rf_block|rt_data~56_combout\ & ((\rf_block|rt_data~58_combout\) # ((!\rt_address[1]~input_o\)))) # (!\rf_block|rt_data~56_combout\ & (((\rt_address[1]~input_o\ & \rf_block|rt_data~51_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011110010001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rt_data~58_combout\,
	datab => \rf_block|rt_data~56_combout\,
	datac => \rt_address[1]~input_o\,
	datad => \rf_block|rt_data~51_combout\,
	combout => \rf_block|rt_data~59_combout\);

-- Location: LCCOMB_X18_Y19_N24
\rf_block|rt_data[5]~SCLR_LUT\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rt_data[5]~SCLR_LUT_combout\ = (!\reset~input_o\ & \rf_block|rt_data~59_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \reset~input_o\,
	datad => \rf_block|rt_data~59_combout\,
	combout => \rf_block|rt_data[5]~SCLR_LUT_combout\);

-- Location: LCCOMB_X15_Y20_N14
\rf_block|registers[2][7]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[2][7]~feeder_combout\ = \rf_block|registers~43_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rf_block|registers~43_combout\,
	combout => \rf_block|registers[2][7]~feeder_combout\);

-- Location: IOIBUF_X10_Y22_N15
\immediate[7]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_immediate(7),
	o => \immediate[7]~input_o\);

-- Location: FF_X15_Y20_N15
\rf_block|registers[2][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[2][7]~feeder_combout\,
	asdata => \immediate[7]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[2][4]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[2][7]~q\);

-- Location: LCCOMB_X15_Y20_N24
\rf_block|registers[6][7]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[6][7]~feeder_combout\ = \rf_block|registers~43_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rf_block|registers~43_combout\,
	combout => \rf_block|registers[6][7]~feeder_combout\);

-- Location: FF_X15_Y20_N25
\rf_block|registers[6][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[6][7]~feeder_combout\,
	asdata => \immediate[7]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[6][3]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[6][7]~q\);

-- Location: LCCOMB_X16_Y20_N10
\rf_block|rt_data~72\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rt_data~72_combout\ = (\rt_address[3]~input_o\ & (((\rt_address[2]~input_o\)))) # (!\rt_address[3]~input_o\ & ((\rt_address[2]~input_o\ & ((\rf_block|registers[6][7]~q\))) # (!\rt_address[2]~input_o\ & (\rf_block|registers[2][7]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers[2][7]~q\,
	datab => \rf_block|registers[6][7]~q\,
	datac => \rt_address[3]~input_o\,
	datad => \rt_address[2]~input_o\,
	combout => \rf_block|rt_data~72_combout\);

-- Location: LCCOMB_X16_Y20_N8
\rf_block|registers[10][7]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[10][7]~feeder_combout\ = \rf_block|registers~43_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rf_block|registers~43_combout\,
	combout => \rf_block|registers[10][7]~feeder_combout\);

-- Location: FF_X16_Y20_N9
\rf_block|registers[10][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[10][7]~feeder_combout\,
	asdata => \immediate[7]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[10][5]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[10][7]~q\);

-- Location: LCCOMB_X16_Y20_N6
\rf_block|registers[14][7]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[14][7]~feeder_combout\ = \rf_block|registers~43_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rf_block|registers~43_combout\,
	combout => \rf_block|registers[14][7]~feeder_combout\);

-- Location: FF_X16_Y20_N7
\rf_block|registers[14][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[14][7]~feeder_combout\,
	asdata => \immediate[7]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[14][6]~21_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[14][7]~q\);

-- Location: LCCOMB_X16_Y20_N16
\rf_block|rt_data~73\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rt_data~73_combout\ = (\rf_block|rt_data~72_combout\ & (((\rf_block|registers[14][7]~q\) # (!\rt_address[3]~input_o\)))) # (!\rf_block|rt_data~72_combout\ & (\rf_block|registers[10][7]~q\ & (\rt_address[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rt_data~72_combout\,
	datab => \rf_block|registers[10][7]~q\,
	datac => \rt_address[3]~input_o\,
	datad => \rf_block|registers[14][7]~q\,
	combout => \rf_block|rt_data~73_combout\);

-- Location: LCCOMB_X17_Y18_N10
\rf_block|registers[0][7]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[0][7]~feeder_combout\ = \rf_block|registers~43_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers~43_combout\,
	combout => \rf_block|registers[0][7]~feeder_combout\);

-- Location: FF_X17_Y18_N11
\rf_block|registers[0][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[0][7]~feeder_combout\,
	asdata => \immediate[7]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[0][2]~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[0][7]~q\);

-- Location: LCCOMB_X17_Y18_N20
\rf_block|registers[4][7]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[4][7]~feeder_combout\ = \rf_block|registers~43_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers~43_combout\,
	combout => \rf_block|registers[4][7]~feeder_combout\);

-- Location: FF_X17_Y18_N21
\rf_block|registers[4][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[4][7]~feeder_combout\,
	asdata => \immediate[7]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[4][4]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[4][7]~q\);

-- Location: LCCOMB_X17_Y18_N26
\rf_block|rt_data~74\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rt_data~74_combout\ = (\rt_address[2]~input_o\ & (((\rt_address[3]~input_o\) # (\rf_block|registers[4][7]~q\)))) # (!\rt_address[2]~input_o\ & (\rf_block|registers[0][7]~q\ & (!\rt_address[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers[0][7]~q\,
	datab => \rt_address[2]~input_o\,
	datac => \rt_address[3]~input_o\,
	datad => \rf_block|registers[4][7]~q\,
	combout => \rf_block|rt_data~74_combout\);

-- Location: LCCOMB_X16_Y21_N20
\rf_block|registers[8][7]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[8][7]~feeder_combout\ = \rf_block|registers~43_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rf_block|registers~43_combout\,
	combout => \rf_block|registers[8][7]~feeder_combout\);

-- Location: FF_X16_Y21_N21
\rf_block|registers[8][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[8][7]~feeder_combout\,
	asdata => \immediate[7]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[8][5]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[8][7]~q\);

-- Location: LCCOMB_X19_Y20_N8
\rf_block|registers[12][7]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[12][7]~feeder_combout\ = \rf_block|registers~43_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rf_block|registers~43_combout\,
	combout => \rf_block|registers[12][7]~feeder_combout\);

-- Location: FF_X19_Y20_N9
\rf_block|registers[12][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[12][7]~feeder_combout\,
	asdata => \immediate[7]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[12][6]~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[12][7]~q\);

-- Location: LCCOMB_X19_Y19_N0
\rf_block|rt_data~75\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rt_data~75_combout\ = (\rf_block|rt_data~74_combout\ & (((\rf_block|registers[12][7]~q\) # (!\rt_address[3]~input_o\)))) # (!\rf_block|rt_data~74_combout\ & (\rf_block|registers[8][7]~q\ & (\rt_address[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rt_data~74_combout\,
	datab => \rf_block|registers[8][7]~q\,
	datac => \rt_address[3]~input_o\,
	datad => \rf_block|registers[12][7]~q\,
	combout => \rf_block|rt_data~75_combout\);

-- Location: LCCOMB_X19_Y19_N6
\rf_block|rt_data~76\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rt_data~76_combout\ = (\rt_address[1]~input_o\ & ((\rt_address[0]~input_o\) # ((\rf_block|rt_data~73_combout\)))) # (!\rt_address[1]~input_o\ & (!\rt_address[0]~input_o\ & ((\rf_block|rt_data~75_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rt_address[1]~input_o\,
	datab => \rt_address[0]~input_o\,
	datac => \rf_block|rt_data~73_combout\,
	datad => \rf_block|rt_data~75_combout\,
	combout => \rf_block|rt_data~76_combout\);

-- Location: FF_X19_Y19_N25
\rf_block|registers[15][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers~43_combout\,
	asdata => \immediate[7]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[15][6]~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[15][7]~q\);

-- Location: LCCOMB_X17_Y19_N4
\rf_block|registers[7][7]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[7][7]~feeder_combout\ = \rf_block|registers~43_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rf_block|registers~43_combout\,
	combout => \rf_block|registers[7][7]~feeder_combout\);

-- Location: FF_X17_Y19_N5
\rf_block|registers[7][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[7][7]~feeder_combout\,
	asdata => \immediate[7]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[7][1]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[7][7]~q\);

-- Location: LCCOMB_X16_Y21_N22
\rf_block|registers[3][7]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[3][7]~feeder_combout\ = \rf_block|registers~43_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rf_block|registers~43_combout\,
	combout => \rf_block|registers[3][7]~feeder_combout\);

-- Location: FF_X16_Y21_N23
\rf_block|registers[3][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[3][7]~feeder_combout\,
	asdata => \immediate[7]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[3][4]~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[3][7]~q\);

-- Location: LCCOMB_X18_Y18_N22
\rf_block|registers[11][7]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[11][7]~feeder_combout\ = \rf_block|registers~43_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers~43_combout\,
	combout => \rf_block|registers[11][7]~feeder_combout\);

-- Location: FF_X18_Y18_N23
\rf_block|registers[11][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[11][7]~feeder_combout\,
	asdata => \immediate[7]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[11][2]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[11][7]~q\);

-- Location: LCCOMB_X19_Y19_N16
\rf_block|rt_data~77\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rt_data~77_combout\ = (\rt_address[3]~input_o\ & (((\rt_address[2]~input_o\) # (\rf_block|registers[11][7]~q\)))) # (!\rt_address[3]~input_o\ & (\rf_block|registers[3][7]~q\ & (!\rt_address[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers[3][7]~q\,
	datab => \rt_address[3]~input_o\,
	datac => \rt_address[2]~input_o\,
	datad => \rf_block|registers[11][7]~q\,
	combout => \rf_block|rt_data~77_combout\);

-- Location: LCCOMB_X19_Y19_N22
\rf_block|rt_data~78\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rt_data~78_combout\ = (\rt_address[2]~input_o\ & ((\rf_block|rt_data~77_combout\ & (\rf_block|registers[15][7]~q\)) # (!\rf_block|rt_data~77_combout\ & ((\rf_block|registers[7][7]~q\))))) # (!\rt_address[2]~input_o\ & 
-- (((\rf_block|rt_data~77_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rt_address[2]~input_o\,
	datab => \rf_block|registers[15][7]~q\,
	datac => \rf_block|registers[7][7]~q\,
	datad => \rf_block|rt_data~77_combout\,
	combout => \rf_block|rt_data~78_combout\);

-- Location: LCCOMB_X18_Y18_N4
\rf_block|registers[1][7]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[1][7]~feeder_combout\ = \rf_block|registers~43_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers~43_combout\,
	combout => \rf_block|registers[1][7]~feeder_combout\);

-- Location: FF_X18_Y18_N5
\rf_block|registers[1][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[1][7]~feeder_combout\,
	asdata => \immediate[7]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[1][5]~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[1][7]~q\);

-- Location: LCCOMB_X18_Y20_N2
\rf_block|registers[9][7]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[9][7]~feeder_combout\ = \rf_block|registers~43_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rf_block|registers~43_combout\,
	combout => \rf_block|registers[9][7]~feeder_combout\);

-- Location: FF_X18_Y20_N3
\rf_block|registers[9][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[9][7]~feeder_combout\,
	asdata => \immediate[7]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[9][5]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[9][7]~q\);

-- Location: LCCOMB_X19_Y19_N8
\rf_block|rt_data~70\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rt_data~70_combout\ = (\rt_address[3]~input_o\ & (((\rt_address[2]~input_o\) # (\rf_block|registers[9][7]~q\)))) # (!\rt_address[3]~input_o\ & (\rf_block|registers[1][7]~q\ & (!\rt_address[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers[1][7]~q\,
	datab => \rt_address[3]~input_o\,
	datac => \rt_address[2]~input_o\,
	datad => \rf_block|registers[9][7]~q\,
	combout => \rf_block|rt_data~70_combout\);

-- Location: IOIBUF_X22_Y25_N8
\mem_read_data[7]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_mem_read_data(7),
	o => \mem_read_data[7]~input_o\);

-- Location: LCCOMB_X22_Y21_N10
\lsu_block|lsu_out~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \lsu_block|lsu_out~9_combout\ = (!\reset~input_o\ & \mem_read_data[7]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \reset~input_o\,
	datad => \mem_read_data[7]~input_o\,
	combout => \lsu_block|lsu_out~9_combout\);

-- Location: FF_X22_Y21_N11
\lsu_block|lsu_out[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \lsu_block|lsu_out~9_combout\,
	ena => \lsu_block|lsu_out[2]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \lsu_block|lsu_out\(7));

-- Location: LCCOMB_X19_Y22_N18
\rf_block|registers~44\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers~44_combout\ = (\rf_block|registers[13][4]~17_combout\ & (((\rf_block|registers[13][4]~16_combout\)))) # (!\rf_block|registers[13][4]~17_combout\ & ((\rf_block|registers[13][4]~16_combout\ & ((\immediate[7]~input_o\))) # 
-- (!\rf_block|registers[13][4]~16_combout\ & (\alu_block|alu_out\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \alu_block|alu_out\(7),
	datab => \rf_block|registers[13][4]~17_combout\,
	datac => \immediate[7]~input_o\,
	datad => \rf_block|registers[13][4]~16_combout\,
	combout => \rf_block|registers~44_combout\);

-- Location: IOIBUF_X10_Y22_N22
\block_id[7]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_block_id(7),
	o => \block_id[7]~input_o\);

-- Location: LCCOMB_X19_Y22_N16
\rf_block|registers~45\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers~45_combout\ = (\rf_block|registers~44_combout\ & (((\block_id[7]~input_o\) # (!\rf_block|registers[13][4]~17_combout\)))) # (!\rf_block|registers~44_combout\ & (\lsu_block|lsu_out\(7) & (\rf_block|registers[13][4]~17_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110000101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \lsu_block|lsu_out\(7),
	datab => \rf_block|registers~44_combout\,
	datac => \rf_block|registers[13][4]~17_combout\,
	datad => \block_id[7]~input_o\,
	combout => \rf_block|registers~45_combout\);

-- Location: FF_X19_Y22_N17
\rf_block|registers[13][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers~45_combout\,
	sclr => \reset~input_o\,
	ena => \rf_block|registers[13][4]~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[13][7]~q\);

-- Location: LCCOMB_X19_Y19_N18
\rf_block|rt_data~71\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rt_data~71_combout\ = (\rf_block|rt_data~70_combout\ & (((\rf_block|registers[13][7]~q\) # (!\rt_address[2]~input_o\)))) # (!\rf_block|rt_data~70_combout\ & (\rf_block|registers[5][7]~q\ & (\rt_address[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110000101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers[5][7]~q\,
	datab => \rf_block|rt_data~70_combout\,
	datac => \rt_address[2]~input_o\,
	datad => \rf_block|registers[13][7]~q\,
	combout => \rf_block|rt_data~71_combout\);

-- Location: LCCOMB_X19_Y19_N20
\rf_block|rt_data~79\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rt_data~79_combout\ = (\rf_block|rt_data~76_combout\ & (((\rf_block|rt_data~78_combout\)) # (!\rt_address[0]~input_o\))) # (!\rf_block|rt_data~76_combout\ & (\rt_address[0]~input_o\ & ((\rf_block|rt_data~71_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011010100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rt_data~76_combout\,
	datab => \rt_address[0]~input_o\,
	datac => \rf_block|rt_data~78_combout\,
	datad => \rf_block|rt_data~71_combout\,
	combout => \rf_block|rt_data~79_combout\);

-- Location: LCCOMB_X22_Y19_N16
\rf_block|rt_data[7]~SCLR_LUT\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rt_data[7]~SCLR_LUT_combout\ = (!\reset~input_o\ & \rf_block|rt_data~79_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datad => \rf_block|rt_data~79_combout\,
	combout => \rf_block|rt_data[7]~SCLR_LUT_combout\);

-- Location: LCCOMB_X20_Y21_N12
\rf_block|registers~34\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers~34_combout\ = (\reg_input_mux[0]~input_o\ & (\lsu_block|lsu_out\(4))) # (!\reg_input_mux[0]~input_o\ & ((\alu_block|alu_out\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \lsu_block|lsu_out\(4),
	datab => \alu_block|alu_out\(4),
	datad => \reg_input_mux[0]~input_o\,
	combout => \rf_block|registers~34_combout\);

-- Location: LCCOMB_X18_Y18_N6
\rf_block|registers[11][4]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[11][4]~feeder_combout\ = \rf_block|registers~34_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rf_block|registers~34_combout\,
	combout => \rf_block|registers[11][4]~feeder_combout\);

-- Location: FF_X18_Y18_N7
\rf_block|registers[11][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[11][4]~feeder_combout\,
	asdata => \immediate[4]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[11][2]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[11][4]~q\);

-- Location: LCCOMB_X16_Y20_N26
\rf_block|registers[10][4]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[10][4]~feeder_combout\ = \rf_block|registers~34_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers~34_combout\,
	combout => \rf_block|registers[10][4]~feeder_combout\);

-- Location: FF_X16_Y20_N27
\rf_block|registers[10][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[10][4]~feeder_combout\,
	asdata => \immediate[4]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[10][5]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[10][4]~q\);

-- Location: LCCOMB_X16_Y21_N10
\rf_block|registers[8][4]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[8][4]~feeder_combout\ = \rf_block|registers~34_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rf_block|registers~34_combout\,
	combout => \rf_block|registers[8][4]~feeder_combout\);

-- Location: FF_X16_Y21_N11
\rf_block|registers[8][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[8][4]~feeder_combout\,
	asdata => \immediate[4]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[8][5]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[8][4]~q\);

-- Location: LCCOMB_X18_Y20_N4
\rf_block|registers[9][4]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[9][4]~feeder_combout\ = \rf_block|registers~34_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rf_block|registers~34_combout\,
	combout => \rf_block|registers[9][4]~feeder_combout\);

-- Location: FF_X18_Y20_N5
\rf_block|registers[9][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[9][4]~feeder_combout\,
	asdata => \immediate[4]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[9][5]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[9][4]~q\);

-- Location: LCCOMB_X17_Y20_N2
\rf_block|rs_data~42\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rs_data~42_combout\ = (\rs_address[0]~input_o\ & (((\rs_address[1]~input_o\) # (\rf_block|registers[9][4]~q\)))) # (!\rs_address[0]~input_o\ & (\rf_block|registers[8][4]~q\ & (!\rs_address[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs_address[0]~input_o\,
	datab => \rf_block|registers[8][4]~q\,
	datac => \rs_address[1]~input_o\,
	datad => \rf_block|registers[9][4]~q\,
	combout => \rf_block|rs_data~42_combout\);

-- Location: LCCOMB_X17_Y20_N20
\rf_block|rs_data~43\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rs_data~43_combout\ = (\rs_address[1]~input_o\ & ((\rf_block|rs_data~42_combout\ & (\rf_block|registers[11][4]~q\)) # (!\rf_block|rs_data~42_combout\ & ((\rf_block|registers[10][4]~q\))))) # (!\rs_address[1]~input_o\ & 
-- (((\rf_block|rs_data~42_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers[11][4]~q\,
	datab => \rs_address[1]~input_o\,
	datac => \rf_block|registers[10][4]~q\,
	datad => \rf_block|rs_data~42_combout\,
	combout => \rf_block|rs_data~43_combout\);

-- Location: FF_X20_Y21_N13
\rf_block|registers[15][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers~34_combout\,
	asdata => \immediate[4]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[15][6]~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[15][4]~q\);

-- Location: LCCOMB_X19_Y20_N12
\rf_block|registers[12][4]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[12][4]~feeder_combout\ = \rf_block|registers~34_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers~34_combout\,
	combout => \rf_block|registers[12][4]~feeder_combout\);

-- Location: FF_X19_Y20_N13
\rf_block|registers[12][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[12][4]~feeder_combout\,
	asdata => \immediate[4]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[12][6]~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[12][4]~q\);

-- Location: LCCOMB_X19_Y20_N18
\rf_block|registers[14][4]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[14][4]~feeder_combout\ = \rf_block|registers~34_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers~34_combout\,
	combout => \rf_block|registers[14][4]~feeder_combout\);

-- Location: FF_X19_Y20_N19
\rf_block|registers[14][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[14][4]~feeder_combout\,
	asdata => \immediate[4]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[14][6]~21_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[14][4]~q\);

-- Location: LCCOMB_X19_Y20_N14
\rf_block|rs_data~49\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rs_data~49_combout\ = (\rs_address[1]~input_o\ & (((\rf_block|registers[14][4]~q\) # (\rs_address[0]~input_o\)))) # (!\rs_address[1]~input_o\ & (\rf_block|registers[12][4]~q\ & ((!\rs_address[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers[12][4]~q\,
	datab => \rf_block|registers[14][4]~q\,
	datac => \rs_address[1]~input_o\,
	datad => \rs_address[0]~input_o\,
	combout => \rf_block|rs_data~49_combout\);

-- Location: LCCOMB_X19_Y20_N4
\rf_block|rs_data~50\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rs_data~50_combout\ = (\rf_block|rs_data~49_combout\ & (((\rf_block|registers[15][4]~q\) # (!\rs_address[0]~input_o\)))) # (!\rf_block|rs_data~49_combout\ & (\rf_block|registers[13][4]~q\ & ((\rs_address[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers[13][4]~q\,
	datab => \rf_block|registers[15][4]~q\,
	datac => \rf_block|rs_data~49_combout\,
	datad => \rs_address[0]~input_o\,
	combout => \rf_block|rs_data~50_combout\);

-- Location: LCCOMB_X15_Y20_N10
\rf_block|registers[2][4]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[2][4]~feeder_combout\ = \rf_block|registers~34_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rf_block|registers~34_combout\,
	combout => \rf_block|registers[2][4]~feeder_combout\);

-- Location: FF_X15_Y20_N11
\rf_block|registers[2][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[2][4]~feeder_combout\,
	asdata => \immediate[4]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[2][4]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[2][4]~q\);

-- Location: LCCOMB_X16_Y21_N4
\rf_block|registers[3][4]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[3][4]~feeder_combout\ = \rf_block|registers~34_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rf_block|registers~34_combout\,
	combout => \rf_block|registers[3][4]~feeder_combout\);

-- Location: FF_X16_Y21_N5
\rf_block|registers[3][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[3][4]~feeder_combout\,
	asdata => \immediate[4]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[3][4]~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[3][4]~q\);

-- Location: LCCOMB_X17_Y18_N28
\rf_block|registers[0][4]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[0][4]~feeder_combout\ = \rf_block|registers~34_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rf_block|registers~34_combout\,
	combout => \rf_block|registers[0][4]~feeder_combout\);

-- Location: FF_X17_Y18_N29
\rf_block|registers[0][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[0][4]~feeder_combout\,
	asdata => \immediate[4]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[0][2]~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[0][4]~q\);

-- Location: LCCOMB_X18_Y18_N28
\rf_block|registers[1][4]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[1][4]~feeder_combout\ = \rf_block|registers~34_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rf_block|registers~34_combout\,
	combout => \rf_block|registers[1][4]~feeder_combout\);

-- Location: FF_X18_Y18_N29
\rf_block|registers[1][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[1][4]~feeder_combout\,
	asdata => \immediate[4]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[1][5]~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[1][4]~q\);

-- Location: LCCOMB_X17_Y20_N10
\rf_block|rs_data~46\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rs_data~46_combout\ = (\rs_address[1]~input_o\ & (((\rs_address[0]~input_o\)))) # (!\rs_address[1]~input_o\ & ((\rs_address[0]~input_o\ & ((\rf_block|registers[1][4]~q\))) # (!\rs_address[0]~input_o\ & (\rf_block|registers[0][4]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers[0][4]~q\,
	datab => \rs_address[1]~input_o\,
	datac => \rs_address[0]~input_o\,
	datad => \rf_block|registers[1][4]~q\,
	combout => \rf_block|rs_data~46_combout\);

-- Location: LCCOMB_X17_Y20_N8
\rf_block|rs_data~47\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rs_data~47_combout\ = (\rs_address[1]~input_o\ & ((\rf_block|rs_data~46_combout\ & ((\rf_block|registers[3][4]~q\))) # (!\rf_block|rs_data~46_combout\ & (\rf_block|registers[2][4]~q\)))) # (!\rs_address[1]~input_o\ & 
-- (((\rf_block|rs_data~46_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers[2][4]~q\,
	datab => \rs_address[1]~input_o\,
	datac => \rf_block|registers[3][4]~q\,
	datad => \rf_block|rs_data~46_combout\,
	combout => \rf_block|rs_data~47_combout\);

-- Location: LCCOMB_X17_Y19_N6
\rf_block|registers[5][4]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[5][4]~feeder_combout\ = \rf_block|registers~34_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers~34_combout\,
	combout => \rf_block|registers[5][4]~feeder_combout\);

-- Location: FF_X17_Y19_N7
\rf_block|registers[5][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[5][4]~feeder_combout\,
	asdata => \immediate[4]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[5][7]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[5][4]~q\);

-- Location: LCCOMB_X17_Y19_N0
\rf_block|registers[7][4]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[7][4]~feeder_combout\ = \rf_block|registers~34_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers~34_combout\,
	combout => \rf_block|registers[7][4]~feeder_combout\);

-- Location: FF_X17_Y19_N1
\rf_block|registers[7][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[7][4]~feeder_combout\,
	asdata => \immediate[4]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[7][1]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[7][4]~q\);

-- Location: LCCOMB_X15_Y20_N20
\rf_block|registers[6][4]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[6][4]~feeder_combout\ = \rf_block|registers~34_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rf_block|registers~34_combout\,
	combout => \rf_block|registers[6][4]~feeder_combout\);

-- Location: FF_X15_Y20_N21
\rf_block|registers[6][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[6][4]~feeder_combout\,
	asdata => \immediate[4]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[6][3]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[6][4]~q\);

-- Location: LCCOMB_X17_Y18_N2
\rf_block|registers[4][4]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[4][4]~feeder_combout\ = \rf_block|registers~34_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rf_block|registers~34_combout\,
	combout => \rf_block|registers[4][4]~feeder_combout\);

-- Location: FF_X17_Y18_N3
\rf_block|registers[4][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[4][4]~feeder_combout\,
	asdata => \immediate[4]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[4][4]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[4][4]~q\);

-- Location: LCCOMB_X17_Y20_N6
\rf_block|rs_data~44\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rs_data~44_combout\ = (\rs_address[1]~input_o\ & ((\rf_block|registers[6][4]~q\) # ((\rs_address[0]~input_o\)))) # (!\rs_address[1]~input_o\ & (((!\rs_address[0]~input_o\ & \rf_block|registers[4][4]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers[6][4]~q\,
	datab => \rs_address[1]~input_o\,
	datac => \rs_address[0]~input_o\,
	datad => \rf_block|registers[4][4]~q\,
	combout => \rf_block|rs_data~44_combout\);

-- Location: LCCOMB_X17_Y20_N24
\rf_block|rs_data~45\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rs_data~45_combout\ = (\rs_address[0]~input_o\ & ((\rf_block|rs_data~44_combout\ & ((\rf_block|registers[7][4]~q\))) # (!\rf_block|rs_data~44_combout\ & (\rf_block|registers[5][4]~q\)))) # (!\rs_address[0]~input_o\ & 
-- (((\rf_block|rs_data~44_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers[5][4]~q\,
	datab => \rf_block|registers[7][4]~q\,
	datac => \rs_address[0]~input_o\,
	datad => \rf_block|rs_data~44_combout\,
	combout => \rf_block|rs_data~45_combout\);

-- Location: LCCOMB_X16_Y20_N12
\rf_block|rs_data~48\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rs_data~48_combout\ = (\rs_address[3]~input_o\ & (\rs_address[2]~input_o\)) # (!\rs_address[3]~input_o\ & ((\rs_address[2]~input_o\ & ((\rf_block|rs_data~45_combout\))) # (!\rs_address[2]~input_o\ & (\rf_block|rs_data~47_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs_address[3]~input_o\,
	datab => \rs_address[2]~input_o\,
	datac => \rf_block|rs_data~47_combout\,
	datad => \rf_block|rs_data~45_combout\,
	combout => \rf_block|rs_data~48_combout\);

-- Location: LCCOMB_X19_Y20_N6
\rf_block|rs_data~51\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rs_data~51_combout\ = (\rs_address[3]~input_o\ & ((\rf_block|rs_data~48_combout\ & ((\rf_block|rs_data~50_combout\))) # (!\rf_block|rs_data~48_combout\ & (\rf_block|rs_data~43_combout\)))) # (!\rs_address[3]~input_o\ & 
-- (((\rf_block|rs_data~48_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rs_data~43_combout\,
	datab => \rs_address[3]~input_o\,
	datac => \rf_block|rs_data~50_combout\,
	datad => \rf_block|rs_data~48_combout\,
	combout => \rf_block|rs_data~51_combout\);

-- Location: LCCOMB_X20_Y19_N6
\rf_block|rs_data[4]~SCLR_LUT\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rs_data[4]~SCLR_LUT_combout\ = (!\reset~input_o\ & \rf_block|rs_data~51_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datad => \rf_block|rs_data~51_combout\,
	combout => \rf_block|rs_data[4]~SCLR_LUT_combout\);

-- Location: DSPMULT_X21_Y19_N0
\alu_block|Mult0|auto_generated|mac_mult1\ : fiftyfivenm_mac_mult
-- pragma translate_off
GENERIC MAP (
	dataa_clock => "0",
	dataa_width => 9,
	datab_clock => "0",
	datab_width => 9,
	signa_clock => "none",
	signb_clock => "none")
-- pragma translate_on
PORT MAP (
	signa => GND,
	signb => GND,
	clk => \clock~inputclkctrl_outclk\,
	aclr => GND,
	ena => \rf_block|rs_data[7]~11_combout\,
	dataa => \alu_block|Mult0|auto_generated|mac_mult1_DATAA_bus\,
	datab => \alu_block|Mult0|auto_generated|mac_mult1_DATAB_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	dataout => \alu_block|Mult0|auto_generated|mac_mult1_DATAOUT_bus\);

-- Location: DSPOUT_X21_Y19_N2
\alu_block|Mult0|auto_generated|mac_out2\ : fiftyfivenm_mac_out
-- pragma translate_off
GENERIC MAP (
	dataa_width => 18,
	output_clock => "none")
-- pragma translate_on
PORT MAP (
	dataa => \alu_block|Mult0|auto_generated|mac_out2_DATAA_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	dataout => \alu_block|Mult0|auto_generated|mac_out2_DATAOUT_bus\);

-- Location: LCCOMB_X22_Y19_N0
\alu_block|Div0|auto_generated|divider|divider|StageOut[9]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Div0|auto_generated|divider|divider|StageOut[9]~0_combout\ = (\rf_block|rs_data[3]~_Duplicate_1_q\) # ((\rf_block|rs_data[0]~_Duplicate_1_q\ & (!\rf_block|rt_data[6]~_Duplicate_1_q\ & \rf_block|rs_data[1]~_Duplicate_1_q\)) # 
-- (!\rf_block|rs_data[0]~_Duplicate_1_q\ & ((!\rf_block|rs_data[1]~_Duplicate_1_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111011011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rs_data[0]~_Duplicate_1_q\,
	datab => \rf_block|rs_data[3]~_Duplicate_1_q\,
	datac => \rf_block|rt_data[6]~_Duplicate_1_q\,
	datad => \rf_block|rs_data[1]~_Duplicate_1_q\,
	combout => \alu_block|Div0|auto_generated|divider|divider|StageOut[9]~0_combout\);

-- Location: FF_X22_Y19_N19
\rf_block|rt_data[7]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	asdata => \rf_block|rt_data[7]~SCLR_LUT_combout\,
	sload => VCC,
	ena => \rf_block|rs_data[7]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|rt_data[7]~_Duplicate_1_q\);

-- Location: FF_X22_Y19_N29
\rf_block|rs_data[4]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	asdata => \rf_block|rs_data[4]~SCLR_LUT_combout\,
	sload => VCC,
	ena => \rf_block|rs_data[7]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|rs_data[4]~_Duplicate_1_q\);

-- Location: LCCOMB_X22_Y19_N12
\alu_block|Div0|auto_generated|divider|divider|selnose[27]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Div0|auto_generated|divider|divider|selnose[27]~0_combout\ = (!\rf_block|rs_data[5]~_Duplicate_1_q\ & (!\rf_block|rs_data[4]~_Duplicate_1_q\ & (!\rf_block|rs_data[7]~_Duplicate_1_q\ & !\rf_block|rs_data[6]~_Duplicate_1_q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rs_data[5]~_Duplicate_1_q\,
	datab => \rf_block|rs_data[4]~_Duplicate_1_q\,
	datac => \rf_block|rs_data[7]~_Duplicate_1_q\,
	datad => \rf_block|rs_data[6]~_Duplicate_1_q\,
	combout => \alu_block|Div0|auto_generated|divider|divider|selnose[27]~0_combout\);

-- Location: LCCOMB_X22_Y19_N18
\alu_block|Div0|auto_generated|divider|divider|StageOut[9]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Div0|auto_generated|divider|divider|StageOut[9]~1_combout\ = (\rf_block|rt_data[7]~_Duplicate_1_q\ & ((\rf_block|rs_data[2]~_Duplicate_1_q\) # ((\alu_block|Div0|auto_generated|divider|divider|StageOut[9]~0_combout\) # 
-- (!\alu_block|Div0|auto_generated|divider|divider|selnose[27]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rs_data[2]~_Duplicate_1_q\,
	datab => \alu_block|Div0|auto_generated|divider|divider|StageOut[9]~0_combout\,
	datac => \rf_block|rt_data[7]~_Duplicate_1_q\,
	datad => \alu_block|Div0|auto_generated|divider|divider|selnose[27]~0_combout\,
	combout => \alu_block|Div0|auto_generated|divider|divider|StageOut[9]~1_combout\);

-- Location: LCCOMB_X22_Y19_N6
\alu_block|Div0|auto_generated|divider|divider|StageOut[8]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Div0|auto_generated|divider|divider|StageOut[8]~2_combout\ = (\rf_block|rs_data[3]~_Duplicate_1_q\) # ((\rf_block|rs_data[2]~_Duplicate_1_q\) # ((\rf_block|rs_data[1]~_Duplicate_1_q\ & !\rf_block|rt_data[7]~_Duplicate_1_q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rs_data[1]~_Duplicate_1_q\,
	datab => \rf_block|rt_data[7]~_Duplicate_1_q\,
	datac => \rf_block|rs_data[3]~_Duplicate_1_q\,
	datad => \rf_block|rs_data[2]~_Duplicate_1_q\,
	combout => \alu_block|Div0|auto_generated|divider|divider|StageOut[8]~2_combout\);

-- Location: LCCOMB_X22_Y19_N8
\alu_block|Div0|auto_generated|divider|divider|StageOut[8]~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Div0|auto_generated|divider|divider|StageOut[8]~3_combout\ = (\rf_block|rt_data[6]~_Duplicate_1_q\ & ((\alu_block|Div0|auto_generated|divider|divider|StageOut[8]~2_combout\) # 
-- ((!\alu_block|Div0|auto_generated|divider|divider|selnose[27]~0_combout\) # (!\rf_block|rs_data[0]~_Duplicate_1_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \alu_block|Div0|auto_generated|divider|divider|StageOut[8]~2_combout\,
	datab => \rf_block|rt_data[6]~_Duplicate_1_q\,
	datac => \rf_block|rs_data[0]~_Duplicate_1_q\,
	datad => \alu_block|Div0|auto_generated|divider|divider|selnose[27]~0_combout\,
	combout => \alu_block|Div0|auto_generated|divider|divider|StageOut[8]~3_combout\);

-- Location: FF_X22_Y19_N3
\rf_block|rt_data[5]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	asdata => \rf_block|rt_data[5]~SCLR_LUT_combout\,
	sload => VCC,
	ena => \rf_block|rs_data[7]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|rt_data[5]~_Duplicate_1_q\);

-- Location: LCCOMB_X22_Y19_N20
\alu_block|Div0|auto_generated|divider|divider|add_sub_2_result_int[0]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Div0|auto_generated|divider|divider|add_sub_2_result_int[0]~0_combout\ = (\rf_block|rs_data[0]~_Duplicate_1_q\ & (\rf_block|rt_data[5]~_Duplicate_1_q\ $ (VCC))) # (!\rf_block|rs_data[0]~_Duplicate_1_q\ & ((\rf_block|rt_data[5]~_Duplicate_1_q\) 
-- # (GND)))
-- \alu_block|Div0|auto_generated|divider|divider|add_sub_2_result_int[0]~1\ = CARRY((\rf_block|rt_data[5]~_Duplicate_1_q\) # (!\rf_block|rs_data[0]~_Duplicate_1_q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011011011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rs_data[0]~_Duplicate_1_q\,
	datab => \rf_block|rt_data[5]~_Duplicate_1_q\,
	datad => VCC,
	combout => \alu_block|Div0|auto_generated|divider|divider|add_sub_2_result_int[0]~0_combout\,
	cout => \alu_block|Div0|auto_generated|divider|divider|add_sub_2_result_int[0]~1\);

-- Location: LCCOMB_X22_Y19_N22
\alu_block|Div0|auto_generated|divider|divider|add_sub_2_result_int[1]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Div0|auto_generated|divider|divider|add_sub_2_result_int[1]~2_combout\ = (\rf_block|rs_data[1]~_Duplicate_1_q\ & ((\alu_block|Div0|auto_generated|divider|divider|StageOut[8]~3_combout\ & 
-- (!\alu_block|Div0|auto_generated|divider|divider|add_sub_2_result_int[0]~1\)) # (!\alu_block|Div0|auto_generated|divider|divider|StageOut[8]~3_combout\ & ((\alu_block|Div0|auto_generated|divider|divider|add_sub_2_result_int[0]~1\) # (GND))))) # 
-- (!\rf_block|rs_data[1]~_Duplicate_1_q\ & ((\alu_block|Div0|auto_generated|divider|divider|StageOut[8]~3_combout\ & (\alu_block|Div0|auto_generated|divider|divider|add_sub_2_result_int[0]~1\ & VCC)) # 
-- (!\alu_block|Div0|auto_generated|divider|divider|StageOut[8]~3_combout\ & (!\alu_block|Div0|auto_generated|divider|divider|add_sub_2_result_int[0]~1\))))
-- \alu_block|Div0|auto_generated|divider|divider|add_sub_2_result_int[1]~3\ = CARRY((\rf_block|rs_data[1]~_Duplicate_1_q\ & ((!\alu_block|Div0|auto_generated|divider|divider|add_sub_2_result_int[0]~1\) # 
-- (!\alu_block|Div0|auto_generated|divider|divider|StageOut[8]~3_combout\))) # (!\rf_block|rs_data[1]~_Duplicate_1_q\ & (!\alu_block|Div0|auto_generated|divider|divider|StageOut[8]~3_combout\ & 
-- !\alu_block|Div0|auto_generated|divider|divider|add_sub_2_result_int[0]~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rs_data[1]~_Duplicate_1_q\,
	datab => \alu_block|Div0|auto_generated|divider|divider|StageOut[8]~3_combout\,
	datad => VCC,
	cin => \alu_block|Div0|auto_generated|divider|divider|add_sub_2_result_int[0]~1\,
	combout => \alu_block|Div0|auto_generated|divider|divider|add_sub_2_result_int[1]~2_combout\,
	cout => \alu_block|Div0|auto_generated|divider|divider|add_sub_2_result_int[1]~3\);

-- Location: LCCOMB_X22_Y19_N24
\alu_block|Div0|auto_generated|divider|divider|add_sub_2_result_int[2]~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Div0|auto_generated|divider|divider|add_sub_2_result_int[2]~4_combout\ = ((\alu_block|Div0|auto_generated|divider|divider|StageOut[9]~1_combout\ $ (\rf_block|rs_data[2]~_Duplicate_1_q\ $ 
-- (\alu_block|Div0|auto_generated|divider|divider|add_sub_2_result_int[1]~3\)))) # (GND)
-- \alu_block|Div0|auto_generated|divider|divider|add_sub_2_result_int[2]~5\ = CARRY((\alu_block|Div0|auto_generated|divider|divider|StageOut[9]~1_combout\ & ((!\alu_block|Div0|auto_generated|divider|divider|add_sub_2_result_int[1]~3\) # 
-- (!\rf_block|rs_data[2]~_Duplicate_1_q\))) # (!\alu_block|Div0|auto_generated|divider|divider|StageOut[9]~1_combout\ & (!\rf_block|rs_data[2]~_Duplicate_1_q\ & !\alu_block|Div0|auto_generated|divider|divider|add_sub_2_result_int[1]~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \alu_block|Div0|auto_generated|divider|divider|StageOut[9]~1_combout\,
	datab => \rf_block|rs_data[2]~_Duplicate_1_q\,
	datad => VCC,
	cin => \alu_block|Div0|auto_generated|divider|divider|add_sub_2_result_int[1]~3\,
	combout => \alu_block|Div0|auto_generated|divider|divider|add_sub_2_result_int[2]~4_combout\,
	cout => \alu_block|Div0|auto_generated|divider|divider|add_sub_2_result_int[2]~5\);

-- Location: LCCOMB_X22_Y19_N28
\alu_block|Add0~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Add0~6_combout\ = (!\rf_block|rs_data[3]~_Duplicate_1_q\ & \alu_block|Div0|auto_generated|divider|divider|selnose[27]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \rf_block|rs_data[3]~_Duplicate_1_q\,
	datad => \alu_block|Div0|auto_generated|divider|divider|selnose[27]~0_combout\,
	combout => \alu_block|Add0~6_combout\);

-- Location: LCCOMB_X22_Y19_N26
\alu_block|Div0|auto_generated|divider|divider|add_sub_2_result_int[3]~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Div0|auto_generated|divider|divider|add_sub_2_result_int[3]~6_combout\ = !\alu_block|Div0|auto_generated|divider|divider|add_sub_2_result_int[2]~5\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \alu_block|Div0|auto_generated|divider|divider|add_sub_2_result_int[2]~5\,
	combout => \alu_block|Div0|auto_generated|divider|divider|add_sub_2_result_int[3]~6_combout\);

-- Location: LCCOMB_X22_Y19_N4
\alu_block|Div0|auto_generated|divider|divider|StageOut[18]~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Div0|auto_generated|divider|divider|StageOut[18]~4_combout\ = (\alu_block|Add0~6_combout\ & ((\alu_block|Div0|auto_generated|divider|divider|add_sub_2_result_int[3]~6_combout\ & 
-- (\alu_block|Div0|auto_generated|divider|divider|StageOut[9]~1_combout\)) # (!\alu_block|Div0|auto_generated|divider|divider|add_sub_2_result_int[3]~6_combout\ & ((\alu_block|Div0|auto_generated|divider|divider|add_sub_2_result_int[2]~4_combout\))))) # 
-- (!\alu_block|Add0~6_combout\ & (\alu_block|Div0|auto_generated|divider|divider|StageOut[9]~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \alu_block|Div0|auto_generated|divider|divider|StageOut[9]~1_combout\,
	datab => \alu_block|Div0|auto_generated|divider|divider|add_sub_2_result_int[2]~4_combout\,
	datac => \alu_block|Add0~6_combout\,
	datad => \alu_block|Div0|auto_generated|divider|divider|add_sub_2_result_int[3]~6_combout\,
	combout => \alu_block|Div0|auto_generated|divider|divider|StageOut[18]~4_combout\);

-- Location: LCCOMB_X22_Y19_N14
\alu_block|Div0|auto_generated|divider|divider|StageOut[17]~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Div0|auto_generated|divider|divider|StageOut[17]~5_combout\ = (\alu_block|Add0~6_combout\ & ((\alu_block|Div0|auto_generated|divider|divider|add_sub_2_result_int[3]~6_combout\ & 
-- (\alu_block|Div0|auto_generated|divider|divider|StageOut[8]~3_combout\)) # (!\alu_block|Div0|auto_generated|divider|divider|add_sub_2_result_int[3]~6_combout\ & ((\alu_block|Div0|auto_generated|divider|divider|add_sub_2_result_int[1]~2_combout\))))) # 
-- (!\alu_block|Add0~6_combout\ & (\alu_block|Div0|auto_generated|divider|divider|StageOut[8]~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \alu_block|Add0~6_combout\,
	datab => \alu_block|Div0|auto_generated|divider|divider|StageOut[8]~3_combout\,
	datac => \alu_block|Div0|auto_generated|divider|divider|add_sub_2_result_int[1]~2_combout\,
	datad => \alu_block|Div0|auto_generated|divider|divider|add_sub_2_result_int[3]~6_combout\,
	combout => \alu_block|Div0|auto_generated|divider|divider|StageOut[17]~5_combout\);

-- Location: LCCOMB_X22_Y19_N2
\alu_block|Div0|auto_generated|divider|divider|StageOut[16]~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Div0|auto_generated|divider|divider|StageOut[16]~6_combout\ = (\alu_block|Add0~6_combout\ & ((\alu_block|Div0|auto_generated|divider|divider|add_sub_2_result_int[3]~6_combout\ & ((\rf_block|rt_data[5]~_Duplicate_1_q\))) # 
-- (!\alu_block|Div0|auto_generated|divider|divider|add_sub_2_result_int[3]~6_combout\ & (\alu_block|Div0|auto_generated|divider|divider|add_sub_2_result_int[0]~0_combout\)))) # (!\alu_block|Add0~6_combout\ & (((\rf_block|rt_data[5]~_Duplicate_1_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \alu_block|Add0~6_combout\,
	datab => \alu_block|Div0|auto_generated|divider|divider|add_sub_2_result_int[0]~0_combout\,
	datac => \rf_block|rt_data[5]~_Duplicate_1_q\,
	datad => \alu_block|Div0|auto_generated|divider|divider|add_sub_2_result_int[3]~6_combout\,
	combout => \alu_block|Div0|auto_generated|divider|divider|StageOut[16]~6_combout\);

-- Location: FF_X22_Y19_N21
\rf_block|rt_data[4]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	asdata => \rf_block|rt_data[4]~SCLR_LUT_combout\,
	sload => VCC,
	ena => \rf_block|rs_data[7]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|rt_data[4]~_Duplicate_1_q\);

-- Location: LCCOMB_X23_Y19_N18
\alu_block|Div0|auto_generated|divider|divider|add_sub_3_result_int[0]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Div0|auto_generated|divider|divider|add_sub_3_result_int[0]~0_combout\ = (\rf_block|rs_data[0]~_Duplicate_1_q\ & (\rf_block|rt_data[4]~_Duplicate_1_q\ $ (VCC))) # (!\rf_block|rs_data[0]~_Duplicate_1_q\ & ((\rf_block|rt_data[4]~_Duplicate_1_q\) 
-- # (GND)))
-- \alu_block|Div0|auto_generated|divider|divider|add_sub_3_result_int[0]~1\ = CARRY((\rf_block|rt_data[4]~_Duplicate_1_q\) # (!\rf_block|rs_data[0]~_Duplicate_1_q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011011011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rs_data[0]~_Duplicate_1_q\,
	datab => \rf_block|rt_data[4]~_Duplicate_1_q\,
	datad => VCC,
	combout => \alu_block|Div0|auto_generated|divider|divider|add_sub_3_result_int[0]~0_combout\,
	cout => \alu_block|Div0|auto_generated|divider|divider|add_sub_3_result_int[0]~1\);

-- Location: LCCOMB_X23_Y19_N20
\alu_block|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~2_combout\ = (\alu_block|Div0|auto_generated|divider|divider|StageOut[16]~6_combout\ & ((\rf_block|rs_data[1]~_Duplicate_1_q\ & 
-- (!\alu_block|Div0|auto_generated|divider|divider|add_sub_3_result_int[0]~1\)) # (!\rf_block|rs_data[1]~_Duplicate_1_q\ & (\alu_block|Div0|auto_generated|divider|divider|add_sub_3_result_int[0]~1\ & VCC)))) # 
-- (!\alu_block|Div0|auto_generated|divider|divider|StageOut[16]~6_combout\ & ((\rf_block|rs_data[1]~_Duplicate_1_q\ & ((\alu_block|Div0|auto_generated|divider|divider|add_sub_3_result_int[0]~1\) # (GND))) # (!\rf_block|rs_data[1]~_Duplicate_1_q\ & 
-- (!\alu_block|Div0|auto_generated|divider|divider|add_sub_3_result_int[0]~1\))))
-- \alu_block|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~3\ = CARRY((\alu_block|Div0|auto_generated|divider|divider|StageOut[16]~6_combout\ & (\rf_block|rs_data[1]~_Duplicate_1_q\ & 
-- !\alu_block|Div0|auto_generated|divider|divider|add_sub_3_result_int[0]~1\)) # (!\alu_block|Div0|auto_generated|divider|divider|StageOut[16]~6_combout\ & ((\rf_block|rs_data[1]~_Duplicate_1_q\) # 
-- (!\alu_block|Div0|auto_generated|divider|divider|add_sub_3_result_int[0]~1\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \alu_block|Div0|auto_generated|divider|divider|StageOut[16]~6_combout\,
	datab => \rf_block|rs_data[1]~_Duplicate_1_q\,
	datad => VCC,
	cin => \alu_block|Div0|auto_generated|divider|divider|add_sub_3_result_int[0]~1\,
	combout => \alu_block|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~2_combout\,
	cout => \alu_block|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~3\);

-- Location: LCCOMB_X23_Y19_N22
\alu_block|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~4_combout\ = ((\alu_block|Div0|auto_generated|divider|divider|StageOut[17]~5_combout\ $ (\rf_block|rs_data[2]~_Duplicate_1_q\ $ 
-- (\alu_block|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~3\)))) # (GND)
-- \alu_block|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~5\ = CARRY((\alu_block|Div0|auto_generated|divider|divider|StageOut[17]~5_combout\ & ((!\alu_block|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~3\) # 
-- (!\rf_block|rs_data[2]~_Duplicate_1_q\))) # (!\alu_block|Div0|auto_generated|divider|divider|StageOut[17]~5_combout\ & (!\rf_block|rs_data[2]~_Duplicate_1_q\ & !\alu_block|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \alu_block|Div0|auto_generated|divider|divider|StageOut[17]~5_combout\,
	datab => \rf_block|rs_data[2]~_Duplicate_1_q\,
	datad => VCC,
	cin => \alu_block|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~3\,
	combout => \alu_block|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~4_combout\,
	cout => \alu_block|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~5\);

-- Location: LCCOMB_X23_Y19_N24
\alu_block|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~6_combout\ = (\rf_block|rs_data[3]~_Duplicate_1_q\ & ((\alu_block|Div0|auto_generated|divider|divider|StageOut[18]~4_combout\ & 
-- (!\alu_block|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~5\)) # (!\alu_block|Div0|auto_generated|divider|divider|StageOut[18]~4_combout\ & ((\alu_block|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~5\) # (GND))))) # 
-- (!\rf_block|rs_data[3]~_Duplicate_1_q\ & ((\alu_block|Div0|auto_generated|divider|divider|StageOut[18]~4_combout\ & (\alu_block|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~5\ & VCC)) # 
-- (!\alu_block|Div0|auto_generated|divider|divider|StageOut[18]~4_combout\ & (!\alu_block|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~5\))))
-- \alu_block|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~7\ = CARRY((\rf_block|rs_data[3]~_Duplicate_1_q\ & ((!\alu_block|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~5\) # 
-- (!\alu_block|Div0|auto_generated|divider|divider|StageOut[18]~4_combout\))) # (!\rf_block|rs_data[3]~_Duplicate_1_q\ & (!\alu_block|Div0|auto_generated|divider|divider|StageOut[18]~4_combout\ & 
-- !\alu_block|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rs_data[3]~_Duplicate_1_q\,
	datab => \alu_block|Div0|auto_generated|divider|divider|StageOut[18]~4_combout\,
	datad => VCC,
	cin => \alu_block|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~5\,
	combout => \alu_block|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~6_combout\,
	cout => \alu_block|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~7\);

-- Location: LCCOMB_X23_Y19_N26
\alu_block|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~8_combout\ = \alu_block|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~7\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \alu_block|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~7\,
	combout => \alu_block|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~8_combout\);

-- Location: LCCOMB_X24_Y19_N14
\alu_block|Add0~23\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Add0~23_combout\ = (\alu_select[0]~input_o\ & (((!\alu_block|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~8_combout\ & \alu_block|Div0|auto_generated|divider|divider|selnose[27]~0_combout\)))) # (!\alu_select[0]~input_o\ & 
-- (\alu_block|Mult0|auto_generated|mac_out2~DATAOUT4\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \alu_block|Mult0|auto_generated|mac_out2~DATAOUT4\,
	datab => \alu_select[0]~input_o\,
	datac => \alu_block|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~8_combout\,
	datad => \alu_block|Div0|auto_generated|divider|divider|selnose[27]~0_combout\,
	combout => \alu_block|Add0~23_combout\);

-- Location: LCCOMB_X25_Y19_N28
\alu_block|Add0~24\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Add0~24_combout\ = \rf_block|rs_data[4]~_Duplicate_1_q\ $ (((\alu_select[0]~input_o\) # (\alu_select[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \alu_select[0]~input_o\,
	datac => \alu_select[1]~input_o\,
	datad => \rf_block|rs_data[4]~_Duplicate_1_q\,
	combout => \alu_block|Add0~24_combout\);

-- Location: LCCOMB_X25_Y19_N14
\alu_block|Add0~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Add0~20_combout\ = ((\rf_block|rt_data[3]~_Duplicate_1_q\ $ (\alu_block|Add0~19_combout\ $ (!\alu_block|Add0~16\)))) # (GND)
-- \alu_block|Add0~21\ = CARRY((\rf_block|rt_data[3]~_Duplicate_1_q\ & ((\alu_block|Add0~19_combout\) # (!\alu_block|Add0~16\))) # (!\rf_block|rt_data[3]~_Duplicate_1_q\ & (\alu_block|Add0~19_combout\ & !\alu_block|Add0~16\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rt_data[3]~_Duplicate_1_q\,
	datab => \alu_block|Add0~19_combout\,
	datad => VCC,
	cin => \alu_block|Add0~16\,
	combout => \alu_block|Add0~20_combout\,
	cout => \alu_block|Add0~21\);

-- Location: LCCOMB_X25_Y19_N16
\alu_block|Add0~25\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Add0~25_combout\ = (\alu_block|Add0~24_combout\ & ((\rf_block|rt_data[4]~_Duplicate_1_q\ & (\alu_block|Add0~21\ & VCC)) # (!\rf_block|rt_data[4]~_Duplicate_1_q\ & (!\alu_block|Add0~21\)))) # (!\alu_block|Add0~24_combout\ & 
-- ((\rf_block|rt_data[4]~_Duplicate_1_q\ & (!\alu_block|Add0~21\)) # (!\rf_block|rt_data[4]~_Duplicate_1_q\ & ((\alu_block|Add0~21\) # (GND)))))
-- \alu_block|Add0~26\ = CARRY((\alu_block|Add0~24_combout\ & (!\rf_block|rt_data[4]~_Duplicate_1_q\ & !\alu_block|Add0~21\)) # (!\alu_block|Add0~24_combout\ & ((!\alu_block|Add0~21\) # (!\rf_block|rt_data[4]~_Duplicate_1_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \alu_block|Add0~24_combout\,
	datab => \rf_block|rt_data[4]~_Duplicate_1_q\,
	datad => VCC,
	cin => \alu_block|Add0~21\,
	combout => \alu_block|Add0~25_combout\,
	cout => \alu_block|Add0~26\);

-- Location: LCCOMB_X24_Y19_N2
\alu_block|Add0~27\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Add0~27_combout\ = (\alu_select[1]~input_o\ & (\alu_block|Add0~23_combout\)) # (!\alu_select[1]~input_o\ & ((\alu_block|Add0~25_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \alu_select[1]~input_o\,
	datac => \alu_block|Add0~23_combout\,
	datad => \alu_block|Add0~25_combout\,
	combout => \alu_block|Add0~27_combout\);

-- Location: LCCOMB_X24_Y21_N28
\pc_nzp_block|new_pc[7]~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \pc_nzp_block|new_pc[7]~3_combout\ = (((\core_state[1]~input_o\) # (!\core_state[0]~input_o\)) # (!\enable~input_o\)) # (!\core_state[2]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \core_state[2]~input_o\,
	datab => \enable~input_o\,
	datac => \core_state[0]~input_o\,
	datad => \core_state[1]~input_o\,
	combout => \pc_nzp_block|new_pc[7]~3_combout\);

-- Location: LCCOMB_X24_Y21_N2
\pc_nzp_block|new_pc[7]~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \pc_nzp_block|new_pc[7]~4_combout\ = (\reset~input_o\) # (!\pc_nzp_block|new_pc[7]~3_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \reset~input_o\,
	datad => \pc_nzp_block|new_pc[7]~3_combout\,
	combout => \pc_nzp_block|new_pc[7]~4_combout\);

-- Location: FF_X24_Y19_N3
\alu_block|alu_out[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \alu_block|Add0~27_combout\,
	sclr => \reset~input_o\,
	ena => \pc_nzp_block|new_pc[7]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \alu_block|alu_out\(4));

-- Location: LCCOMB_X20_Y21_N24
\rf_block|registers~35\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers~35_combout\ = (\rf_block|registers[13][4]~16_combout\ & (((\rf_block|registers[13][4]~17_combout\)))) # (!\rf_block|registers[13][4]~16_combout\ & ((\rf_block|registers[13][4]~17_combout\ & (\lsu_block|lsu_out\(4))) # 
-- (!\rf_block|registers[13][4]~17_combout\ & ((\alu_block|alu_out\(4))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \lsu_block|lsu_out\(4),
	datab => \rf_block|registers[13][4]~16_combout\,
	datac => \alu_block|alu_out\(4),
	datad => \rf_block|registers[13][4]~17_combout\,
	combout => \rf_block|registers~35_combout\);

-- Location: LCCOMB_X19_Y21_N20
\rf_block|registers~36\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers~36_combout\ = (\rf_block|registers~35_combout\ & (((\block_id[4]~input_o\) # (!\rf_block|registers[13][4]~16_combout\)))) # (!\rf_block|registers~35_combout\ & (\immediate[4]~input_o\ & ((\rf_block|registers[13][4]~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \immediate[4]~input_o\,
	datab => \block_id[4]~input_o\,
	datac => \rf_block|registers~35_combout\,
	datad => \rf_block|registers[13][4]~16_combout\,
	combout => \rf_block|registers~36_combout\);

-- Location: FF_X19_Y21_N21
\rf_block|registers[13][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers~36_combout\,
	sclr => \reset~input_o\,
	ena => \rf_block|registers[13][4]~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[13][4]~q\);

-- Location: LCCOMB_X19_Y20_N22
\rf_block|rt_data~47\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rt_data~47_combout\ = (\rt_address[0]~input_o\ & (((\rt_address[1]~input_o\)))) # (!\rt_address[0]~input_o\ & ((\rt_address[1]~input_o\ & ((\rf_block|registers[14][4]~q\))) # (!\rt_address[1]~input_o\ & (\rf_block|registers[12][4]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers[12][4]~q\,
	datab => \rt_address[0]~input_o\,
	datac => \rt_address[1]~input_o\,
	datad => \rf_block|registers[14][4]~q\,
	combout => \rf_block|rt_data~47_combout\);

-- Location: LCCOMB_X19_Y20_N16
\rf_block|rt_data~48\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rt_data~48_combout\ = (\rt_address[0]~input_o\ & ((\rf_block|rt_data~47_combout\ & ((\rf_block|registers[15][4]~q\))) # (!\rf_block|rt_data~47_combout\ & (\rf_block|registers[13][4]~q\)))) # (!\rt_address[0]~input_o\ & 
-- (((\rf_block|rt_data~47_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100000111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers[13][4]~q\,
	datab => \rt_address[0]~input_o\,
	datac => \rf_block|rt_data~47_combout\,
	datad => \rf_block|registers[15][4]~q\,
	combout => \rf_block|rt_data~48_combout\);

-- Location: LCCOMB_X17_Y20_N0
\rf_block|rt_data~40\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rt_data~40_combout\ = (\rt_address[1]~input_o\ & (((\rt_address[0]~input_o\)))) # (!\rt_address[1]~input_o\ & ((\rt_address[0]~input_o\ & (\rf_block|registers[9][4]~q\)) # (!\rt_address[0]~input_o\ & ((\rf_block|registers[8][4]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers[9][4]~q\,
	datab => \rf_block|registers[8][4]~q\,
	datac => \rt_address[1]~input_o\,
	datad => \rt_address[0]~input_o\,
	combout => \rf_block|rt_data~40_combout\);

-- Location: LCCOMB_X17_Y20_N22
\rf_block|rt_data~41\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rt_data~41_combout\ = (\rf_block|rt_data~40_combout\ & (((\rf_block|registers[11][4]~q\) # (!\rt_address[1]~input_o\)))) # (!\rf_block|rt_data~40_combout\ & (\rf_block|registers[10][4]~q\ & (\rt_address[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110000101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers[10][4]~q\,
	datab => \rf_block|rt_data~40_combout\,
	datac => \rt_address[1]~input_o\,
	datad => \rf_block|registers[11][4]~q\,
	combout => \rf_block|rt_data~41_combout\);

-- Location: LCCOMB_X17_Y20_N4
\rf_block|rt_data~42\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rt_data~42_combout\ = (\rt_address[0]~input_o\ & (((\rt_address[1]~input_o\)))) # (!\rt_address[0]~input_o\ & ((\rt_address[1]~input_o\ & (\rf_block|registers[6][4]~q\)) # (!\rt_address[1]~input_o\ & ((\rf_block|registers[4][4]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers[6][4]~q\,
	datab => \rt_address[0]~input_o\,
	datac => \rt_address[1]~input_o\,
	datad => \rf_block|registers[4][4]~q\,
	combout => \rf_block|rt_data~42_combout\);

-- Location: LCCOMB_X17_Y20_N26
\rf_block|rt_data~43\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rt_data~43_combout\ = (\rf_block|rt_data~42_combout\ & (((\rf_block|registers[7][4]~q\) # (!\rt_address[0]~input_o\)))) # (!\rf_block|rt_data~42_combout\ & (\rf_block|registers[5][4]~q\ & ((\rt_address[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers[5][4]~q\,
	datab => \rf_block|registers[7][4]~q\,
	datac => \rf_block|rt_data~42_combout\,
	datad => \rt_address[0]~input_o\,
	combout => \rf_block|rt_data~43_combout\);

-- Location: LCCOMB_X17_Y20_N28
\rf_block|rt_data~44\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rt_data~44_combout\ = (\rt_address[0]~input_o\ & (((\rt_address[1]~input_o\) # (\rf_block|registers[1][4]~q\)))) # (!\rt_address[0]~input_o\ & (\rf_block|registers[0][4]~q\ & (!\rt_address[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers[0][4]~q\,
	datab => \rt_address[0]~input_o\,
	datac => \rt_address[1]~input_o\,
	datad => \rf_block|registers[1][4]~q\,
	combout => \rf_block|rt_data~44_combout\);

-- Location: LCCOMB_X17_Y20_N18
\rf_block|rt_data~45\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rt_data~45_combout\ = (\rf_block|rt_data~44_combout\ & ((\rf_block|registers[3][4]~q\) # ((!\rt_address[1]~input_o\)))) # (!\rf_block|rt_data~44_combout\ & (((\rt_address[1]~input_o\ & \rf_block|registers[2][4]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011110010001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers[3][4]~q\,
	datab => \rf_block|rt_data~44_combout\,
	datac => \rt_address[1]~input_o\,
	datad => \rf_block|registers[2][4]~q\,
	combout => \rf_block|rt_data~45_combout\);

-- Location: LCCOMB_X20_Y20_N28
\rf_block|rt_data~46\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rt_data~46_combout\ = (\rt_address[3]~input_o\ & (((\rt_address[2]~input_o\)))) # (!\rt_address[3]~input_o\ & ((\rt_address[2]~input_o\ & (\rf_block|rt_data~43_combout\)) # (!\rt_address[2]~input_o\ & ((\rf_block|rt_data~45_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rt_data~43_combout\,
	datab => \rt_address[3]~input_o\,
	datac => \rt_address[2]~input_o\,
	datad => \rf_block|rt_data~45_combout\,
	combout => \rf_block|rt_data~46_combout\);

-- Location: LCCOMB_X20_Y20_N30
\rf_block|rt_data~49\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rt_data~49_combout\ = (\rt_address[3]~input_o\ & ((\rf_block|rt_data~46_combout\ & (\rf_block|rt_data~48_combout\)) # (!\rf_block|rt_data~46_combout\ & ((\rf_block|rt_data~41_combout\))))) # (!\rt_address[3]~input_o\ & 
-- (((\rf_block|rt_data~46_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rt_data~48_combout\,
	datab => \rt_address[3]~input_o\,
	datac => \rf_block|rt_data~41_combout\,
	datad => \rf_block|rt_data~46_combout\,
	combout => \rf_block|rt_data~49_combout\);

-- Location: LCCOMB_X20_Y19_N22
\rf_block|rt_data[4]~SCLR_LUT\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rt_data[4]~SCLR_LUT_combout\ = (\rf_block|rt_data~49_combout\ & !\reset~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \rf_block|rt_data~49_combout\,
	datad => \reset~input_o\,
	combout => \rf_block|rt_data[4]~SCLR_LUT_combout\);

-- Location: LCCOMB_X24_Y19_N4
\alu_block|Add0~28\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Add0~28_combout\ = (\alu_select[0]~input_o\ & (((!\alu_block|Div0|auto_generated|divider|divider|add_sub_2_result_int[3]~6_combout\ & \alu_block|Add0~6_combout\)))) # (!\alu_select[0]~input_o\ & 
-- (\alu_block|Mult0|auto_generated|mac_out2~DATAOUT5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \alu_block|Mult0|auto_generated|mac_out2~DATAOUT5\,
	datab => \alu_select[0]~input_o\,
	datac => \alu_block|Div0|auto_generated|divider|divider|add_sub_2_result_int[3]~6_combout\,
	datad => \alu_block|Add0~6_combout\,
	combout => \alu_block|Add0~28_combout\);

-- Location: LCCOMB_X25_Y19_N18
\alu_block|Add0~30\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Add0~30_combout\ = ((\alu_block|Add0~29_combout\ $ (\rf_block|rt_data[5]~_Duplicate_1_q\ $ (!\alu_block|Add0~26\)))) # (GND)
-- \alu_block|Add0~31\ = CARRY((\alu_block|Add0~29_combout\ & ((\rf_block|rt_data[5]~_Duplicate_1_q\) # (!\alu_block|Add0~26\))) # (!\alu_block|Add0~29_combout\ & (\rf_block|rt_data[5]~_Duplicate_1_q\ & !\alu_block|Add0~26\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \alu_block|Add0~29_combout\,
	datab => \rf_block|rt_data[5]~_Duplicate_1_q\,
	datad => VCC,
	cin => \alu_block|Add0~26\,
	combout => \alu_block|Add0~30_combout\,
	cout => \alu_block|Add0~31\);

-- Location: LCCOMB_X24_Y19_N8
\alu_block|Add0~32\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Add0~32_combout\ = (\alu_select[1]~input_o\ & (\alu_block|Add0~28_combout\)) # (!\alu_select[1]~input_o\ & ((\alu_block|Add0~30_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \alu_select[1]~input_o\,
	datac => \alu_block|Add0~28_combout\,
	datad => \alu_block|Add0~30_combout\,
	combout => \alu_block|Add0~32_combout\);

-- Location: FF_X24_Y19_N9
\alu_block|alu_out[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \alu_block|Add0~32_combout\,
	sclr => \reset~input_o\,
	ena => \pc_nzp_block|new_pc[7]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \alu_block|alu_out\(5));

-- Location: LCCOMB_X20_Y21_N22
\rf_block|registers~37\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers~37_combout\ = (\reg_input_mux[0]~input_o\ & (\lsu_block|lsu_out\(5))) # (!\reg_input_mux[0]~input_o\ & ((\alu_block|alu_out\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \lsu_block|lsu_out\(5),
	datab => \alu_block|alu_out\(5),
	datad => \reg_input_mux[0]~input_o\,
	combout => \rf_block|registers~37_combout\);

-- Location: LCCOMB_X17_Y21_N22
\rf_block|registers[12][5]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[12][5]~feeder_combout\ = \rf_block|registers~37_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers~37_combout\,
	combout => \rf_block|registers[12][5]~feeder_combout\);

-- Location: FF_X17_Y21_N23
\rf_block|registers[12][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[12][5]~feeder_combout\,
	asdata => \immediate[5]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[12][6]~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[12][5]~q\);

-- Location: LCCOMB_X17_Y21_N16
\rf_block|rs_data~56\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rs_data~56_combout\ = (\rs_address[3]~input_o\ & ((\rf_block|registers[8][5]~q\) # ((\rs_address[2]~input_o\)))) # (!\rs_address[3]~input_o\ & (((!\rs_address[2]~input_o\ & \rf_block|registers[0][5]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers[8][5]~q\,
	datab => \rs_address[3]~input_o\,
	datac => \rs_address[2]~input_o\,
	datad => \rf_block|registers[0][5]~q\,
	combout => \rf_block|rs_data~56_combout\);

-- Location: LCCOMB_X17_Y21_N30
\rf_block|rs_data~57\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rs_data~57_combout\ = (\rs_address[2]~input_o\ & ((\rf_block|rs_data~56_combout\ & (\rf_block|registers[12][5]~q\)) # (!\rf_block|rs_data~56_combout\ & ((\rf_block|registers[4][5]~q\))))) # (!\rs_address[2]~input_o\ & 
-- (((\rf_block|rs_data~56_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers[12][5]~q\,
	datab => \rf_block|registers[4][5]~q\,
	datac => \rs_address[2]~input_o\,
	datad => \rf_block|rs_data~56_combout\,
	combout => \rf_block|rs_data~57_combout\);

-- Location: LCCOMB_X18_Y19_N4
\rf_block|rs_data~54\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rs_data~54_combout\ = (\rs_address[2]~input_o\ & ((\rf_block|registers[5][5]~q\) # ((\rs_address[3]~input_o\)))) # (!\rs_address[2]~input_o\ & (((!\rs_address[3]~input_o\ & \rf_block|registers[1][5]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers[5][5]~q\,
	datab => \rs_address[2]~input_o\,
	datac => \rs_address[3]~input_o\,
	datad => \rf_block|registers[1][5]~q\,
	combout => \rf_block|rs_data~54_combout\);

-- Location: LCCOMB_X18_Y19_N18
\rf_block|rs_data~55\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rs_data~55_combout\ = (\rs_address[3]~input_o\ & ((\rf_block|rs_data~54_combout\ & (\rf_block|registers[13][5]~q\)) # (!\rf_block|rs_data~54_combout\ & ((\rf_block|registers[9][5]~q\))))) # (!\rs_address[3]~input_o\ & 
-- (\rf_block|rs_data~54_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs_address[3]~input_o\,
	datab => \rf_block|rs_data~54_combout\,
	datac => \rf_block|registers[13][5]~q\,
	datad => \rf_block|registers[9][5]~q\,
	combout => \rf_block|rs_data~55_combout\);

-- Location: LCCOMB_X15_Y19_N26
\rf_block|rs_data~58\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rs_data~58_combout\ = (\rs_address[0]~input_o\ & (((\rs_address[1]~input_o\) # (\rf_block|rs_data~55_combout\)))) # (!\rs_address[0]~input_o\ & (\rf_block|rs_data~57_combout\ & (!\rs_address[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rs_data~57_combout\,
	datab => \rs_address[0]~input_o\,
	datac => \rs_address[1]~input_o\,
	datad => \rf_block|rs_data~55_combout\,
	combout => \rf_block|rs_data~58_combout\);

-- Location: LCCOMB_X18_Y19_N28
\rf_block|rs_data~59\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rs_data~59_combout\ = (\rs_address[2]~input_o\ & (((\rs_address[3]~input_o\) # (\rf_block|registers[7][5]~q\)))) # (!\rs_address[2]~input_o\ & (\rf_block|registers[3][5]~q\ & (!\rs_address[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers[3][5]~q\,
	datab => \rs_address[2]~input_o\,
	datac => \rs_address[3]~input_o\,
	datad => \rf_block|registers[7][5]~q\,
	combout => \rf_block|rs_data~59_combout\);

-- Location: LCCOMB_X18_Y19_N14
\rf_block|rs_data~60\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rs_data~60_combout\ = (\rf_block|rs_data~59_combout\ & ((\rf_block|registers[15][5]~q\) # ((!\rs_address[3]~input_o\)))) # (!\rf_block|rs_data~59_combout\ & (((\rs_address[3]~input_o\ & \rf_block|registers[11][5]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011110010001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers[15][5]~q\,
	datab => \rf_block|rs_data~59_combout\,
	datac => \rs_address[3]~input_o\,
	datad => \rf_block|registers[11][5]~q\,
	combout => \rf_block|rs_data~60_combout\);

-- Location: LCCOMB_X18_Y19_N0
\rf_block|rs_data~52\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rs_data~52_combout\ = (\rs_address[3]~input_o\ & ((\rs_address[2]~input_o\) # ((\rf_block|registers[10][5]~q\)))) # (!\rs_address[3]~input_o\ & (!\rs_address[2]~input_o\ & ((\rf_block|registers[2][5]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs_address[3]~input_o\,
	datab => \rs_address[2]~input_o\,
	datac => \rf_block|registers[10][5]~q\,
	datad => \rf_block|registers[2][5]~q\,
	combout => \rf_block|rs_data~52_combout\);

-- Location: LCCOMB_X18_Y19_N22
\rf_block|rs_data~53\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rs_data~53_combout\ = (\rs_address[2]~input_o\ & ((\rf_block|rs_data~52_combout\ & ((\rf_block|registers[14][5]~q\))) # (!\rf_block|rs_data~52_combout\ & (\rf_block|registers[6][5]~q\)))) # (!\rs_address[2]~input_o\ & 
-- (((\rf_block|rs_data~52_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers[6][5]~q\,
	datab => \rs_address[2]~input_o\,
	datac => \rf_block|registers[14][5]~q\,
	datad => \rf_block|rs_data~52_combout\,
	combout => \rf_block|rs_data~53_combout\);

-- Location: LCCOMB_X15_Y19_N12
\rf_block|rs_data~61\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rs_data~61_combout\ = (\rf_block|rs_data~58_combout\ & ((\rf_block|rs_data~60_combout\) # ((!\rs_address[1]~input_o\)))) # (!\rf_block|rs_data~58_combout\ & (((\rs_address[1]~input_o\ & \rf_block|rs_data~53_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101010001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rs_data~58_combout\,
	datab => \rf_block|rs_data~60_combout\,
	datac => \rs_address[1]~input_o\,
	datad => \rf_block|rs_data~53_combout\,
	combout => \rf_block|rs_data~61_combout\);

-- Location: LCCOMB_X15_Y19_N22
\rf_block|rs_data[5]~SCLR_LUT\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rs_data[5]~SCLR_LUT_combout\ = (!\reset~input_o\ & \rf_block|rs_data~61_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datad => \rf_block|rs_data~61_combout\,
	combout => \rf_block|rs_data[5]~SCLR_LUT_combout\);

-- Location: FF_X22_Y19_N27
\rf_block|rs_data[5]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	asdata => \rf_block|rs_data[5]~SCLR_LUT_combout\,
	sload => VCC,
	ena => \rf_block|rs_data[7]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|rs_data[5]~_Duplicate_1_q\);

-- Location: LCCOMB_X25_Y19_N30
\alu_block|Add0~29\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Add0~29_combout\ = \rf_block|rs_data[5]~_Duplicate_1_q\ $ (((\alu_select[1]~input_o\) # (\alu_select[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111101011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \alu_select[1]~input_o\,
	datac => \rf_block|rs_data[5]~_Duplicate_1_q\,
	datad => \alu_select[0]~input_o\,
	combout => \alu_block|Add0~29_combout\);

-- Location: LCCOMB_X25_Y19_N20
\alu_block|Add0~35\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Add0~35_combout\ = (\rf_block|rt_data[6]~_Duplicate_1_q\ & ((\alu_block|Add0~34_combout\ & (\alu_block|Add0~31\ & VCC)) # (!\alu_block|Add0~34_combout\ & (!\alu_block|Add0~31\)))) # (!\rf_block|rt_data[6]~_Duplicate_1_q\ & 
-- ((\alu_block|Add0~34_combout\ & (!\alu_block|Add0~31\)) # (!\alu_block|Add0~34_combout\ & ((\alu_block|Add0~31\) # (GND)))))
-- \alu_block|Add0~36\ = CARRY((\rf_block|rt_data[6]~_Duplicate_1_q\ & (!\alu_block|Add0~34_combout\ & !\alu_block|Add0~31\)) # (!\rf_block|rt_data[6]~_Duplicate_1_q\ & ((!\alu_block|Add0~31\) # (!\alu_block|Add0~34_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rt_data[6]~_Duplicate_1_q\,
	datab => \alu_block|Add0~34_combout\,
	datad => VCC,
	cin => \alu_block|Add0~31\,
	combout => \alu_block|Add0~35_combout\,
	cout => \alu_block|Add0~36\);

-- Location: LCCOMB_X24_Y20_N26
\alu_block|Div0|auto_generated|divider|divider|selnose[9]~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Div0|auto_generated|divider|divider|selnose[9]~3_combout\ = (\rf_block|rt_data[7]~_Duplicate_1_q\ & (\rf_block|rs_data[0]~_Duplicate_1_q\ & (!\rf_block|rt_data[6]~_Duplicate_1_q\))) # (!\rf_block|rt_data[7]~_Duplicate_1_q\ & 
-- ((\rf_block|rs_data[1]~_Duplicate_1_q\) # ((\rf_block|rs_data[0]~_Duplicate_1_q\ & !\rf_block|rt_data[6]~_Duplicate_1_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101110100001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rt_data[7]~_Duplicate_1_q\,
	datab => \rf_block|rs_data[0]~_Duplicate_1_q\,
	datac => \rf_block|rt_data[6]~_Duplicate_1_q\,
	datad => \rf_block|rs_data[1]~_Duplicate_1_q\,
	combout => \alu_block|Div0|auto_generated|divider|divider|selnose[9]~3_combout\);

-- Location: LCCOMB_X24_Y19_N30
\alu_block|Div0|auto_generated|divider|divider|selnose[9]~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Div0|auto_generated|divider|divider|selnose[9]~4_combout\ = (\rf_block|rs_data[3]~_Duplicate_1_q\) # (((\alu_block|Div0|auto_generated|divider|divider|selnose[9]~3_combout\) # (\rf_block|rs_data[2]~_Duplicate_1_q\)) # 
-- (!\alu_block|Div0|auto_generated|divider|divider|selnose[27]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rs_data[3]~_Duplicate_1_q\,
	datab => \alu_block|Div0|auto_generated|divider|divider|selnose[27]~0_combout\,
	datac => \alu_block|Div0|auto_generated|divider|divider|selnose[9]~3_combout\,
	datad => \rf_block|rs_data[2]~_Duplicate_1_q\,
	combout => \alu_block|Div0|auto_generated|divider|divider|selnose[9]~4_combout\);

-- Location: LCCOMB_X24_Y19_N12
\alu_block|Add0~33\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Add0~33_combout\ = (\alu_select[1]~input_o\ & ((\alu_select[0]~input_o\ & (!\alu_block|Div0|auto_generated|divider|divider|selnose[9]~4_combout\)) # (!\alu_select[0]~input_o\ & ((\alu_block|Mult0|auto_generated|mac_out2~DATAOUT6\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100110001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \alu_block|Div0|auto_generated|divider|divider|selnose[9]~4_combout\,
	datab => \alu_select[1]~input_o\,
	datac => \alu_select[0]~input_o\,
	datad => \alu_block|Mult0|auto_generated|mac_out2~DATAOUT6\,
	combout => \alu_block|Add0~33_combout\);

-- Location: LCCOMB_X24_Y19_N6
\alu_block|Add0~37\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Add0~37_combout\ = (\alu_block|Add0~33_combout\) # ((!\alu_select[1]~input_o\ & \alu_block|Add0~35_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \alu_select[1]~input_o\,
	datac => \alu_block|Add0~35_combout\,
	datad => \alu_block|Add0~33_combout\,
	combout => \alu_block|Add0~37_combout\);

-- Location: FF_X24_Y19_N7
\alu_block|alu_out[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \alu_block|Add0~37_combout\,
	sclr => \reset~input_o\,
	ena => \pc_nzp_block|new_pc[7]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \alu_block|alu_out\(6));

-- Location: LCCOMB_X20_Y21_N16
\rf_block|registers~40\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers~40_combout\ = (\reg_input_mux[0]~input_o\ & ((\lsu_block|lsu_out\(6)))) # (!\reg_input_mux[0]~input_o\ & (\alu_block|alu_out\(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \alu_block|alu_out\(6),
	datab => \reg_input_mux[0]~input_o\,
	datad => \lsu_block|lsu_out\(6),
	combout => \rf_block|registers~40_combout\);

-- Location: LCCOMB_X14_Y20_N6
\rf_block|registers[3][6]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[3][6]~feeder_combout\ = \rf_block|registers~40_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rf_block|registers~40_combout\,
	combout => \rf_block|registers[3][6]~feeder_combout\);

-- Location: FF_X14_Y20_N7
\rf_block|registers[3][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[3][6]~feeder_combout\,
	asdata => \immediate[6]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[3][4]~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[3][6]~q\);

-- Location: LCCOMB_X14_Y20_N8
\rf_block|rs_data~66\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rs_data~66_combout\ = (\rs_address[0]~input_o\ & (((\rs_address[1]~input_o\)))) # (!\rs_address[0]~input_o\ & ((\rs_address[1]~input_o\ & (\rf_block|registers[2][6]~q\)) # (!\rs_address[1]~input_o\ & ((\rf_block|registers[0][6]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers[2][6]~q\,
	datab => \rs_address[0]~input_o\,
	datac => \rs_address[1]~input_o\,
	datad => \rf_block|registers[0][6]~q\,
	combout => \rf_block|rs_data~66_combout\);

-- Location: LCCOMB_X14_Y20_N26
\rf_block|rs_data~67\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rs_data~67_combout\ = (\rs_address[0]~input_o\ & ((\rf_block|rs_data~66_combout\ & (\rf_block|registers[3][6]~q\)) # (!\rf_block|rs_data~66_combout\ & ((\rf_block|registers[1][6]~q\))))) # (!\rs_address[0]~input_o\ & 
-- (((\rf_block|rs_data~66_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011110010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers[3][6]~q\,
	datab => \rs_address[0]~input_o\,
	datac => \rf_block|rs_data~66_combout\,
	datad => \rf_block|registers[1][6]~q\,
	combout => \rf_block|rs_data~67_combout\);

-- Location: LCCOMB_X14_Y20_N20
\rf_block|rs_data~64\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rs_data~64_combout\ = (\rs_address[1]~input_o\ & ((\rs_address[0]~input_o\) # ((\rf_block|registers[10][6]~q\)))) # (!\rs_address[1]~input_o\ & (!\rs_address[0]~input_o\ & (\rf_block|registers[8][6]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs_address[1]~input_o\,
	datab => \rs_address[0]~input_o\,
	datac => \rf_block|registers[8][6]~q\,
	datad => \rf_block|registers[10][6]~q\,
	combout => \rf_block|rs_data~64_combout\);

-- Location: LCCOMB_X14_Y20_N18
\rf_block|rs_data~65\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rs_data~65_combout\ = (\rs_address[0]~input_o\ & ((\rf_block|rs_data~64_combout\ & ((\rf_block|registers[11][6]~q\))) # (!\rf_block|rs_data~64_combout\ & (\rf_block|registers[9][6]~q\)))) # (!\rs_address[0]~input_o\ & 
-- (((\rf_block|rs_data~64_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers[9][6]~q\,
	datab => \rs_address[0]~input_o\,
	datac => \rf_block|registers[11][6]~q\,
	datad => \rf_block|rs_data~64_combout\,
	combout => \rf_block|rs_data~65_combout\);

-- Location: LCCOMB_X14_Y19_N22
\rf_block|rs_data~68\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rs_data~68_combout\ = (\rs_address[3]~input_o\ & ((\rs_address[2]~input_o\) # ((\rf_block|rs_data~65_combout\)))) # (!\rs_address[3]~input_o\ & (!\rs_address[2]~input_o\ & (\rf_block|rs_data~67_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs_address[3]~input_o\,
	datab => \rs_address[2]~input_o\,
	datac => \rf_block|rs_data~67_combout\,
	datad => \rf_block|rs_data~65_combout\,
	combout => \rf_block|rs_data~68_combout\);

-- Location: LCCOMB_X14_Y20_N16
\rf_block|rs_data~62\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rs_data~62_combout\ = (\rs_address[1]~input_o\ & (\rs_address[0]~input_o\)) # (!\rs_address[1]~input_o\ & ((\rs_address[0]~input_o\ & ((\rf_block|registers[5][6]~q\))) # (!\rs_address[0]~input_o\ & (\rf_block|registers[4][6]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs_address[1]~input_o\,
	datab => \rs_address[0]~input_o\,
	datac => \rf_block|registers[4][6]~q\,
	datad => \rf_block|registers[5][6]~q\,
	combout => \rf_block|rs_data~62_combout\);

-- Location: LCCOMB_X14_Y20_N22
\rf_block|rs_data~63\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rs_data~63_combout\ = (\rf_block|rs_data~62_combout\ & ((\rf_block|registers[7][6]~q\) # ((!\rs_address[1]~input_o\)))) # (!\rf_block|rs_data~62_combout\ & (((\rs_address[1]~input_o\ & \rf_block|registers[6][6]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011110010001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers[7][6]~q\,
	datab => \rf_block|rs_data~62_combout\,
	datac => \rs_address[1]~input_o\,
	datad => \rf_block|registers[6][6]~q\,
	combout => \rf_block|rs_data~63_combout\);

-- Location: LCCOMB_X19_Y20_N20
\rf_block|rs_data~69\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rs_data~69_combout\ = (\rs_address[1]~input_o\ & (((\rs_address[0]~input_o\)))) # (!\rs_address[1]~input_o\ & ((\rs_address[0]~input_o\ & ((\rf_block|registers[13][6]~q\))) # (!\rs_address[0]~input_o\ & (\rf_block|registers[12][6]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers[12][6]~q\,
	datab => \rs_address[1]~input_o\,
	datac => \rf_block|registers[13][6]~q\,
	datad => \rs_address[0]~input_o\,
	combout => \rf_block|rs_data~69_combout\);

-- Location: LCCOMB_X19_Y17_N0
\rf_block|rs_data~70\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rs_data~70_combout\ = (\rf_block|rs_data~69_combout\ & (((\rf_block|registers[15][6]~q\) # (!\rs_address[1]~input_o\)))) # (!\rf_block|rs_data~69_combout\ & (\rf_block|registers[14][6]~q\ & (\rs_address[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110000101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers[14][6]~q\,
	datab => \rf_block|rs_data~69_combout\,
	datac => \rs_address[1]~input_o\,
	datad => \rf_block|registers[15][6]~q\,
	combout => \rf_block|rs_data~70_combout\);

-- Location: LCCOMB_X14_Y19_N4
\rf_block|rs_data~71\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rs_data~71_combout\ = (\rf_block|rs_data~68_combout\ & (((\rf_block|rs_data~70_combout\)) # (!\rs_address[2]~input_o\))) # (!\rf_block|rs_data~68_combout\ & (\rs_address[2]~input_o\ & (\rf_block|rs_data~63_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rs_data~68_combout\,
	datab => \rs_address[2]~input_o\,
	datac => \rf_block|rs_data~63_combout\,
	datad => \rf_block|rs_data~70_combout\,
	combout => \rf_block|rs_data~71_combout\);

-- Location: LCCOMB_X20_Y19_N0
\rf_block|rs_data[6]~SCLR_LUT\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rs_data[6]~SCLR_LUT_combout\ = (\rf_block|rs_data~71_combout\ & !\reset~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \rf_block|rs_data~71_combout\,
	datad => \reset~input_o\,
	combout => \rf_block|rs_data[6]~SCLR_LUT_combout\);

-- Location: FF_X22_Y19_N11
\rf_block|rs_data[6]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	asdata => \rf_block|rs_data[6]~SCLR_LUT_combout\,
	sload => VCC,
	ena => \rf_block|rs_data[7]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|rs_data[6]~_Duplicate_1_q\);

-- Location: LCCOMB_X25_Y21_N28
\alu_block|Div0|auto_generated|divider|divider|selnose[45]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Div0|auto_generated|divider|divider|selnose[45]~2_combout\ = (!\rf_block|rs_data[7]~_Duplicate_1_q\ & !\rf_block|rs_data[6]~_Duplicate_1_q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \rf_block|rs_data[7]~_Duplicate_1_q\,
	datad => \rf_block|rs_data[6]~_Duplicate_1_q\,
	combout => \alu_block|Div0|auto_generated|divider|divider|selnose[45]~2_combout\);

-- Location: LCCOMB_X25_Y17_N24
\alu_block|Div0|auto_generated|divider|divider|selnose[36]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Div0|auto_generated|divider|divider|selnose[36]~1_combout\ = (!\rf_block|rs_data[6]~_Duplicate_1_q\ & (!\rf_block|rs_data[5]~_Duplicate_1_q\ & !\rf_block|rs_data[7]~_Duplicate_1_q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \rf_block|rs_data[6]~_Duplicate_1_q\,
	datac => \rf_block|rs_data[5]~_Duplicate_1_q\,
	datad => \rf_block|rs_data[7]~_Duplicate_1_q\,
	combout => \alu_block|Div0|auto_generated|divider|divider|selnose[36]~1_combout\);

-- Location: LCCOMB_X23_Y19_N16
\alu_block|Div0|auto_generated|divider|divider|StageOut[27]~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Div0|auto_generated|divider|divider|StageOut[27]~7_combout\ = (\alu_block|Div0|auto_generated|divider|divider|selnose[27]~0_combout\ & ((\alu_block|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~8_combout\ & 
-- (\alu_block|Div0|auto_generated|divider|divider|StageOut[18]~4_combout\)) # (!\alu_block|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~8_combout\ & ((\alu_block|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~6_combout\))))) # 
-- (!\alu_block|Div0|auto_generated|divider|divider|selnose[27]~0_combout\ & (\alu_block|Div0|auto_generated|divider|divider|StageOut[18]~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \alu_block|Div0|auto_generated|divider|divider|selnose[27]~0_combout\,
	datab => \alu_block|Div0|auto_generated|divider|divider|StageOut[18]~4_combout\,
	datac => \alu_block|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~8_combout\,
	datad => \alu_block|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~6_combout\,
	combout => \alu_block|Div0|auto_generated|divider|divider|StageOut[27]~7_combout\);

-- Location: LCCOMB_X22_Y17_N12
\alu_block|Div0|auto_generated|divider|divider|StageOut[26]~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Div0|auto_generated|divider|divider|StageOut[26]~8_combout\ = (\alu_block|Div0|auto_generated|divider|divider|selnose[27]~0_combout\ & ((\alu_block|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~8_combout\ & 
-- ((\alu_block|Div0|auto_generated|divider|divider|StageOut[17]~5_combout\))) # (!\alu_block|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~8_combout\ & (\alu_block|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~4_combout\)))) # 
-- (!\alu_block|Div0|auto_generated|divider|divider|selnose[27]~0_combout\ & (((\alu_block|Div0|auto_generated|divider|divider|StageOut[17]~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \alu_block|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~4_combout\,
	datab => \alu_block|Div0|auto_generated|divider|divider|selnose[27]~0_combout\,
	datac => \alu_block|Div0|auto_generated|divider|divider|StageOut[17]~5_combout\,
	datad => \alu_block|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~8_combout\,
	combout => \alu_block|Div0|auto_generated|divider|divider|StageOut[26]~8_combout\);

-- Location: LCCOMB_X23_Y19_N28
\alu_block|Div0|auto_generated|divider|divider|StageOut[25]~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Div0|auto_generated|divider|divider|StageOut[25]~9_combout\ = (\alu_block|Div0|auto_generated|divider|divider|selnose[27]~0_combout\ & ((\alu_block|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~8_combout\ & 
-- ((\alu_block|Div0|auto_generated|divider|divider|StageOut[16]~6_combout\))) # (!\alu_block|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~8_combout\ & (\alu_block|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~2_combout\)))) # 
-- (!\alu_block|Div0|auto_generated|divider|divider|selnose[27]~0_combout\ & (((\alu_block|Div0|auto_generated|divider|divider|StageOut[16]~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110100001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \alu_block|Div0|auto_generated|divider|divider|selnose[27]~0_combout\,
	datab => \alu_block|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~2_combout\,
	datac => \alu_block|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~8_combout\,
	datad => \alu_block|Div0|auto_generated|divider|divider|StageOut[16]~6_combout\,
	combout => \alu_block|Div0|auto_generated|divider|divider|StageOut[25]~9_combout\);

-- Location: LCCOMB_X23_Y19_N30
\alu_block|Div0|auto_generated|divider|divider|StageOut[24]~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Div0|auto_generated|divider|divider|StageOut[24]~10_combout\ = (\alu_block|Div0|auto_generated|divider|divider|selnose[27]~0_combout\ & ((\alu_block|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~8_combout\ & 
-- ((\rf_block|rt_data[4]~_Duplicate_1_q\))) # (!\alu_block|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~8_combout\ & (\alu_block|Div0|auto_generated|divider|divider|add_sub_3_result_int[0]~0_combout\)))) # 
-- (!\alu_block|Div0|auto_generated|divider|divider|selnose[27]~0_combout\ & (((\rf_block|rt_data[4]~_Duplicate_1_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110100001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \alu_block|Div0|auto_generated|divider|divider|selnose[27]~0_combout\,
	datab => \alu_block|Div0|auto_generated|divider|divider|add_sub_3_result_int[0]~0_combout\,
	datac => \alu_block|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~8_combout\,
	datad => \rf_block|rt_data[4]~_Duplicate_1_q\,
	combout => \alu_block|Div0|auto_generated|divider|divider|StageOut[24]~10_combout\);

-- Location: LCCOMB_X23_Y17_N18
\alu_block|Div0|auto_generated|divider|divider|add_sub_4_result_int[0]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Div0|auto_generated|divider|divider|add_sub_4_result_int[0]~0_combout\ = (\rf_block|rt_data[3]~_Duplicate_1_q\ & ((GND) # (!\rf_block|rs_data[0]~_Duplicate_1_q\))) # (!\rf_block|rt_data[3]~_Duplicate_1_q\ & (\rf_block|rs_data[0]~_Duplicate_1_q\ 
-- $ (GND)))
-- \alu_block|Div0|auto_generated|divider|divider|add_sub_4_result_int[0]~1\ = CARRY((\rf_block|rt_data[3]~_Duplicate_1_q\) # (!\rf_block|rs_data[0]~_Duplicate_1_q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rt_data[3]~_Duplicate_1_q\,
	datab => \rf_block|rs_data[0]~_Duplicate_1_q\,
	datad => VCC,
	combout => \alu_block|Div0|auto_generated|divider|divider|add_sub_4_result_int[0]~0_combout\,
	cout => \alu_block|Div0|auto_generated|divider|divider|add_sub_4_result_int[0]~1\);

-- Location: LCCOMB_X23_Y17_N20
\alu_block|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~2_combout\ = (\alu_block|Div0|auto_generated|divider|divider|StageOut[24]~10_combout\ & ((\rf_block|rs_data[1]~_Duplicate_1_q\ & 
-- (!\alu_block|Div0|auto_generated|divider|divider|add_sub_4_result_int[0]~1\)) # (!\rf_block|rs_data[1]~_Duplicate_1_q\ & (\alu_block|Div0|auto_generated|divider|divider|add_sub_4_result_int[0]~1\ & VCC)))) # 
-- (!\alu_block|Div0|auto_generated|divider|divider|StageOut[24]~10_combout\ & ((\rf_block|rs_data[1]~_Duplicate_1_q\ & ((\alu_block|Div0|auto_generated|divider|divider|add_sub_4_result_int[0]~1\) # (GND))) # (!\rf_block|rs_data[1]~_Duplicate_1_q\ & 
-- (!\alu_block|Div0|auto_generated|divider|divider|add_sub_4_result_int[0]~1\))))
-- \alu_block|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~3\ = CARRY((\alu_block|Div0|auto_generated|divider|divider|StageOut[24]~10_combout\ & (\rf_block|rs_data[1]~_Duplicate_1_q\ & 
-- !\alu_block|Div0|auto_generated|divider|divider|add_sub_4_result_int[0]~1\)) # (!\alu_block|Div0|auto_generated|divider|divider|StageOut[24]~10_combout\ & ((\rf_block|rs_data[1]~_Duplicate_1_q\) # 
-- (!\alu_block|Div0|auto_generated|divider|divider|add_sub_4_result_int[0]~1\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \alu_block|Div0|auto_generated|divider|divider|StageOut[24]~10_combout\,
	datab => \rf_block|rs_data[1]~_Duplicate_1_q\,
	datad => VCC,
	cin => \alu_block|Div0|auto_generated|divider|divider|add_sub_4_result_int[0]~1\,
	combout => \alu_block|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~2_combout\,
	cout => \alu_block|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~3\);

-- Location: LCCOMB_X23_Y17_N22
\alu_block|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~4_combout\ = ((\alu_block|Div0|auto_generated|divider|divider|StageOut[25]~9_combout\ $ (\rf_block|rs_data[2]~_Duplicate_1_q\ $ 
-- (\alu_block|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~3\)))) # (GND)
-- \alu_block|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~5\ = CARRY((\alu_block|Div0|auto_generated|divider|divider|StageOut[25]~9_combout\ & ((!\alu_block|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~3\) # 
-- (!\rf_block|rs_data[2]~_Duplicate_1_q\))) # (!\alu_block|Div0|auto_generated|divider|divider|StageOut[25]~9_combout\ & (!\rf_block|rs_data[2]~_Duplicate_1_q\ & !\alu_block|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \alu_block|Div0|auto_generated|divider|divider|StageOut[25]~9_combout\,
	datab => \rf_block|rs_data[2]~_Duplicate_1_q\,
	datad => VCC,
	cin => \alu_block|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~3\,
	combout => \alu_block|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~4_combout\,
	cout => \alu_block|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~5\);

-- Location: LCCOMB_X23_Y17_N24
\alu_block|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~6_combout\ = (\alu_block|Div0|auto_generated|divider|divider|StageOut[26]~8_combout\ & ((\rf_block|rs_data[3]~_Duplicate_1_q\ & 
-- (!\alu_block|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~5\)) # (!\rf_block|rs_data[3]~_Duplicate_1_q\ & (\alu_block|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~5\ & VCC)))) # 
-- (!\alu_block|Div0|auto_generated|divider|divider|StageOut[26]~8_combout\ & ((\rf_block|rs_data[3]~_Duplicate_1_q\ & ((\alu_block|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~5\) # (GND))) # (!\rf_block|rs_data[3]~_Duplicate_1_q\ & 
-- (!\alu_block|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~5\))))
-- \alu_block|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~7\ = CARRY((\alu_block|Div0|auto_generated|divider|divider|StageOut[26]~8_combout\ & (\rf_block|rs_data[3]~_Duplicate_1_q\ & 
-- !\alu_block|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~5\)) # (!\alu_block|Div0|auto_generated|divider|divider|StageOut[26]~8_combout\ & ((\rf_block|rs_data[3]~_Duplicate_1_q\) # 
-- (!\alu_block|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~5\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \alu_block|Div0|auto_generated|divider|divider|StageOut[26]~8_combout\,
	datab => \rf_block|rs_data[3]~_Duplicate_1_q\,
	datad => VCC,
	cin => \alu_block|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~5\,
	combout => \alu_block|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~6_combout\,
	cout => \alu_block|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~7\);

-- Location: LCCOMB_X23_Y17_N26
\alu_block|Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~8_combout\ = ((\rf_block|rs_data[4]~_Duplicate_1_q\ $ (\alu_block|Div0|auto_generated|divider|divider|StageOut[27]~7_combout\ $ 
-- (\alu_block|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~7\)))) # (GND)
-- \alu_block|Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~9\ = CARRY((\rf_block|rs_data[4]~_Duplicate_1_q\ & (\alu_block|Div0|auto_generated|divider|divider|StageOut[27]~7_combout\ & 
-- !\alu_block|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~7\)) # (!\rf_block|rs_data[4]~_Duplicate_1_q\ & ((\alu_block|Div0|auto_generated|divider|divider|StageOut[27]~7_combout\) # 
-- (!\alu_block|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~7\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rs_data[4]~_Duplicate_1_q\,
	datab => \alu_block|Div0|auto_generated|divider|divider|StageOut[27]~7_combout\,
	datad => VCC,
	cin => \alu_block|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~7\,
	combout => \alu_block|Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~8_combout\,
	cout => \alu_block|Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~9\);

-- Location: LCCOMB_X23_Y17_N28
\alu_block|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\ = !\alu_block|Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~9\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \alu_block|Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~9\,
	combout => \alu_block|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\);

-- Location: LCCOMB_X23_Y17_N16
\alu_block|Div0|auto_generated|divider|divider|StageOut[36]~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Div0|auto_generated|divider|divider|StageOut[36]~11_combout\ = (\alu_block|Div0|auto_generated|divider|divider|selnose[36]~1_combout\ & ((\alu_block|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\ & 
-- (\alu_block|Div0|auto_generated|divider|divider|StageOut[27]~7_combout\)) # (!\alu_block|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\ & ((\alu_block|Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~8_combout\))))) # 
-- (!\alu_block|Div0|auto_generated|divider|divider|selnose[36]~1_combout\ & (\alu_block|Div0|auto_generated|divider|divider|StageOut[27]~7_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \alu_block|Div0|auto_generated|divider|divider|selnose[36]~1_combout\,
	datab => \alu_block|Div0|auto_generated|divider|divider|StageOut[27]~7_combout\,
	datac => \alu_block|Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~8_combout\,
	datad => \alu_block|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\,
	combout => \alu_block|Div0|auto_generated|divider|divider|StageOut[36]~11_combout\);

-- Location: LCCOMB_X23_Y17_N0
\alu_block|Div0|auto_generated|divider|divider|StageOut[35]~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Div0|auto_generated|divider|divider|StageOut[35]~12_combout\ = (\alu_block|Div0|auto_generated|divider|divider|selnose[36]~1_combout\ & ((\alu_block|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\ & 
-- (\alu_block|Div0|auto_generated|divider|divider|StageOut[26]~8_combout\)) # (!\alu_block|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\ & ((\alu_block|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~6_combout\))))) # 
-- (!\alu_block|Div0|auto_generated|divider|divider|selnose[36]~1_combout\ & (\alu_block|Div0|auto_generated|divider|divider|StageOut[26]~8_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \alu_block|Div0|auto_generated|divider|divider|StageOut[26]~8_combout\,
	datab => \alu_block|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~6_combout\,
	datac => \alu_block|Div0|auto_generated|divider|divider|selnose[36]~1_combout\,
	datad => \alu_block|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\,
	combout => \alu_block|Div0|auto_generated|divider|divider|StageOut[35]~12_combout\);

-- Location: LCCOMB_X23_Y17_N30
\alu_block|Div0|auto_generated|divider|divider|StageOut[34]~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Div0|auto_generated|divider|divider|StageOut[34]~13_combout\ = (\alu_block|Div0|auto_generated|divider|divider|selnose[36]~1_combout\ & ((\alu_block|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\ & 
-- (\alu_block|Div0|auto_generated|divider|divider|StageOut[25]~9_combout\)) # (!\alu_block|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\ & ((\alu_block|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~4_combout\))))) # 
-- (!\alu_block|Div0|auto_generated|divider|divider|selnose[36]~1_combout\ & (\alu_block|Div0|auto_generated|divider|divider|StageOut[25]~9_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \alu_block|Div0|auto_generated|divider|divider|StageOut[25]~9_combout\,
	datab => \alu_block|Div0|auto_generated|divider|divider|selnose[36]~1_combout\,
	datac => \alu_block|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~4_combout\,
	datad => \alu_block|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\,
	combout => \alu_block|Div0|auto_generated|divider|divider|StageOut[34]~13_combout\);

-- Location: LCCOMB_X22_Y17_N6
\alu_block|Div0|auto_generated|divider|divider|StageOut[33]~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Div0|auto_generated|divider|divider|StageOut[33]~14_combout\ = (\alu_block|Div0|auto_generated|divider|divider|selnose[36]~1_combout\ & ((\alu_block|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\ & 
-- (\alu_block|Div0|auto_generated|divider|divider|StageOut[24]~10_combout\)) # (!\alu_block|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\ & ((\alu_block|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~2_combout\))))) # 
-- (!\alu_block|Div0|auto_generated|divider|divider|selnose[36]~1_combout\ & (\alu_block|Div0|auto_generated|divider|divider|StageOut[24]~10_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \alu_block|Div0|auto_generated|divider|divider|selnose[36]~1_combout\,
	datab => \alu_block|Div0|auto_generated|divider|divider|StageOut[24]~10_combout\,
	datac => \alu_block|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~2_combout\,
	datad => \alu_block|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\,
	combout => \alu_block|Div0|auto_generated|divider|divider|StageOut[33]~14_combout\);

-- Location: LCCOMB_X22_Y17_N16
\alu_block|Div0|auto_generated|divider|divider|StageOut[32]~15\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Div0|auto_generated|divider|divider|StageOut[32]~15_combout\ = (\alu_block|Div0|auto_generated|divider|divider|selnose[36]~1_combout\ & ((\alu_block|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\ & 
-- (\rf_block|rt_data[3]~_Duplicate_1_q\)) # (!\alu_block|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\ & ((\alu_block|Div0|auto_generated|divider|divider|add_sub_4_result_int[0]~0_combout\))))) # 
-- (!\alu_block|Div0|auto_generated|divider|divider|selnose[36]~1_combout\ & (\rf_block|rt_data[3]~_Duplicate_1_q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rt_data[3]~_Duplicate_1_q\,
	datab => \alu_block|Div0|auto_generated|divider|divider|add_sub_4_result_int[0]~0_combout\,
	datac => \alu_block|Div0|auto_generated|divider|divider|selnose[36]~1_combout\,
	datad => \alu_block|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\,
	combout => \alu_block|Div0|auto_generated|divider|divider|StageOut[32]~15_combout\);

-- Location: LCCOMB_X23_Y17_N2
\alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[0]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[0]~0_combout\ = (\rf_block|rt_data[2]~_Duplicate_1_q\ & ((GND) # (!\rf_block|rs_data[0]~_Duplicate_1_q\))) # (!\rf_block|rt_data[2]~_Duplicate_1_q\ & (\rf_block|rs_data[0]~_Duplicate_1_q\ 
-- $ (GND)))
-- \alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[0]~1\ = CARRY((\rf_block|rt_data[2]~_Duplicate_1_q\) # (!\rf_block|rs_data[0]~_Duplicate_1_q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rt_data[2]~_Duplicate_1_q\,
	datab => \rf_block|rs_data[0]~_Duplicate_1_q\,
	datad => VCC,
	combout => \alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[0]~0_combout\,
	cout => \alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[0]~1\);

-- Location: LCCOMB_X23_Y17_N4
\alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~2_combout\ = (\alu_block|Div0|auto_generated|divider|divider|StageOut[32]~15_combout\ & ((\rf_block|rs_data[1]~_Duplicate_1_q\ & 
-- (!\alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[0]~1\)) # (!\rf_block|rs_data[1]~_Duplicate_1_q\ & (\alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[0]~1\ & VCC)))) # 
-- (!\alu_block|Div0|auto_generated|divider|divider|StageOut[32]~15_combout\ & ((\rf_block|rs_data[1]~_Duplicate_1_q\ & ((\alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[0]~1\) # (GND))) # (!\rf_block|rs_data[1]~_Duplicate_1_q\ & 
-- (!\alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[0]~1\))))
-- \alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~3\ = CARRY((\alu_block|Div0|auto_generated|divider|divider|StageOut[32]~15_combout\ & (\rf_block|rs_data[1]~_Duplicate_1_q\ & 
-- !\alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[0]~1\)) # (!\alu_block|Div0|auto_generated|divider|divider|StageOut[32]~15_combout\ & ((\rf_block|rs_data[1]~_Duplicate_1_q\) # 
-- (!\alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[0]~1\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \alu_block|Div0|auto_generated|divider|divider|StageOut[32]~15_combout\,
	datab => \rf_block|rs_data[1]~_Duplicate_1_q\,
	datad => VCC,
	cin => \alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[0]~1\,
	combout => \alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~2_combout\,
	cout => \alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~3\);

-- Location: LCCOMB_X23_Y17_N6
\alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~4_combout\ = ((\rf_block|rs_data[2]~_Duplicate_1_q\ $ (\alu_block|Div0|auto_generated|divider|divider|StageOut[33]~14_combout\ $ 
-- (\alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~3\)))) # (GND)
-- \alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~5\ = CARRY((\rf_block|rs_data[2]~_Duplicate_1_q\ & (\alu_block|Div0|auto_generated|divider|divider|StageOut[33]~14_combout\ & 
-- !\alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~3\)) # (!\rf_block|rs_data[2]~_Duplicate_1_q\ & ((\alu_block|Div0|auto_generated|divider|divider|StageOut[33]~14_combout\) # 
-- (!\alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~3\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rs_data[2]~_Duplicate_1_q\,
	datab => \alu_block|Div0|auto_generated|divider|divider|StageOut[33]~14_combout\,
	datad => VCC,
	cin => \alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~3\,
	combout => \alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~4_combout\,
	cout => \alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~5\);

-- Location: LCCOMB_X23_Y17_N8
\alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~6_combout\ = (\alu_block|Div0|auto_generated|divider|divider|StageOut[34]~13_combout\ & ((\rf_block|rs_data[3]~_Duplicate_1_q\ & 
-- (!\alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~5\)) # (!\rf_block|rs_data[3]~_Duplicate_1_q\ & (\alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~5\ & VCC)))) # 
-- (!\alu_block|Div0|auto_generated|divider|divider|StageOut[34]~13_combout\ & ((\rf_block|rs_data[3]~_Duplicate_1_q\ & ((\alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~5\) # (GND))) # (!\rf_block|rs_data[3]~_Duplicate_1_q\ & 
-- (!\alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~5\))))
-- \alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~7\ = CARRY((\alu_block|Div0|auto_generated|divider|divider|StageOut[34]~13_combout\ & (\rf_block|rs_data[3]~_Duplicate_1_q\ & 
-- !\alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~5\)) # (!\alu_block|Div0|auto_generated|divider|divider|StageOut[34]~13_combout\ & ((\rf_block|rs_data[3]~_Duplicate_1_q\) # 
-- (!\alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~5\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \alu_block|Div0|auto_generated|divider|divider|StageOut[34]~13_combout\,
	datab => \rf_block|rs_data[3]~_Duplicate_1_q\,
	datad => VCC,
	cin => \alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~5\,
	combout => \alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~6_combout\,
	cout => \alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~7\);

-- Location: LCCOMB_X23_Y17_N10
\alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~8_combout\ = ((\rf_block|rs_data[4]~_Duplicate_1_q\ $ (\alu_block|Div0|auto_generated|divider|divider|StageOut[35]~12_combout\ $ 
-- (\alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~7\)))) # (GND)
-- \alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~9\ = CARRY((\rf_block|rs_data[4]~_Duplicate_1_q\ & (\alu_block|Div0|auto_generated|divider|divider|StageOut[35]~12_combout\ & 
-- !\alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~7\)) # (!\rf_block|rs_data[4]~_Duplicate_1_q\ & ((\alu_block|Div0|auto_generated|divider|divider|StageOut[35]~12_combout\) # 
-- (!\alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~7\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rs_data[4]~_Duplicate_1_q\,
	datab => \alu_block|Div0|auto_generated|divider|divider|StageOut[35]~12_combout\,
	datad => VCC,
	cin => \alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~7\,
	combout => \alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~8_combout\,
	cout => \alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~9\);

-- Location: LCCOMB_X23_Y17_N12
\alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~10_combout\ = (\rf_block|rs_data[5]~_Duplicate_1_q\ & ((\alu_block|Div0|auto_generated|divider|divider|StageOut[36]~11_combout\ & 
-- (!\alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~9\)) # (!\alu_block|Div0|auto_generated|divider|divider|StageOut[36]~11_combout\ & ((\alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~9\) # (GND))))) # 
-- (!\rf_block|rs_data[5]~_Duplicate_1_q\ & ((\alu_block|Div0|auto_generated|divider|divider|StageOut[36]~11_combout\ & (\alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~9\ & VCC)) # 
-- (!\alu_block|Div0|auto_generated|divider|divider|StageOut[36]~11_combout\ & (!\alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~9\))))
-- \alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~11\ = CARRY((\rf_block|rs_data[5]~_Duplicate_1_q\ & ((!\alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~9\) # 
-- (!\alu_block|Div0|auto_generated|divider|divider|StageOut[36]~11_combout\))) # (!\rf_block|rs_data[5]~_Duplicate_1_q\ & (!\alu_block|Div0|auto_generated|divider|divider|StageOut[36]~11_combout\ & 
-- !\alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~9\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rs_data[5]~_Duplicate_1_q\,
	datab => \alu_block|Div0|auto_generated|divider|divider|StageOut[36]~11_combout\,
	datad => VCC,
	cin => \alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~9\,
	combout => \alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~10_combout\,
	cout => \alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~11\);

-- Location: LCCOMB_X23_Y17_N14
\alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[6]~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\ = \alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~11\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~11\,
	combout => \alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\);

-- Location: LCCOMB_X24_Y19_N16
\alu_block|Add0~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Add0~13_combout\ = (\alu_select[0]~input_o\ & (\alu_block|Div0|auto_generated|divider|divider|selnose[45]~2_combout\ & (!\alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\))) # (!\alu_select[0]~input_o\ & 
-- (((\alu_block|Mult0|auto_generated|mac_out2~DATAOUT2\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011101100001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \alu_block|Div0|auto_generated|divider|divider|selnose[45]~2_combout\,
	datab => \alu_select[0]~input_o\,
	datac => \alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\,
	datad => \alu_block|Mult0|auto_generated|mac_out2~DATAOUT2\,
	combout => \alu_block|Add0~13_combout\);

-- Location: LCCOMB_X24_Y19_N26
\alu_block|Add0~17\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Add0~17_combout\ = (\alu_select[1]~input_o\ & ((\alu_block|Add0~13_combout\))) # (!\alu_select[1]~input_o\ & (\alu_block|Add0~15_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \alu_select[1]~input_o\,
	datac => \alu_block|Add0~15_combout\,
	datad => \alu_block|Add0~13_combout\,
	combout => \alu_block|Add0~17_combout\);

-- Location: FF_X24_Y19_N27
\alu_block|alu_out[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \alu_block|Add0~17_combout\,
	sclr => \reset~input_o\,
	ena => \pc_nzp_block|new_pc[7]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \alu_block|alu_out\(2));

-- Location: LCCOMB_X17_Y20_N14
\rf_block|registers~27\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers~27_combout\ = (\reg_input_mux[0]~input_o\ & (\lsu_block|lsu_out\(2))) # (!\reg_input_mux[0]~input_o\ & ((\alu_block|alu_out\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \lsu_block|lsu_out\(2),
	datab => \reg_input_mux[0]~input_o\,
	datad => \alu_block|alu_out\(2),
	combout => \rf_block|registers~27_combout\);

-- Location: LCCOMB_X17_Y19_N16
\rf_block|registers[7][2]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[7][2]~feeder_combout\ = \rf_block|registers~27_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rf_block|registers~27_combout\,
	combout => \rf_block|registers[7][2]~feeder_combout\);

-- Location: FF_X17_Y19_N17
\rf_block|registers[7][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[7][2]~feeder_combout\,
	asdata => \immediate[2]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[7][1]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[7][2]~q\);

-- Location: LCCOMB_X14_Y19_N8
\rf_block|rt_data~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rt_data~20_combout\ = (\rt_address[0]~input_o\ & (((\rt_address[1]~input_o\) # (\rf_block|registers[5][2]~q\)))) # (!\rt_address[0]~input_o\ & (\rf_block|registers[4][2]~q\ & (!\rt_address[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers[4][2]~q\,
	datab => \rt_address[0]~input_o\,
	datac => \rt_address[1]~input_o\,
	datad => \rf_block|registers[5][2]~q\,
	combout => \rf_block|rt_data~20_combout\);

-- Location: LCCOMB_X14_Y19_N6
\rf_block|rt_data~21\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rt_data~21_combout\ = (\rf_block|rt_data~20_combout\ & ((\rf_block|registers[7][2]~q\) # ((!\rt_address[1]~input_o\)))) # (!\rf_block|rt_data~20_combout\ & (((\rt_address[1]~input_o\ & \rf_block|registers[6][2]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011110010001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers[7][2]~q\,
	datab => \rf_block|rt_data~20_combout\,
	datac => \rt_address[1]~input_o\,
	datad => \rf_block|registers[6][2]~q\,
	combout => \rf_block|rt_data~21_combout\);

-- Location: LCCOMB_X15_Y19_N30
\rf_block|rt_data~24\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rt_data~24_combout\ = (\rt_address[0]~input_o\ & (\rt_address[1]~input_o\)) # (!\rt_address[0]~input_o\ & ((\rt_address[1]~input_o\ & (\rf_block|registers[2][2]~q\)) # (!\rt_address[1]~input_o\ & ((\rf_block|registers[0][2]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rt_address[0]~input_o\,
	datab => \rt_address[1]~input_o\,
	datac => \rf_block|registers[2][2]~q\,
	datad => \rf_block|registers[0][2]~q\,
	combout => \rf_block|rt_data~24_combout\);

-- Location: LCCOMB_X15_Y19_N8
\rf_block|rt_data~25\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rt_data~25_combout\ = (\rf_block|rt_data~24_combout\ & (((\rf_block|registers[3][2]~q\) # (!\rt_address[0]~input_o\)))) # (!\rf_block|rt_data~24_combout\ & (\rf_block|registers[1][2]~q\ & (\rt_address[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rt_data~24_combout\,
	datab => \rf_block|registers[1][2]~q\,
	datac => \rt_address[0]~input_o\,
	datad => \rf_block|registers[3][2]~q\,
	combout => \rf_block|rt_data~25_combout\);

-- Location: LCCOMB_X15_Y19_N18
\rf_block|rt_data~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rt_data~22_combout\ = (\rt_address[0]~input_o\ & (((\rt_address[1]~input_o\)))) # (!\rt_address[0]~input_o\ & ((\rt_address[1]~input_o\ & (\rf_block|registers[10][2]~q\)) # (!\rt_address[1]~input_o\ & ((\rf_block|registers[8][2]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rt_address[0]~input_o\,
	datab => \rf_block|registers[10][2]~q\,
	datac => \rt_address[1]~input_o\,
	datad => \rf_block|registers[8][2]~q\,
	combout => \rf_block|rt_data~22_combout\);

-- Location: LCCOMB_X15_Y19_N24
\rf_block|rt_data~23\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rt_data~23_combout\ = (\rt_address[0]~input_o\ & ((\rf_block|rt_data~22_combout\ & (\rf_block|registers[11][2]~q\)) # (!\rf_block|rt_data~22_combout\ & ((\rf_block|registers[9][2]~q\))))) # (!\rt_address[0]~input_o\ & 
-- (\rf_block|rt_data~22_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rt_address[0]~input_o\,
	datab => \rf_block|rt_data~22_combout\,
	datac => \rf_block|registers[11][2]~q\,
	datad => \rf_block|registers[9][2]~q\,
	combout => \rf_block|rt_data~23_combout\);

-- Location: LCCOMB_X14_Y19_N20
\rf_block|rt_data~26\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rt_data~26_combout\ = (\rt_address[3]~input_o\ & (((\rt_address[2]~input_o\) # (\rf_block|rt_data~23_combout\)))) # (!\rt_address[3]~input_o\ & (\rf_block|rt_data~25_combout\ & (!\rt_address[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rt_address[3]~input_o\,
	datab => \rf_block|rt_data~25_combout\,
	datac => \rt_address[2]~input_o\,
	datad => \rf_block|rt_data~23_combout\,
	combout => \rf_block|rt_data~26_combout\);

-- Location: LCCOMB_X17_Y20_N30
\rf_block|rt_data~27\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rt_data~27_combout\ = (\rt_address[0]~input_o\ & (((\rt_address[1]~input_o\) # (\rf_block|registers[13][2]~q\)))) # (!\rt_address[0]~input_o\ & (\rf_block|registers[12][2]~q\ & (!\rt_address[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers[12][2]~q\,
	datab => \rt_address[0]~input_o\,
	datac => \rt_address[1]~input_o\,
	datad => \rf_block|registers[13][2]~q\,
	combout => \rf_block|rt_data~27_combout\);

-- Location: LCCOMB_X14_Y19_N2
\rf_block|rt_data~28\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rt_data~28_combout\ = (\rf_block|rt_data~27_combout\ & (((\rf_block|registers[15][2]~q\) # (!\rt_address[1]~input_o\)))) # (!\rf_block|rt_data~27_combout\ & (\rf_block|registers[14][2]~q\ & ((\rt_address[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers[14][2]~q\,
	datab => \rf_block|rt_data~27_combout\,
	datac => \rf_block|registers[15][2]~q\,
	datad => \rt_address[1]~input_o\,
	combout => \rf_block|rt_data~28_combout\);

-- Location: LCCOMB_X14_Y19_N16
\rf_block|rt_data~29\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rt_data~29_combout\ = (\rf_block|rt_data~26_combout\ & (((\rf_block|rt_data~28_combout\) # (!\rt_address[2]~input_o\)))) # (!\rf_block|rt_data~26_combout\ & (\rf_block|rt_data~21_combout\ & (\rt_address[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110000101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rt_data~21_combout\,
	datab => \rf_block|rt_data~26_combout\,
	datac => \rt_address[2]~input_o\,
	datad => \rf_block|rt_data~28_combout\,
	combout => \rf_block|rt_data~29_combout\);

-- Location: LCCOMB_X20_Y19_N26
\rf_block|rt_data[2]~SCLR_LUT\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rt_data[2]~SCLR_LUT_combout\ = (\rf_block|rt_data~29_combout\ & !\reset~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \rf_block|rt_data~29_combout\,
	datad => \reset~input_o\,
	combout => \rf_block|rt_data[2]~SCLR_LUT_combout\);

-- Location: FF_X20_Y19_N27
\rf_block|rt_data[2]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|rt_data[2]~SCLR_LUT_combout\,
	ena => \rf_block|rs_data[7]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|rt_data[2]~_Duplicate_1_q\);

-- Location: LCCOMB_X24_Y19_N18
\alu_block|Add0~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Add0~18_combout\ = (\alu_select[0]~input_o\ & (((\alu_block|Div0|auto_generated|divider|divider|selnose[36]~1_combout\ & !\alu_block|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\)))) # (!\alu_select[0]~input_o\ & 
-- (\alu_block|Mult0|auto_generated|mac_out2~DATAOUT3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001011100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \alu_block|Mult0|auto_generated|mac_out2~DATAOUT3\,
	datab => \alu_select[0]~input_o\,
	datac => \alu_block|Div0|auto_generated|divider|divider|selnose[36]~1_combout\,
	datad => \alu_block|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\,
	combout => \alu_block|Add0~18_combout\);

-- Location: LCCOMB_X24_Y19_N20
\alu_block|Add0~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Add0~22_combout\ = (\alu_select[1]~input_o\ & ((\alu_block|Add0~18_combout\))) # (!\alu_select[1]~input_o\ & (\alu_block|Add0~20_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \alu_select[1]~input_o\,
	datac => \alu_block|Add0~20_combout\,
	datad => \alu_block|Add0~18_combout\,
	combout => \alu_block|Add0~22_combout\);

-- Location: FF_X24_Y19_N21
\alu_block|alu_out[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \alu_block|Add0~22_combout\,
	sclr => \reset~input_o\,
	ena => \pc_nzp_block|new_pc[7]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \alu_block|alu_out\(3));

-- Location: LCCOMB_X20_Y21_N14
\rf_block|registers~31\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers~31_combout\ = (\reg_input_mux[0]~input_o\ & ((\lsu_block|lsu_out\(3)))) # (!\reg_input_mux[0]~input_o\ & (\alu_block|alu_out\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \alu_block|alu_out\(3),
	datab => \reg_input_mux[0]~input_o\,
	datad => \lsu_block|lsu_out\(3),
	combout => \rf_block|registers~31_combout\);

-- Location: LCCOMB_X16_Y19_N28
\rf_block|registers[8][3]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[8][3]~feeder_combout\ = \rf_block|registers~31_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rf_block|registers~31_combout\,
	combout => \rf_block|registers[8][3]~feeder_combout\);

-- Location: FF_X16_Y19_N29
\rf_block|registers[8][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[8][3]~feeder_combout\,
	asdata => \immediate[3]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[8][5]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[8][3]~q\);

-- Location: LCCOMB_X16_Y19_N14
\rf_block|rs_data~36\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rs_data~36_combout\ = (\rs_address[3]~input_o\ & (((\rs_address[2]~input_o\)))) # (!\rs_address[3]~input_o\ & ((\rs_address[2]~input_o\ & ((\rf_block|registers[4][3]~q\))) # (!\rs_address[2]~input_o\ & (\rf_block|registers[0][3]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs_address[3]~input_o\,
	datab => \rf_block|registers[0][3]~q\,
	datac => \rs_address[2]~input_o\,
	datad => \rf_block|registers[4][3]~q\,
	combout => \rf_block|rs_data~36_combout\);

-- Location: LCCOMB_X16_Y19_N12
\rf_block|rs_data~37\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rs_data~37_combout\ = (\rs_address[3]~input_o\ & ((\rf_block|rs_data~36_combout\ & ((\rf_block|registers[12][3]~q\))) # (!\rf_block|rs_data~36_combout\ & (\rf_block|registers[8][3]~q\)))) # (!\rs_address[3]~input_o\ & 
-- (((\rf_block|rs_data~36_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100001011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs_address[3]~input_o\,
	datab => \rf_block|registers[8][3]~q\,
	datac => \rf_block|rs_data~36_combout\,
	datad => \rf_block|registers[12][3]~q\,
	combout => \rf_block|rs_data~37_combout\);

-- Location: LCCOMB_X16_Y19_N2
\rf_block|rs_data~34\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rs_data~34_combout\ = (\rs_address[3]~input_o\ & (((\rs_address[2]~input_o\)))) # (!\rs_address[3]~input_o\ & ((\rs_address[2]~input_o\ & ((\rf_block|registers[6][3]~q\))) # (!\rs_address[2]~input_o\ & (\rf_block|registers[2][3]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs_address[3]~input_o\,
	datab => \rf_block|registers[2][3]~q\,
	datac => \rs_address[2]~input_o\,
	datad => \rf_block|registers[6][3]~q\,
	combout => \rf_block|rs_data~34_combout\);

-- Location: LCCOMB_X16_Y19_N0
\rf_block|rs_data~35\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rs_data~35_combout\ = (\rs_address[3]~input_o\ & ((\rf_block|rs_data~34_combout\ & ((\rf_block|registers[14][3]~q\))) # (!\rf_block|rs_data~34_combout\ & (\rf_block|registers[10][3]~q\)))) # (!\rs_address[3]~input_o\ & 
-- (\rf_block|rs_data~34_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110001100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs_address[3]~input_o\,
	datab => \rf_block|rs_data~34_combout\,
	datac => \rf_block|registers[10][3]~q\,
	datad => \rf_block|registers[14][3]~q\,
	combout => \rf_block|rs_data~35_combout\);

-- Location: LCCOMB_X16_Y19_N10
\rf_block|rs_data~38\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rs_data~38_combout\ = (\rs_address[0]~input_o\ & (((\rs_address[1]~input_o\)))) # (!\rs_address[0]~input_o\ & ((\rs_address[1]~input_o\ & ((\rf_block|rs_data~35_combout\))) # (!\rs_address[1]~input_o\ & (\rf_block|rs_data~37_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rs_data~37_combout\,
	datab => \rs_address[0]~input_o\,
	datac => \rs_address[1]~input_o\,
	datad => \rf_block|rs_data~35_combout\,
	combout => \rf_block|rs_data~38_combout\);

-- Location: LCCOMB_X17_Y21_N18
\rf_block|rs_data~39\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rs_data~39_combout\ = (\rs_address[2]~input_o\ & (((\rs_address[3]~input_o\)))) # (!\rs_address[2]~input_o\ & ((\rs_address[3]~input_o\ & ((\rf_block|registers[11][3]~q\))) # (!\rs_address[3]~input_o\ & (\rf_block|registers[3][3]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs_address[2]~input_o\,
	datab => \rf_block|registers[3][3]~q\,
	datac => \rs_address[3]~input_o\,
	datad => \rf_block|registers[11][3]~q\,
	combout => \rf_block|rs_data~39_combout\);

-- Location: LCCOMB_X16_Y19_N20
\rf_block|rs_data~40\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rs_data~40_combout\ = (\rf_block|rs_data~39_combout\ & (((\rf_block|registers[15][3]~q\) # (!\rs_address[2]~input_o\)))) # (!\rf_block|rs_data~39_combout\ & (\rf_block|registers[7][3]~q\ & (\rs_address[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110000101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers[7][3]~q\,
	datab => \rf_block|rs_data~39_combout\,
	datac => \rs_address[2]~input_o\,
	datad => \rf_block|registers[15][3]~q\,
	combout => \rf_block|rs_data~40_combout\);

-- Location: LCCOMB_X14_Y19_N24
\rf_block|rs_data~32\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rs_data~32_combout\ = (\rs_address[3]~input_o\ & ((\rf_block|registers[9][3]~q\) # ((\rs_address[2]~input_o\)))) # (!\rs_address[3]~input_o\ & (((\rf_block|registers[1][3]~q\ & !\rs_address[2]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers[9][3]~q\,
	datab => \rf_block|registers[1][3]~q\,
	datac => \rs_address[3]~input_o\,
	datad => \rs_address[2]~input_o\,
	combout => \rf_block|rs_data~32_combout\);

-- Location: LCCOMB_X16_Y19_N4
\rf_block|rs_data~33\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rs_data~33_combout\ = (\rf_block|rs_data~32_combout\ & (((\rf_block|registers[13][3]~q\) # (!\rs_address[2]~input_o\)))) # (!\rf_block|rs_data~32_combout\ & (\rf_block|registers[5][3]~q\ & (\rs_address[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rs_data~32_combout\,
	datab => \rf_block|registers[5][3]~q\,
	datac => \rs_address[2]~input_o\,
	datad => \rf_block|registers[13][3]~q\,
	combout => \rf_block|rs_data~33_combout\);

-- Location: LCCOMB_X16_Y19_N6
\rf_block|rs_data~41\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rs_data~41_combout\ = (\rf_block|rs_data~38_combout\ & ((\rf_block|rs_data~40_combout\) # ((!\rs_address[0]~input_o\)))) # (!\rf_block|rs_data~38_combout\ & (((\rf_block|rs_data~33_combout\ & \rs_address[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rs_data~38_combout\,
	datab => \rf_block|rs_data~40_combout\,
	datac => \rf_block|rs_data~33_combout\,
	datad => \rs_address[0]~input_o\,
	combout => \rf_block|rs_data~41_combout\);

-- Location: LCCOMB_X22_Y19_N30
\rf_block|rs_data[3]~SCLR_LUT\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rs_data[3]~SCLR_LUT_combout\ = (!\reset~input_o\ & \rf_block|rs_data~41_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datad => \rf_block|rs_data~41_combout\,
	combout => \rf_block|rs_data[3]~SCLR_LUT_combout\);

-- Location: FF_X22_Y19_N7
\rf_block|rs_data[3]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	asdata => \rf_block|rs_data[3]~SCLR_LUT_combout\,
	sload => VCC,
	ena => \rf_block|rs_data[7]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|rs_data[3]~_Duplicate_1_q\);

-- Location: LCCOMB_X24_Y19_N22
\alu_block|Add0~38\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Add0~38_combout\ = (!\rf_block|rs_data[3]~_Duplicate_1_q\ & (\alu_block|Div0|auto_generated|divider|divider|selnose[27]~0_combout\ & !\rf_block|rs_data[2]~_Duplicate_1_q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rs_data[3]~_Duplicate_1_q\,
	datac => \alu_block|Div0|auto_generated|divider|divider|selnose[27]~0_combout\,
	datad => \rf_block|rs_data[2]~_Duplicate_1_q\,
	combout => \alu_block|Add0~38_combout\);

-- Location: LCCOMB_X24_Y20_N0
\alu_block|Add0~39\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Add0~39_combout\ = (!\rf_block|rs_data[1]~_Duplicate_1_q\ & (\alu_select[0]~input_o\ & ((\rf_block|rt_data[7]~_Duplicate_1_q\) # (!\rf_block|rs_data[0]~_Duplicate_1_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rt_data[7]~_Duplicate_1_q\,
	datab => \rf_block|rs_data[1]~_Duplicate_1_q\,
	datac => \alu_select[0]~input_o\,
	datad => \rf_block|rs_data[0]~_Duplicate_1_q\,
	combout => \alu_block|Add0~39_combout\);

-- Location: LCCOMB_X24_Y20_N30
\alu_block|Add0~40\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Add0~40_combout\ = (\alu_select[0]~input_o\ & (\alu_block|Add0~38_combout\ & ((\alu_block|Add0~39_combout\)))) # (!\alu_select[0]~input_o\ & ((\alu_block|Mult0|auto_generated|mac_out2~DATAOUT7\) # ((\alu_block|Add0~38_combout\ & 
-- \alu_block|Add0~39_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \alu_select[0]~input_o\,
	datab => \alu_block|Add0~38_combout\,
	datac => \alu_block|Mult0|auto_generated|mac_out2~DATAOUT7\,
	datad => \alu_block|Add0~39_combout\,
	combout => \alu_block|Add0~40_combout\);

-- Location: LCCOMB_X25_Y19_N2
\alu_block|Add0~41\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Add0~41_combout\ = \rf_block|rs_data[7]~_Duplicate_1_q\ $ (((\alu_select[1]~input_o\) # (\alu_select[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \alu_select[1]~input_o\,
	datab => \alu_select[0]~input_o\,
	datad => \rf_block|rs_data[7]~_Duplicate_1_q\,
	combout => \alu_block|Add0~41_combout\);

-- Location: LCCOMB_X25_Y19_N22
\alu_block|Add0~42\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Add0~42_combout\ = \rf_block|rt_data[7]~_Duplicate_1_q\ $ (\alu_block|Add0~36\ $ (!\alu_block|Add0~41_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010100101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rt_data[7]~_Duplicate_1_q\,
	datad => \alu_block|Add0~41_combout\,
	cin => \alu_block|Add0~36\,
	combout => \alu_block|Add0~42_combout\);

-- Location: LCCOMB_X24_Y19_N0
\alu_block|Add0~44\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Add0~44_combout\ = (\alu_select[1]~input_o\ & (\alu_block|Add0~40_combout\)) # (!\alu_select[1]~input_o\ & ((\alu_block|Add0~42_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \alu_select[1]~input_o\,
	datac => \alu_block|Add0~40_combout\,
	datad => \alu_block|Add0~42_combout\,
	combout => \alu_block|Add0~44_combout\);

-- Location: FF_X24_Y19_N1
\alu_block|alu_out[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \alu_block|Add0~44_combout\,
	sclr => \reset~input_o\,
	ena => \pc_nzp_block|new_pc[7]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \alu_block|alu_out\(7));

-- Location: LCCOMB_X19_Y19_N24
\rf_block|registers~43\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers~43_combout\ = (\reg_input_mux[0]~input_o\ & ((\lsu_block|lsu_out\(7)))) # (!\reg_input_mux[0]~input_o\ & (\alu_block|alu_out\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \alu_block|alu_out\(7),
	datab => \lsu_block|lsu_out\(7),
	datad => \reg_input_mux[0]~input_o\,
	combout => \rf_block|registers~43_combout\);

-- Location: LCCOMB_X17_Y19_N22
\rf_block|registers[5][7]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[5][7]~feeder_combout\ = \rf_block|registers~43_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rf_block|registers~43_combout\,
	combout => \rf_block|registers[5][7]~feeder_combout\);

-- Location: FF_X17_Y19_N23
\rf_block|registers[5][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[5][7]~feeder_combout\,
	asdata => \immediate[7]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[5][7]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[5][7]~q\);

-- Location: LCCOMB_X19_Y19_N14
\rf_block|rs_data~72\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rs_data~72_combout\ = (\rs_address[3]~input_o\ & ((\rf_block|registers[9][7]~q\) # ((\rs_address[2]~input_o\)))) # (!\rs_address[3]~input_o\ & (((!\rs_address[2]~input_o\ & \rf_block|registers[1][7]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs_address[3]~input_o\,
	datab => \rf_block|registers[9][7]~q\,
	datac => \rs_address[2]~input_o\,
	datad => \rf_block|registers[1][7]~q\,
	combout => \rf_block|rs_data~72_combout\);

-- Location: LCCOMB_X19_Y19_N12
\rf_block|rs_data~73\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rs_data~73_combout\ = (\rf_block|rs_data~72_combout\ & (((\rf_block|registers[13][7]~q\) # (!\rs_address[2]~input_o\)))) # (!\rf_block|rs_data~72_combout\ & (\rf_block|registers[5][7]~q\ & (\rs_address[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110000101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers[5][7]~q\,
	datab => \rf_block|rs_data~72_combout\,
	datac => \rs_address[2]~input_o\,
	datad => \rf_block|registers[13][7]~q\,
	combout => \rf_block|rs_data~73_combout\);

-- Location: LCCOMB_X16_Y20_N18
\rf_block|rs_data~74\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rs_data~74_combout\ = (\rs_address[3]~input_o\ & (((\rs_address[2]~input_o\)))) # (!\rs_address[3]~input_o\ & ((\rs_address[2]~input_o\ & ((\rf_block|registers[6][7]~q\))) # (!\rs_address[2]~input_o\ & (\rf_block|registers[2][7]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers[2][7]~q\,
	datab => \rf_block|registers[6][7]~q\,
	datac => \rs_address[3]~input_o\,
	datad => \rs_address[2]~input_o\,
	combout => \rf_block|rs_data~74_combout\);

-- Location: LCCOMB_X16_Y20_N4
\rf_block|rs_data~75\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rs_data~75_combout\ = (\rs_address[3]~input_o\ & ((\rf_block|rs_data~74_combout\ & (\rf_block|registers[14][7]~q\)) # (!\rf_block|rs_data~74_combout\ & ((\rf_block|registers[10][7]~q\))))) # (!\rs_address[3]~input_o\ & 
-- (((\rf_block|rs_data~74_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers[14][7]~q\,
	datab => \rf_block|registers[10][7]~q\,
	datac => \rs_address[3]~input_o\,
	datad => \rf_block|rs_data~74_combout\,
	combout => \rf_block|rs_data~75_combout\);

-- Location: LCCOMB_X17_Y18_N16
\rf_block|rs_data~76\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rs_data~76_combout\ = (\rs_address[3]~input_o\ & (((\rs_address[2]~input_o\)))) # (!\rs_address[3]~input_o\ & ((\rs_address[2]~input_o\ & (\rf_block|registers[4][7]~q\)) # (!\rs_address[2]~input_o\ & ((\rf_block|registers[0][7]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs_address[3]~input_o\,
	datab => \rf_block|registers[4][7]~q\,
	datac => \rs_address[2]~input_o\,
	datad => \rf_block|registers[0][7]~q\,
	combout => \rf_block|rs_data~76_combout\);

-- Location: LCCOMB_X19_Y19_N10
\rf_block|rs_data~77\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rs_data~77_combout\ = (\rf_block|rs_data~76_combout\ & (((\rf_block|registers[12][7]~q\) # (!\rs_address[3]~input_o\)))) # (!\rf_block|rs_data~76_combout\ & (\rf_block|registers[8][7]~q\ & (\rs_address[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rs_data~76_combout\,
	datab => \rf_block|registers[8][7]~q\,
	datac => \rs_address[3]~input_o\,
	datad => \rf_block|registers[12][7]~q\,
	combout => \rf_block|rs_data~77_combout\);

-- Location: LCCOMB_X19_Y19_N4
\rf_block|rs_data~78\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rs_data~78_combout\ = (\rs_address[0]~input_o\ & (((\rs_address[1]~input_o\)))) # (!\rs_address[0]~input_o\ & ((\rs_address[1]~input_o\ & (\rf_block|rs_data~75_combout\)) # (!\rs_address[1]~input_o\ & ((\rf_block|rs_data~77_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rs_data~75_combout\,
	datab => \rs_address[0]~input_o\,
	datac => \rs_address[1]~input_o\,
	datad => \rf_block|rs_data~77_combout\,
	combout => \rf_block|rs_data~78_combout\);

-- Location: LCCOMB_X19_Y19_N26
\rf_block|rs_data~79\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rs_data~79_combout\ = (\rs_address[3]~input_o\ & ((\rf_block|registers[11][7]~q\) # ((\rs_address[2]~input_o\)))) # (!\rs_address[3]~input_o\ & (((\rf_block|registers[3][7]~q\ & !\rs_address[2]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs_address[3]~input_o\,
	datab => \rf_block|registers[11][7]~q\,
	datac => \rf_block|registers[3][7]~q\,
	datad => \rs_address[2]~input_o\,
	combout => \rf_block|rs_data~79_combout\);

-- Location: LCCOMB_X19_Y19_N28
\rf_block|rs_data~80\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rs_data~80_combout\ = (\rf_block|rs_data~79_combout\ & (((\rf_block|registers[15][7]~q\) # (!\rs_address[2]~input_o\)))) # (!\rf_block|rs_data~79_combout\ & (\rf_block|registers[7][7]~q\ & (\rs_address[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rs_data~79_combout\,
	datab => \rf_block|registers[7][7]~q\,
	datac => \rs_address[2]~input_o\,
	datad => \rf_block|registers[15][7]~q\,
	combout => \rf_block|rs_data~80_combout\);

-- Location: LCCOMB_X19_Y19_N30
\rf_block|rs_data~81\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rs_data~81_combout\ = (\rs_address[0]~input_o\ & ((\rf_block|rs_data~78_combout\ & ((\rf_block|rs_data~80_combout\))) # (!\rf_block|rs_data~78_combout\ & (\rf_block|rs_data~73_combout\)))) # (!\rs_address[0]~input_o\ & 
-- (((\rf_block|rs_data~78_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100000111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rs_data~73_combout\,
	datab => \rs_address[0]~input_o\,
	datac => \rf_block|rs_data~78_combout\,
	datad => \rf_block|rs_data~80_combout\,
	combout => \rf_block|rs_data~81_combout\);

-- Location: LCCOMB_X19_Y19_N2
\rf_block|rs_data[7]~SCLR_LUT\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rs_data[7]~SCLR_LUT_combout\ = (\rf_block|rs_data~81_combout\ & !\reset~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rs_data~81_combout\,
	datac => \reset~input_o\,
	combout => \rf_block|rs_data[7]~SCLR_LUT_combout\);

-- Location: FF_X22_Y19_N13
\rf_block|rs_data[7]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	asdata => \rf_block|rs_data[7]~SCLR_LUT_combout\,
	sload => VCC,
	ena => \rf_block|rs_data[7]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|rs_data[7]~_Duplicate_1_q\);

-- Location: LCCOMB_X24_Y17_N12
\alu_block|Div0|auto_generated|divider|divider|StageOut[45]~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Div0|auto_generated|divider|divider|StageOut[45]~16_combout\ = (\alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\ & (((\alu_block|Div0|auto_generated|divider|divider|StageOut[36]~11_combout\)))) # 
-- (!\alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\ & ((\alu_block|Div0|auto_generated|divider|divider|selnose[45]~2_combout\ & ((\alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~10_combout\))) # 
-- (!\alu_block|Div0|auto_generated|divider|divider|selnose[45]~2_combout\ & (\alu_block|Div0|auto_generated|divider|divider|StageOut[36]~11_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\,
	datab => \alu_block|Div0|auto_generated|divider|divider|selnose[45]~2_combout\,
	datac => \alu_block|Div0|auto_generated|divider|divider|StageOut[36]~11_combout\,
	datad => \alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~10_combout\,
	combout => \alu_block|Div0|auto_generated|divider|divider|StageOut[45]~16_combout\);

-- Location: LCCOMB_X24_Y17_N2
\alu_block|Div0|auto_generated|divider|divider|StageOut[44]~17\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Div0|auto_generated|divider|divider|StageOut[44]~17_combout\ = (\alu_block|Div0|auto_generated|divider|divider|selnose[45]~2_combout\ & ((\alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\ & 
-- ((\alu_block|Div0|auto_generated|divider|divider|StageOut[35]~12_combout\))) # (!\alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\ & (\alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~8_combout\)))) # 
-- (!\alu_block|Div0|auto_generated|divider|divider|selnose[45]~2_combout\ & (((\alu_block|Div0|auto_generated|divider|divider|StageOut[35]~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~8_combout\,
	datab => \alu_block|Div0|auto_generated|divider|divider|selnose[45]~2_combout\,
	datac => \alu_block|Div0|auto_generated|divider|divider|StageOut[35]~12_combout\,
	datad => \alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\,
	combout => \alu_block|Div0|auto_generated|divider|divider|StageOut[44]~17_combout\);

-- Location: LCCOMB_X24_Y17_N4
\alu_block|Div0|auto_generated|divider|divider|StageOut[43]~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Div0|auto_generated|divider|divider|StageOut[43]~18_combout\ = (\alu_block|Div0|auto_generated|divider|divider|selnose[45]~2_combout\ & ((\alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\ & 
-- ((\alu_block|Div0|auto_generated|divider|divider|StageOut[34]~13_combout\))) # (!\alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\ & (\alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~6_combout\)))) # 
-- (!\alu_block|Div0|auto_generated|divider|divider|selnose[45]~2_combout\ & (((\alu_block|Div0|auto_generated|divider|divider|StageOut[34]~13_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~6_combout\,
	datab => \alu_block|Div0|auto_generated|divider|divider|StageOut[34]~13_combout\,
	datac => \alu_block|Div0|auto_generated|divider|divider|selnose[45]~2_combout\,
	datad => \alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\,
	combout => \alu_block|Div0|auto_generated|divider|divider|StageOut[43]~18_combout\);

-- Location: LCCOMB_X24_Y17_N30
\alu_block|Div0|auto_generated|divider|divider|StageOut[42]~19\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Div0|auto_generated|divider|divider|StageOut[42]~19_combout\ = (\alu_block|Div0|auto_generated|divider|divider|selnose[45]~2_combout\ & ((\alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\ & 
-- (\alu_block|Div0|auto_generated|divider|divider|StageOut[33]~14_combout\)) # (!\alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\ & ((\alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~4_combout\))))) # 
-- (!\alu_block|Div0|auto_generated|divider|divider|selnose[45]~2_combout\ & (\alu_block|Div0|auto_generated|divider|divider|StageOut[33]~14_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \alu_block|Div0|auto_generated|divider|divider|selnose[45]~2_combout\,
	datab => \alu_block|Div0|auto_generated|divider|divider|StageOut[33]~14_combout\,
	datac => \alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~4_combout\,
	datad => \alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\,
	combout => \alu_block|Div0|auto_generated|divider|divider|StageOut[42]~19_combout\);

-- Location: LCCOMB_X24_Y17_N0
\alu_block|Div0|auto_generated|divider|divider|StageOut[41]~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Div0|auto_generated|divider|divider|StageOut[41]~20_combout\ = (\alu_block|Div0|auto_generated|divider|divider|selnose[45]~2_combout\ & ((\alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\ & 
-- (\alu_block|Div0|auto_generated|divider|divider|StageOut[32]~15_combout\)) # (!\alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\ & ((\alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~2_combout\))))) # 
-- (!\alu_block|Div0|auto_generated|divider|divider|selnose[45]~2_combout\ & (\alu_block|Div0|auto_generated|divider|divider|StageOut[32]~15_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \alu_block|Div0|auto_generated|divider|divider|selnose[45]~2_combout\,
	datab => \alu_block|Div0|auto_generated|divider|divider|StageOut[32]~15_combout\,
	datac => \alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~2_combout\,
	datad => \alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\,
	combout => \alu_block|Div0|auto_generated|divider|divider|StageOut[41]~20_combout\);

-- Location: LCCOMB_X24_Y17_N10
\alu_block|Div0|auto_generated|divider|divider|StageOut[40]~21\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Div0|auto_generated|divider|divider|StageOut[40]~21_combout\ = (\alu_block|Div0|auto_generated|divider|divider|selnose[45]~2_combout\ & ((\alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\ & 
-- ((\rf_block|rt_data[2]~_Duplicate_1_q\))) # (!\alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\ & (\alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[0]~0_combout\)))) # 
-- (!\alu_block|Div0|auto_generated|divider|divider|selnose[45]~2_combout\ & (((\rf_block|rt_data[2]~_Duplicate_1_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[0]~0_combout\,
	datab => \rf_block|rt_data[2]~_Duplicate_1_q\,
	datac => \alu_block|Div0|auto_generated|divider|divider|selnose[45]~2_combout\,
	datad => \alu_block|Div0|auto_generated|divider|divider|add_sub_5_result_int[6]~12_combout\,
	combout => \alu_block|Div0|auto_generated|divider|divider|StageOut[40]~21_combout\);

-- Location: LCCOMB_X24_Y17_N14
\alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[0]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[0]~0_combout\ = (\rf_block|rt_data[1]~_Duplicate_1_q\ & ((GND) # (!\rf_block|rs_data[0]~_Duplicate_1_q\))) # (!\rf_block|rt_data[1]~_Duplicate_1_q\ & (\rf_block|rs_data[0]~_Duplicate_1_q\ 
-- $ (GND)))
-- \alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[0]~1\ = CARRY((\rf_block|rt_data[1]~_Duplicate_1_q\) # (!\rf_block|rs_data[0]~_Duplicate_1_q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rt_data[1]~_Duplicate_1_q\,
	datab => \rf_block|rs_data[0]~_Duplicate_1_q\,
	datad => VCC,
	combout => \alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[0]~0_combout\,
	cout => \alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[0]~1\);

-- Location: LCCOMB_X24_Y17_N16
\alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[1]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[1]~2_combout\ = (\alu_block|Div0|auto_generated|divider|divider|StageOut[40]~21_combout\ & ((\rf_block|rs_data[1]~_Duplicate_1_q\ & 
-- (!\alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[0]~1\)) # (!\rf_block|rs_data[1]~_Duplicate_1_q\ & (\alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[0]~1\ & VCC)))) # 
-- (!\alu_block|Div0|auto_generated|divider|divider|StageOut[40]~21_combout\ & ((\rf_block|rs_data[1]~_Duplicate_1_q\ & ((\alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[0]~1\) # (GND))) # (!\rf_block|rs_data[1]~_Duplicate_1_q\ & 
-- (!\alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[0]~1\))))
-- \alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[1]~3\ = CARRY((\alu_block|Div0|auto_generated|divider|divider|StageOut[40]~21_combout\ & (\rf_block|rs_data[1]~_Duplicate_1_q\ & 
-- !\alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[0]~1\)) # (!\alu_block|Div0|auto_generated|divider|divider|StageOut[40]~21_combout\ & ((\rf_block|rs_data[1]~_Duplicate_1_q\) # 
-- (!\alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[0]~1\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \alu_block|Div0|auto_generated|divider|divider|StageOut[40]~21_combout\,
	datab => \rf_block|rs_data[1]~_Duplicate_1_q\,
	datad => VCC,
	cin => \alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[0]~1\,
	combout => \alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[1]~2_combout\,
	cout => \alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[1]~3\);

-- Location: LCCOMB_X24_Y17_N18
\alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[2]~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[2]~4_combout\ = ((\rf_block|rs_data[2]~_Duplicate_1_q\ $ (\alu_block|Div0|auto_generated|divider|divider|StageOut[41]~20_combout\ $ 
-- (\alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[1]~3\)))) # (GND)
-- \alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[2]~5\ = CARRY((\rf_block|rs_data[2]~_Duplicate_1_q\ & (\alu_block|Div0|auto_generated|divider|divider|StageOut[41]~20_combout\ & 
-- !\alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[1]~3\)) # (!\rf_block|rs_data[2]~_Duplicate_1_q\ & ((\alu_block|Div0|auto_generated|divider|divider|StageOut[41]~20_combout\) # 
-- (!\alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[1]~3\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rs_data[2]~_Duplicate_1_q\,
	datab => \alu_block|Div0|auto_generated|divider|divider|StageOut[41]~20_combout\,
	datad => VCC,
	cin => \alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[1]~3\,
	combout => \alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[2]~4_combout\,
	cout => \alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[2]~5\);

-- Location: LCCOMB_X24_Y17_N20
\alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[3]~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[3]~6_combout\ = (\alu_block|Div0|auto_generated|divider|divider|StageOut[42]~19_combout\ & ((\rf_block|rs_data[3]~_Duplicate_1_q\ & 
-- (!\alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[2]~5\)) # (!\rf_block|rs_data[3]~_Duplicate_1_q\ & (\alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[2]~5\ & VCC)))) # 
-- (!\alu_block|Div0|auto_generated|divider|divider|StageOut[42]~19_combout\ & ((\rf_block|rs_data[3]~_Duplicate_1_q\ & ((\alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[2]~5\) # (GND))) # (!\rf_block|rs_data[3]~_Duplicate_1_q\ & 
-- (!\alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[2]~5\))))
-- \alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[3]~7\ = CARRY((\alu_block|Div0|auto_generated|divider|divider|StageOut[42]~19_combout\ & (\rf_block|rs_data[3]~_Duplicate_1_q\ & 
-- !\alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[2]~5\)) # (!\alu_block|Div0|auto_generated|divider|divider|StageOut[42]~19_combout\ & ((\rf_block|rs_data[3]~_Duplicate_1_q\) # 
-- (!\alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[2]~5\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \alu_block|Div0|auto_generated|divider|divider|StageOut[42]~19_combout\,
	datab => \rf_block|rs_data[3]~_Duplicate_1_q\,
	datad => VCC,
	cin => \alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[2]~5\,
	combout => \alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[3]~6_combout\,
	cout => \alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[3]~7\);

-- Location: LCCOMB_X24_Y17_N22
\alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[4]~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[4]~8_combout\ = ((\rf_block|rs_data[4]~_Duplicate_1_q\ $ (\alu_block|Div0|auto_generated|divider|divider|StageOut[43]~18_combout\ $ 
-- (\alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[3]~7\)))) # (GND)
-- \alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[4]~9\ = CARRY((\rf_block|rs_data[4]~_Duplicate_1_q\ & (\alu_block|Div0|auto_generated|divider|divider|StageOut[43]~18_combout\ & 
-- !\alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[3]~7\)) # (!\rf_block|rs_data[4]~_Duplicate_1_q\ & ((\alu_block|Div0|auto_generated|divider|divider|StageOut[43]~18_combout\) # 
-- (!\alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[3]~7\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rs_data[4]~_Duplicate_1_q\,
	datab => \alu_block|Div0|auto_generated|divider|divider|StageOut[43]~18_combout\,
	datad => VCC,
	cin => \alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[3]~7\,
	combout => \alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[4]~8_combout\,
	cout => \alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[4]~9\);

-- Location: LCCOMB_X24_Y17_N24
\alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~10_combout\ = (\rf_block|rs_data[5]~_Duplicate_1_q\ & ((\alu_block|Div0|auto_generated|divider|divider|StageOut[44]~17_combout\ & 
-- (!\alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[4]~9\)) # (!\alu_block|Div0|auto_generated|divider|divider|StageOut[44]~17_combout\ & ((\alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[4]~9\) # (GND))))) # 
-- (!\rf_block|rs_data[5]~_Duplicate_1_q\ & ((\alu_block|Div0|auto_generated|divider|divider|StageOut[44]~17_combout\ & (\alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[4]~9\ & VCC)) # 
-- (!\alu_block|Div0|auto_generated|divider|divider|StageOut[44]~17_combout\ & (!\alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[4]~9\))))
-- \alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~11\ = CARRY((\rf_block|rs_data[5]~_Duplicate_1_q\ & ((!\alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[4]~9\) # 
-- (!\alu_block|Div0|auto_generated|divider|divider|StageOut[44]~17_combout\))) # (!\rf_block|rs_data[5]~_Duplicate_1_q\ & (!\alu_block|Div0|auto_generated|divider|divider|StageOut[44]~17_combout\ & 
-- !\alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[4]~9\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rs_data[5]~_Duplicate_1_q\,
	datab => \alu_block|Div0|auto_generated|divider|divider|StageOut[44]~17_combout\,
	datad => VCC,
	cin => \alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[4]~9\,
	combout => \alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~10_combout\,
	cout => \alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~11\);

-- Location: LCCOMB_X24_Y17_N26
\alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[6]~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[6]~12_combout\ = ((\alu_block|Div0|auto_generated|divider|divider|StageOut[45]~16_combout\ $ (\rf_block|rs_data[6]~_Duplicate_1_q\ $ 
-- (\alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~11\)))) # (GND)
-- \alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[6]~13\ = CARRY((\alu_block|Div0|auto_generated|divider|divider|StageOut[45]~16_combout\ & ((!\alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~11\) # 
-- (!\rf_block|rs_data[6]~_Duplicate_1_q\))) # (!\alu_block|Div0|auto_generated|divider|divider|StageOut[45]~16_combout\ & (!\rf_block|rs_data[6]~_Duplicate_1_q\ & !\alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~11\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \alu_block|Div0|auto_generated|divider|divider|StageOut[45]~16_combout\,
	datab => \rf_block|rs_data[6]~_Duplicate_1_q\,
	datad => VCC,
	cin => \alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~11\,
	combout => \alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[6]~12_combout\,
	cout => \alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[6]~13\);

-- Location: LCCOMB_X24_Y17_N28
\alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[7]~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[7]~14_combout\ = !\alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[6]~13\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[6]~13\,
	combout => \alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[7]~14_combout\);

-- Location: LCCOMB_X24_Y19_N10
\alu_block|Add0~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Add0~8_combout\ = (\alu_select[0]~input_o\ & (!\rf_block|rs_data[7]~_Duplicate_1_q\ & ((!\alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[7]~14_combout\)))) # (!\alu_select[0]~input_o\ & 
-- (((\alu_block|Mult0|auto_generated|mac_out2~DATAOUT1\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000001110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rs_data[7]~_Duplicate_1_q\,
	datab => \alu_select[0]~input_o\,
	datac => \alu_block|Mult0|auto_generated|mac_out2~DATAOUT1\,
	datad => \alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[7]~14_combout\,
	combout => \alu_block|Add0~8_combout\);

-- Location: LCCOMB_X24_Y19_N24
\alu_block|Add0~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Add0~12_combout\ = (\alu_select[1]~input_o\ & ((\alu_block|Add0~8_combout\))) # (!\alu_select[1]~input_o\ & (\alu_block|Add0~10_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \alu_select[1]~input_o\,
	datac => \alu_block|Add0~10_combout\,
	datad => \alu_block|Add0~8_combout\,
	combout => \alu_block|Add0~12_combout\);

-- Location: FF_X24_Y19_N25
\alu_block|alu_out[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \alu_block|Add0~12_combout\,
	sclr => \reset~input_o\,
	ena => \pc_nzp_block|new_pc[7]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \alu_block|alu_out\(1));

-- Location: LCCOMB_X18_Y21_N20
\rf_block|registers~24\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers~24_combout\ = (\reg_input_mux[0]~input_o\ & ((\lsu_block|lsu_out\(1)))) # (!\reg_input_mux[0]~input_o\ & (\alu_block|alu_out\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reg_input_mux[0]~input_o\,
	datab => \alu_block|alu_out\(1),
	datad => \lsu_block|lsu_out\(1),
	combout => \rf_block|registers~24_combout\);

-- Location: LCCOMB_X17_Y19_N12
\rf_block|registers[5][1]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers[5][1]~feeder_combout\ = \rf_block|registers~24_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rf_block|registers~24_combout\,
	combout => \rf_block|registers[5][1]~feeder_combout\);

-- Location: FF_X17_Y19_N13
\rf_block|registers[5][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers[5][1]~feeder_combout\,
	asdata => \immediate[1]~input_o\,
	sclr => \reset~input_o\,
	sload => \reg_input_mux[1]~input_o\,
	ena => \rf_block|registers[5][7]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[5][1]~q\);

-- Location: LCCOMB_X17_Y21_N12
\rf_block|rt_data~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rt_data~12_combout\ = (\rt_address[3]~input_o\ & (\rt_address[2]~input_o\)) # (!\rt_address[3]~input_o\ & ((\rt_address[2]~input_o\ & (\rf_block|registers[5][1]~q\)) # (!\rt_address[2]~input_o\ & ((\rf_block|registers[1][1]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rt_address[3]~input_o\,
	datab => \rt_address[2]~input_o\,
	datac => \rf_block|registers[5][1]~q\,
	datad => \rf_block|registers[1][1]~q\,
	combout => \rf_block|rt_data~12_combout\);

-- Location: LCCOMB_X18_Y21_N14
\rf_block|rt_data~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rt_data~13_combout\ = (\rf_block|rt_data~12_combout\ & ((\rf_block|registers[13][1]~q\) # ((!\rt_address[3]~input_o\)))) # (!\rf_block|rt_data~12_combout\ & (((\rt_address[3]~input_o\ & \rf_block|registers[9][1]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101010001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rt_data~12_combout\,
	datab => \rf_block|registers[13][1]~q\,
	datac => \rt_address[3]~input_o\,
	datad => \rf_block|registers[9][1]~q\,
	combout => \rf_block|rt_data~13_combout\);

-- Location: LCCOMB_X17_Y21_N6
\rf_block|rt_data~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rt_data~14_combout\ = (\rt_address[3]~input_o\ & ((\rf_block|registers[8][1]~q\) # ((\rt_address[2]~input_o\)))) # (!\rt_address[3]~input_o\ & (((!\rt_address[2]~input_o\ & \rf_block|registers[0][1]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers[8][1]~q\,
	datab => \rt_address[3]~input_o\,
	datac => \rt_address[2]~input_o\,
	datad => \rf_block|registers[0][1]~q\,
	combout => \rf_block|rt_data~14_combout\);

-- Location: LCCOMB_X17_Y21_N8
\rf_block|rt_data~15\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rt_data~15_combout\ = (\rf_block|rt_data~14_combout\ & (((\rf_block|registers[12][1]~q\) # (!\rt_address[2]~input_o\)))) # (!\rf_block|rt_data~14_combout\ & (\rf_block|registers[4][1]~q\ & (\rt_address[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rt_data~14_combout\,
	datab => \rf_block|registers[4][1]~q\,
	datac => \rt_address[2]~input_o\,
	datad => \rf_block|registers[12][1]~q\,
	combout => \rf_block|rt_data~15_combout\);

-- Location: LCCOMB_X18_Y21_N12
\rf_block|rt_data~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rt_data~16_combout\ = (\rt_address[0]~input_o\ & ((\rf_block|rt_data~13_combout\) # ((\rt_address[1]~input_o\)))) # (!\rt_address[0]~input_o\ & (((!\rt_address[1]~input_o\ & \rf_block|rt_data~15_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rt_address[0]~input_o\,
	datab => \rf_block|rt_data~13_combout\,
	datac => \rt_address[1]~input_o\,
	datad => \rf_block|rt_data~15_combout\,
	combout => \rf_block|rt_data~16_combout\);

-- Location: LCCOMB_X18_Y21_N6
\rf_block|rt_data~17\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rt_data~17_combout\ = (\rt_address[3]~input_o\ & (((\rt_address[2]~input_o\)))) # (!\rt_address[3]~input_o\ & ((\rt_address[2]~input_o\ & ((\rf_block|registers[7][1]~q\))) # (!\rt_address[2]~input_o\ & (\rf_block|registers[3][1]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rt_address[3]~input_o\,
	datab => \rf_block|registers[3][1]~q\,
	datac => \rt_address[2]~input_o\,
	datad => \rf_block|registers[7][1]~q\,
	combout => \rf_block|rt_data~17_combout\);

-- Location: LCCOMB_X18_Y21_N4
\rf_block|rt_data~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rt_data~18_combout\ = (\rt_address[3]~input_o\ & ((\rf_block|rt_data~17_combout\ & ((\rf_block|registers[15][1]~q\))) # (!\rf_block|rt_data~17_combout\ & (\rf_block|registers[11][1]~q\)))) # (!\rt_address[3]~input_o\ & 
-- (((\rf_block|rt_data~17_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers[11][1]~q\,
	datab => \rt_address[3]~input_o\,
	datac => \rf_block|registers[15][1]~q\,
	datad => \rf_block|rt_data~17_combout\,
	combout => \rf_block|rt_data~18_combout\);

-- Location: LCCOMB_X18_Y21_N10
\rf_block|rt_data~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rt_data~10_combout\ = (\rt_address[3]~input_o\ & (((\rt_address[2]~input_o\) # (\rf_block|registers[10][1]~q\)))) # (!\rt_address[3]~input_o\ & (\rf_block|registers[2][1]~q\ & (!\rt_address[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rt_address[3]~input_o\,
	datab => \rf_block|registers[2][1]~q\,
	datac => \rt_address[2]~input_o\,
	datad => \rf_block|registers[10][1]~q\,
	combout => \rf_block|rt_data~10_combout\);

-- Location: LCCOMB_X18_Y21_N28
\rf_block|rt_data~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rt_data~11_combout\ = (\rf_block|rt_data~10_combout\ & ((\rf_block|registers[14][1]~q\) # ((!\rt_address[2]~input_o\)))) # (!\rf_block|rt_data~10_combout\ & (((\rt_address[2]~input_o\ & \rf_block|registers[6][1]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101010001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rt_data~10_combout\,
	datab => \rf_block|registers[14][1]~q\,
	datac => \rt_address[2]~input_o\,
	datad => \rf_block|registers[6][1]~q\,
	combout => \rf_block|rt_data~11_combout\);

-- Location: LCCOMB_X18_Y21_N30
\rf_block|rt_data~19\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rt_data~19_combout\ = (\rf_block|rt_data~16_combout\ & (((\rf_block|rt_data~18_combout\)) # (!\rt_address[1]~input_o\))) # (!\rf_block|rt_data~16_combout\ & (\rt_address[1]~input_o\ & ((\rf_block|rt_data~11_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011010100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rt_data~16_combout\,
	datab => \rt_address[1]~input_o\,
	datac => \rf_block|rt_data~18_combout\,
	datad => \rf_block|rt_data~11_combout\,
	combout => \rf_block|rt_data~19_combout\);

-- Location: LCCOMB_X20_Y20_N8
\rf_block|rt_data[1]~SCLR_LUT\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rt_data[1]~SCLR_LUT_combout\ = (\rf_block|rt_data~19_combout\ & !\reset~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \rf_block|rt_data~19_combout\,
	datad => \reset~input_o\,
	combout => \rf_block|rt_data[1]~SCLR_LUT_combout\);

-- Location: LCCOMB_X25_Y19_N26
\alu_block|Add0~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Add0~5_combout\ = (\alu_select[1]~input_o\ & (!\alu_select[0]~input_o\ & ((\alu_block|Mult0|auto_generated|mac_out2~dataout\)))) # (!\alu_select[1]~input_o\ & (((\alu_block|Add0~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111001001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \alu_select[1]~input_o\,
	datab => \alu_select[0]~input_o\,
	datac => \alu_block|Add0~3_combout\,
	datad => \alu_block|Mult0|auto_generated|mac_out2~dataout\,
	combout => \alu_block|Add0~5_combout\);

-- Location: LCCOMB_X24_Y17_N8
\alu_block|Div0|auto_generated|divider|divider|StageOut[54]~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Div0|auto_generated|divider|divider|StageOut[54]~22_combout\ = (\rf_block|rs_data[7]~_Duplicate_1_q\ & (\alu_block|Div0|auto_generated|divider|divider|StageOut[45]~16_combout\)) # (!\rf_block|rs_data[7]~_Duplicate_1_q\ & 
-- ((\alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[7]~14_combout\ & (\alu_block|Div0|auto_generated|divider|divider|StageOut[45]~16_combout\)) # (!\alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[7]~14_combout\ & 
-- ((\alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[6]~12_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rs_data[7]~_Duplicate_1_q\,
	datab => \alu_block|Div0|auto_generated|divider|divider|StageOut[45]~16_combout\,
	datac => \alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[6]~12_combout\,
	datad => \alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[7]~14_combout\,
	combout => \alu_block|Div0|auto_generated|divider|divider|StageOut[54]~22_combout\);

-- Location: LCCOMB_X24_Y17_N6
\alu_block|Div0|auto_generated|divider|divider|StageOut[53]~23\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Div0|auto_generated|divider|divider|StageOut[53]~23_combout\ = (\rf_block|rs_data[7]~_Duplicate_1_q\ & (((\alu_block|Div0|auto_generated|divider|divider|StageOut[44]~17_combout\)))) # (!\rf_block|rs_data[7]~_Duplicate_1_q\ & 
-- ((\alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[7]~14_combout\ & ((\alu_block|Div0|auto_generated|divider|divider|StageOut[44]~17_combout\))) # (!\alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[7]~14_combout\ & 
-- (\alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rs_data[7]~_Duplicate_1_q\,
	datab => \alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[5]~10_combout\,
	datac => \alu_block|Div0|auto_generated|divider|divider|StageOut[44]~17_combout\,
	datad => \alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[7]~14_combout\,
	combout => \alu_block|Div0|auto_generated|divider|divider|StageOut[53]~23_combout\);

-- Location: LCCOMB_X25_Y17_N30
\alu_block|Div0|auto_generated|divider|divider|StageOut[52]~24\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Div0|auto_generated|divider|divider|StageOut[52]~24_combout\ = (\rf_block|rs_data[7]~_Duplicate_1_q\ & (((\alu_block|Div0|auto_generated|divider|divider|StageOut[43]~18_combout\)))) # (!\rf_block|rs_data[7]~_Duplicate_1_q\ & 
-- ((\alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[7]~14_combout\ & ((\alu_block|Div0|auto_generated|divider|divider|StageOut[43]~18_combout\))) # (!\alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[7]~14_combout\ & 
-- (\alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[4]~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rs_data[7]~_Duplicate_1_q\,
	datab => \alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[4]~8_combout\,
	datac => \alu_block|Div0|auto_generated|divider|divider|StageOut[43]~18_combout\,
	datad => \alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[7]~14_combout\,
	combout => \alu_block|Div0|auto_generated|divider|divider|StageOut[52]~24_combout\);

-- Location: LCCOMB_X25_Y17_N20
\alu_block|Div0|auto_generated|divider|divider|StageOut[51]~25\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Div0|auto_generated|divider|divider|StageOut[51]~25_combout\ = (\rf_block|rs_data[7]~_Duplicate_1_q\ & (((\alu_block|Div0|auto_generated|divider|divider|StageOut[42]~19_combout\)))) # (!\rf_block|rs_data[7]~_Duplicate_1_q\ & 
-- ((\alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[7]~14_combout\ & ((\alu_block|Div0|auto_generated|divider|divider|StageOut[42]~19_combout\))) # (!\alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[7]~14_combout\ & 
-- (\alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[3]~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rs_data[7]~_Duplicate_1_q\,
	datab => \alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[3]~6_combout\,
	datac => \alu_block|Div0|auto_generated|divider|divider|StageOut[42]~19_combout\,
	datad => \alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[7]~14_combout\,
	combout => \alu_block|Div0|auto_generated|divider|divider|StageOut[51]~25_combout\);

-- Location: LCCOMB_X25_Y17_N26
\alu_block|Div0|auto_generated|divider|divider|StageOut[50]~26\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Div0|auto_generated|divider|divider|StageOut[50]~26_combout\ = (\rf_block|rs_data[7]~_Duplicate_1_q\ & (((\alu_block|Div0|auto_generated|divider|divider|StageOut[41]~20_combout\)))) # (!\rf_block|rs_data[7]~_Duplicate_1_q\ & 
-- ((\alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[7]~14_combout\ & ((\alu_block|Div0|auto_generated|divider|divider|StageOut[41]~20_combout\))) # (!\alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[7]~14_combout\ & 
-- (\alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[2]~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rs_data[7]~_Duplicate_1_q\,
	datab => \alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[2]~4_combout\,
	datac => \alu_block|Div0|auto_generated|divider|divider|StageOut[41]~20_combout\,
	datad => \alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[7]~14_combout\,
	combout => \alu_block|Div0|auto_generated|divider|divider|StageOut[50]~26_combout\);

-- Location: LCCOMB_X25_Y17_N28
\alu_block|Div0|auto_generated|divider|divider|StageOut[49]~27\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Div0|auto_generated|divider|divider|StageOut[49]~27_combout\ = (\rf_block|rs_data[7]~_Duplicate_1_q\ & (\alu_block|Div0|auto_generated|divider|divider|StageOut[40]~21_combout\)) # (!\rf_block|rs_data[7]~_Duplicate_1_q\ & 
-- ((\alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[7]~14_combout\ & (\alu_block|Div0|auto_generated|divider|divider|StageOut[40]~21_combout\)) # (!\alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[7]~14_combout\ & 
-- ((\alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[1]~2_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \alu_block|Div0|auto_generated|divider|divider|StageOut[40]~21_combout\,
	datab => \rf_block|rs_data[7]~_Duplicate_1_q\,
	datac => \alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[1]~2_combout\,
	datad => \alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[7]~14_combout\,
	combout => \alu_block|Div0|auto_generated|divider|divider|StageOut[49]~27_combout\);

-- Location: LCCOMB_X25_Y17_N22
\alu_block|Div0|auto_generated|divider|divider|StageOut[48]~28\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Div0|auto_generated|divider|divider|StageOut[48]~28_combout\ = (\rf_block|rs_data[7]~_Duplicate_1_q\ & (((\rf_block|rt_data[1]~_Duplicate_1_q\)))) # (!\rf_block|rs_data[7]~_Duplicate_1_q\ & 
-- ((\alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[7]~14_combout\ & ((\rf_block|rt_data[1]~_Duplicate_1_q\))) # (!\alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[7]~14_combout\ & 
-- (\alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[0]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[0]~0_combout\,
	datab => \rf_block|rs_data[7]~_Duplicate_1_q\,
	datac => \rf_block|rt_data[1]~_Duplicate_1_q\,
	datad => \alu_block|Div0|auto_generated|divider|divider|add_sub_6_result_int[7]~14_combout\,
	combout => \alu_block|Div0|auto_generated|divider|divider|StageOut[48]~28_combout\);

-- Location: LCCOMB_X25_Y17_N0
\alu_block|Div0|auto_generated|divider|divider|add_sub_7_result_int[0]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Div0|auto_generated|divider|divider|add_sub_7_result_int[0]~1_cout\ = CARRY((\rf_block|rt_data[0]~_Duplicate_1_q\) # (!\rf_block|rs_data[0]~_Duplicate_1_q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rt_data[0]~_Duplicate_1_q\,
	datab => \rf_block|rs_data[0]~_Duplicate_1_q\,
	datad => VCC,
	cout => \alu_block|Div0|auto_generated|divider|divider|add_sub_7_result_int[0]~1_cout\);

-- Location: LCCOMB_X25_Y17_N2
\alu_block|Div0|auto_generated|divider|divider|add_sub_7_result_int[1]~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Div0|auto_generated|divider|divider|add_sub_7_result_int[1]~3_cout\ = CARRY((\alu_block|Div0|auto_generated|divider|divider|StageOut[48]~28_combout\ & (\rf_block|rs_data[1]~_Duplicate_1_q\ & 
-- !\alu_block|Div0|auto_generated|divider|divider|add_sub_7_result_int[0]~1_cout\)) # (!\alu_block|Div0|auto_generated|divider|divider|StageOut[48]~28_combout\ & ((\rf_block|rs_data[1]~_Duplicate_1_q\) # 
-- (!\alu_block|Div0|auto_generated|divider|divider|add_sub_7_result_int[0]~1_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \alu_block|Div0|auto_generated|divider|divider|StageOut[48]~28_combout\,
	datab => \rf_block|rs_data[1]~_Duplicate_1_q\,
	datad => VCC,
	cin => \alu_block|Div0|auto_generated|divider|divider|add_sub_7_result_int[0]~1_cout\,
	cout => \alu_block|Div0|auto_generated|divider|divider|add_sub_7_result_int[1]~3_cout\);

-- Location: LCCOMB_X25_Y17_N4
\alu_block|Div0|auto_generated|divider|divider|add_sub_7_result_int[2]~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Div0|auto_generated|divider|divider|add_sub_7_result_int[2]~5_cout\ = CARRY((\rf_block|rs_data[2]~_Duplicate_1_q\ & (\alu_block|Div0|auto_generated|divider|divider|StageOut[49]~27_combout\ & 
-- !\alu_block|Div0|auto_generated|divider|divider|add_sub_7_result_int[1]~3_cout\)) # (!\rf_block|rs_data[2]~_Duplicate_1_q\ & ((\alu_block|Div0|auto_generated|divider|divider|StageOut[49]~27_combout\) # 
-- (!\alu_block|Div0|auto_generated|divider|divider|add_sub_7_result_int[1]~3_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rs_data[2]~_Duplicate_1_q\,
	datab => \alu_block|Div0|auto_generated|divider|divider|StageOut[49]~27_combout\,
	datad => VCC,
	cin => \alu_block|Div0|auto_generated|divider|divider|add_sub_7_result_int[1]~3_cout\,
	cout => \alu_block|Div0|auto_generated|divider|divider|add_sub_7_result_int[2]~5_cout\);

-- Location: LCCOMB_X25_Y17_N6
\alu_block|Div0|auto_generated|divider|divider|add_sub_7_result_int[3]~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Div0|auto_generated|divider|divider|add_sub_7_result_int[3]~7_cout\ = CARRY((\alu_block|Div0|auto_generated|divider|divider|StageOut[50]~26_combout\ & (\rf_block|rs_data[3]~_Duplicate_1_q\ & 
-- !\alu_block|Div0|auto_generated|divider|divider|add_sub_7_result_int[2]~5_cout\)) # (!\alu_block|Div0|auto_generated|divider|divider|StageOut[50]~26_combout\ & ((\rf_block|rs_data[3]~_Duplicate_1_q\) # 
-- (!\alu_block|Div0|auto_generated|divider|divider|add_sub_7_result_int[2]~5_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \alu_block|Div0|auto_generated|divider|divider|StageOut[50]~26_combout\,
	datab => \rf_block|rs_data[3]~_Duplicate_1_q\,
	datad => VCC,
	cin => \alu_block|Div0|auto_generated|divider|divider|add_sub_7_result_int[2]~5_cout\,
	cout => \alu_block|Div0|auto_generated|divider|divider|add_sub_7_result_int[3]~7_cout\);

-- Location: LCCOMB_X25_Y17_N8
\alu_block|Div0|auto_generated|divider|divider|add_sub_7_result_int[4]~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Div0|auto_generated|divider|divider|add_sub_7_result_int[4]~9_cout\ = CARRY((\rf_block|rs_data[4]~_Duplicate_1_q\ & (\alu_block|Div0|auto_generated|divider|divider|StageOut[51]~25_combout\ & 
-- !\alu_block|Div0|auto_generated|divider|divider|add_sub_7_result_int[3]~7_cout\)) # (!\rf_block|rs_data[4]~_Duplicate_1_q\ & ((\alu_block|Div0|auto_generated|divider|divider|StageOut[51]~25_combout\) # 
-- (!\alu_block|Div0|auto_generated|divider|divider|add_sub_7_result_int[3]~7_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rs_data[4]~_Duplicate_1_q\,
	datab => \alu_block|Div0|auto_generated|divider|divider|StageOut[51]~25_combout\,
	datad => VCC,
	cin => \alu_block|Div0|auto_generated|divider|divider|add_sub_7_result_int[3]~7_cout\,
	cout => \alu_block|Div0|auto_generated|divider|divider|add_sub_7_result_int[4]~9_cout\);

-- Location: LCCOMB_X25_Y17_N10
\alu_block|Div0|auto_generated|divider|divider|add_sub_7_result_int[5]~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Div0|auto_generated|divider|divider|add_sub_7_result_int[5]~11_cout\ = CARRY((\alu_block|Div0|auto_generated|divider|divider|StageOut[52]~24_combout\ & (\rf_block|rs_data[5]~_Duplicate_1_q\ & 
-- !\alu_block|Div0|auto_generated|divider|divider|add_sub_7_result_int[4]~9_cout\)) # (!\alu_block|Div0|auto_generated|divider|divider|StageOut[52]~24_combout\ & ((\rf_block|rs_data[5]~_Duplicate_1_q\) # 
-- (!\alu_block|Div0|auto_generated|divider|divider|add_sub_7_result_int[4]~9_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \alu_block|Div0|auto_generated|divider|divider|StageOut[52]~24_combout\,
	datab => \rf_block|rs_data[5]~_Duplicate_1_q\,
	datad => VCC,
	cin => \alu_block|Div0|auto_generated|divider|divider|add_sub_7_result_int[4]~9_cout\,
	cout => \alu_block|Div0|auto_generated|divider|divider|add_sub_7_result_int[5]~11_cout\);

-- Location: LCCOMB_X25_Y17_N12
\alu_block|Div0|auto_generated|divider|divider|add_sub_7_result_int[6]~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Div0|auto_generated|divider|divider|add_sub_7_result_int[6]~13_cout\ = CARRY((\rf_block|rs_data[6]~_Duplicate_1_q\ & (\alu_block|Div0|auto_generated|divider|divider|StageOut[53]~23_combout\ & 
-- !\alu_block|Div0|auto_generated|divider|divider|add_sub_7_result_int[5]~11_cout\)) # (!\rf_block|rs_data[6]~_Duplicate_1_q\ & ((\alu_block|Div0|auto_generated|divider|divider|StageOut[53]~23_combout\) # 
-- (!\alu_block|Div0|auto_generated|divider|divider|add_sub_7_result_int[5]~11_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rs_data[6]~_Duplicate_1_q\,
	datab => \alu_block|Div0|auto_generated|divider|divider|StageOut[53]~23_combout\,
	datad => VCC,
	cin => \alu_block|Div0|auto_generated|divider|divider|add_sub_7_result_int[5]~11_cout\,
	cout => \alu_block|Div0|auto_generated|divider|divider|add_sub_7_result_int[6]~13_cout\);

-- Location: LCCOMB_X25_Y17_N14
\alu_block|Div0|auto_generated|divider|divider|add_sub_7_result_int[7]~15\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Div0|auto_generated|divider|divider|add_sub_7_result_int[7]~15_cout\ = CARRY((\alu_block|Div0|auto_generated|divider|divider|StageOut[54]~22_combout\ & (\rf_block|rs_data[7]~_Duplicate_1_q\ & 
-- !\alu_block|Div0|auto_generated|divider|divider|add_sub_7_result_int[6]~13_cout\)) # (!\alu_block|Div0|auto_generated|divider|divider|StageOut[54]~22_combout\ & ((\rf_block|rs_data[7]~_Duplicate_1_q\) # 
-- (!\alu_block|Div0|auto_generated|divider|divider|add_sub_7_result_int[6]~13_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \alu_block|Div0|auto_generated|divider|divider|StageOut[54]~22_combout\,
	datab => \rf_block|rs_data[7]~_Duplicate_1_q\,
	datad => VCC,
	cin => \alu_block|Div0|auto_generated|divider|divider|add_sub_7_result_int[6]~13_cout\,
	cout => \alu_block|Div0|auto_generated|divider|divider|add_sub_7_result_int[7]~15_cout\);

-- Location: LCCOMB_X25_Y17_N16
\alu_block|Div0|auto_generated|divider|divider|add_sub_7_result_int[8]~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Div0|auto_generated|divider|divider|add_sub_7_result_int[8]~16_combout\ = \alu_block|Div0|auto_generated|divider|divider|add_sub_7_result_int[7]~15_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \alu_block|Div0|auto_generated|divider|divider|add_sub_7_result_int[7]~15_cout\,
	combout => \alu_block|Div0|auto_generated|divider|divider|add_sub_7_result_int[8]~16_combout\);

-- Location: LCCOMB_X25_Y17_N18
\alu_block|Add0~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Add0~7_combout\ = (\alu_block|Add0~5_combout\) # ((\alu_select[1]~input_o\ & (\alu_select[0]~input_o\ & !\alu_block|Div0|auto_generated|divider|divider|add_sub_7_result_int[8]~16_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \alu_select[1]~input_o\,
	datab => \alu_select[0]~input_o\,
	datac => \alu_block|Add0~5_combout\,
	datad => \alu_block|Div0|auto_generated|divider|divider|add_sub_7_result_int[8]~16_combout\,
	combout => \alu_block|Add0~7_combout\);

-- Location: FF_X25_Y17_N19
\alu_block|alu_out[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \alu_block|Add0~7_combout\,
	sclr => \reset~input_o\,
	ena => \pc_nzp_block|new_pc[7]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \alu_block|alu_out\(0));

-- Location: LCCOMB_X20_Y21_N30
\rf_block|registers~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers~18_combout\ = (\rf_block|registers[13][4]~16_combout\ & (((\rf_block|registers[13][4]~17_combout\)))) # (!\rf_block|registers[13][4]~16_combout\ & ((\rf_block|registers[13][4]~17_combout\ & (\lsu_block|lsu_out\(0))) # 
-- (!\rf_block|registers[13][4]~17_combout\ & ((\alu_block|alu_out\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \lsu_block|lsu_out\(0),
	datab => \alu_block|alu_out\(0),
	datac => \rf_block|registers[13][4]~16_combout\,
	datad => \rf_block|registers[13][4]~17_combout\,
	combout => \rf_block|registers~18_combout\);

-- Location: LCCOMB_X19_Y21_N28
\rf_block|registers~19\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|registers~19_combout\ = (\rf_block|registers~18_combout\ & (((\block_id[0]~input_o\) # (!\rf_block|registers[13][4]~16_combout\)))) # (!\rf_block|registers~18_combout\ & (\immediate[0]~input_o\ & ((\rf_block|registers[13][4]~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \immediate[0]~input_o\,
	datab => \block_id[0]~input_o\,
	datac => \rf_block|registers~18_combout\,
	datad => \rf_block|registers[13][4]~16_combout\,
	combout => \rf_block|registers~19_combout\);

-- Location: FF_X19_Y21_N29
\rf_block|registers[13][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \rf_block|registers~19_combout\,
	sclr => \reset~input_o\,
	ena => \rf_block|registers[13][4]~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|registers[13][0]~q\);

-- Location: LCCOMB_X14_Y19_N28
\rf_block|rs_data~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rs_data~7_combout\ = (\rs_address[1]~input_o\ & ((\rf_block|registers[14][0]~q\) # ((\rs_address[0]~input_o\)))) # (!\rs_address[1]~input_o\ & (((!\rs_address[0]~input_o\ & \rf_block|registers[12][0]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs_address[1]~input_o\,
	datab => \rf_block|registers[14][0]~q\,
	datac => \rs_address[0]~input_o\,
	datad => \rf_block|registers[12][0]~q\,
	combout => \rf_block|rs_data~7_combout\);

-- Location: LCCOMB_X16_Y18_N10
\rf_block|rs_data~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rs_data~8_combout\ = (\rs_address[0]~input_o\ & ((\rf_block|rs_data~7_combout\ & ((\rf_block|registers[15][0]~q\))) # (!\rf_block|rs_data~7_combout\ & (\rf_block|registers[13][0]~q\)))) # (!\rs_address[0]~input_o\ & 
-- (((\rf_block|rs_data~7_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100001011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs_address[0]~input_o\,
	datab => \rf_block|registers[13][0]~q\,
	datac => \rf_block|rs_data~7_combout\,
	datad => \rf_block|registers[15][0]~q\,
	combout => \rf_block|rs_data~8_combout\);

-- Location: LCCOMB_X16_Y18_N4
\rf_block|rs_data~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rs_data~0_combout\ = (\rs_address[0]~input_o\ & ((\rs_address[1]~input_o\) # ((\rf_block|registers[9][0]~q\)))) # (!\rs_address[0]~input_o\ & (!\rs_address[1]~input_o\ & ((\rf_block|registers[8][0]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs_address[0]~input_o\,
	datab => \rs_address[1]~input_o\,
	datac => \rf_block|registers[9][0]~q\,
	datad => \rf_block|registers[8][0]~q\,
	combout => \rf_block|rs_data~0_combout\);

-- Location: LCCOMB_X16_Y18_N2
\rf_block|rs_data~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rs_data~1_combout\ = (\rf_block|rs_data~0_combout\ & (((\rf_block|registers[11][0]~q\)) # (!\rs_address[1]~input_o\))) # (!\rf_block|rs_data~0_combout\ & (\rs_address[1]~input_o\ & (\rf_block|registers[10][0]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rs_data~0_combout\,
	datab => \rs_address[1]~input_o\,
	datac => \rf_block|registers[10][0]~q\,
	datad => \rf_block|registers[11][0]~q\,
	combout => \rf_block|rs_data~1_combout\);

-- Location: LCCOMB_X16_Y18_N8
\rf_block|rs_data~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rs_data~2_combout\ = (\rs_address[0]~input_o\ & (\rs_address[1]~input_o\)) # (!\rs_address[0]~input_o\ & ((\rs_address[1]~input_o\ & (\rf_block|registers[6][0]~q\)) # (!\rs_address[1]~input_o\ & ((\rf_block|registers[4][0]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs_address[0]~input_o\,
	datab => \rs_address[1]~input_o\,
	datac => \rf_block|registers[6][0]~q\,
	datad => \rf_block|registers[4][0]~q\,
	combout => \rf_block|rs_data~2_combout\);

-- Location: LCCOMB_X16_Y18_N30
\rf_block|rs_data~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rs_data~3_combout\ = (\rs_address[0]~input_o\ & ((\rf_block|rs_data~2_combout\ & ((\rf_block|registers[7][0]~q\))) # (!\rf_block|rs_data~2_combout\ & (\rf_block|registers[5][0]~q\)))) # (!\rs_address[0]~input_o\ & 
-- (((\rf_block|rs_data~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100001011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs_address[0]~input_o\,
	datab => \rf_block|registers[5][0]~q\,
	datac => \rf_block|rs_data~2_combout\,
	datad => \rf_block|registers[7][0]~q\,
	combout => \rf_block|rs_data~3_combout\);

-- Location: LCCOMB_X16_Y18_N20
\rf_block|rs_data~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rs_data~4_combout\ = (\rs_address[0]~input_o\ & ((\rs_address[1]~input_o\) # ((\rf_block|registers[1][0]~q\)))) # (!\rs_address[0]~input_o\ & (!\rs_address[1]~input_o\ & (\rf_block|registers[0][0]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs_address[0]~input_o\,
	datab => \rs_address[1]~input_o\,
	datac => \rf_block|registers[0][0]~q\,
	datad => \rf_block|registers[1][0]~q\,
	combout => \rf_block|rs_data~4_combout\);

-- Location: LCCOMB_X16_Y18_N6
\rf_block|rs_data~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rs_data~5_combout\ = (\rs_address[1]~input_o\ & ((\rf_block|rs_data~4_combout\ & (\rf_block|registers[3][0]~q\)) # (!\rf_block|rs_data~4_combout\ & ((\rf_block|registers[2][0]~q\))))) # (!\rs_address[1]~input_o\ & 
-- (((\rf_block|rs_data~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|registers[3][0]~q\,
	datab => \rs_address[1]~input_o\,
	datac => \rf_block|registers[2][0]~q\,
	datad => \rf_block|rs_data~4_combout\,
	combout => \rf_block|rs_data~5_combout\);

-- Location: LCCOMB_X16_Y18_N16
\rf_block|rs_data~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rs_data~6_combout\ = (\rs_address[2]~input_o\ & ((\rf_block|rs_data~3_combout\) # ((\rs_address[3]~input_o\)))) # (!\rs_address[2]~input_o\ & (((!\rs_address[3]~input_o\ & \rf_block|rs_data~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rs_data~3_combout\,
	datab => \rs_address[2]~input_o\,
	datac => \rs_address[3]~input_o\,
	datad => \rf_block|rs_data~5_combout\,
	combout => \rf_block|rs_data~6_combout\);

-- Location: LCCOMB_X16_Y18_N0
\rf_block|rs_data~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rs_data~9_combout\ = (\rs_address[3]~input_o\ & ((\rf_block|rs_data~6_combout\ & (\rf_block|rs_data~8_combout\)) # (!\rf_block|rs_data~6_combout\ & ((\rf_block|rs_data~1_combout\))))) # (!\rs_address[3]~input_o\ & 
-- (((\rf_block|rs_data~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rs_data~8_combout\,
	datab => \rf_block|rs_data~1_combout\,
	datac => \rs_address[3]~input_o\,
	datad => \rf_block|rs_data~6_combout\,
	combout => \rf_block|rs_data~9_combout\);

-- Location: LCCOMB_X18_Y19_N10
\rf_block|rs_data[0]~SCLR_LUT\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \rf_block|rs_data[0]~SCLR_LUT_combout\ = (\rf_block|rs_data~9_combout\ & !\reset~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rs_data~9_combout\,
	datac => \reset~input_o\,
	combout => \rf_block|rs_data[0]~SCLR_LUT_combout\);

-- Location: FF_X22_Y19_N9
\rf_block|rs_data[0]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	asdata => \rf_block|rs_data[0]~SCLR_LUT_combout\,
	sload => VCC,
	ena => \rf_block|rs_data[7]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rf_block|rs_data[0]~_Duplicate_1_q\);

-- Location: LCCOMB_X25_Y21_N10
\lsu_block|mem_read_addr~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \lsu_block|mem_read_addr~0_combout\ = (\rf_block|rs_data[0]~_Duplicate_1_q\ & !\reset~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rs_data[0]~_Duplicate_1_q\,
	datac => \reset~input_o\,
	combout => \lsu_block|mem_read_addr~0_combout\);

-- Location: LCCOMB_X25_Y21_N16
\lsu_block|mem_read_addr[0]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \lsu_block|mem_read_addr[0]~feeder_combout\ = \lsu_block|mem_read_addr~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \lsu_block|mem_read_addr~0_combout\,
	combout => \lsu_block|mem_read_addr[0]~feeder_combout\);

-- Location: LCCOMB_X24_Y21_N6
\lsu_block|Equal3~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \lsu_block|Equal3~0_combout\ = (\lsu_block|lsu_state\(0) & !\lsu_block|lsu_state\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \lsu_block|lsu_state\(0),
	datad => \lsu_block|lsu_state\(1),
	combout => \lsu_block|Equal3~0_combout\);

-- Location: LCCOMB_X24_Y21_N12
\lsu_block|mem_read_addr[0]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \lsu_block|mem_read_addr[0]~1_combout\ = (\reset~input_o\) # ((\lsu_block|Equal3~0_combout\ & (\enable~input_o\ & \mem_read_en~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \lsu_block|Equal3~0_combout\,
	datab => \enable~input_o\,
	datac => \reset~input_o\,
	datad => \mem_read_en~input_o\,
	combout => \lsu_block|mem_read_addr[0]~1_combout\);

-- Location: FF_X25_Y21_N17
\lsu_block|mem_read_addr[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \lsu_block|mem_read_addr[0]~feeder_combout\,
	ena => \lsu_block|mem_read_addr[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \lsu_block|mem_read_addr\(0));

-- Location: LCCOMB_X27_Y19_N12
\lsu_block|mem_read_addr~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \lsu_block|mem_read_addr~2_combout\ = (!\reset~input_o\ & \rf_block|rs_data[1]~_Duplicate_1_q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \reset~input_o\,
	datac => \rf_block|rs_data[1]~_Duplicate_1_q\,
	combout => \lsu_block|mem_read_addr~2_combout\);

-- Location: LCCOMB_X30_Y21_N0
\lsu_block|mem_read_addr[1]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \lsu_block|mem_read_addr[1]~feeder_combout\ = \lsu_block|mem_read_addr~2_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \lsu_block|mem_read_addr~2_combout\,
	combout => \lsu_block|mem_read_addr[1]~feeder_combout\);

-- Location: FF_X30_Y21_N1
\lsu_block|mem_read_addr[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \lsu_block|mem_read_addr[1]~feeder_combout\,
	ena => \lsu_block|mem_read_addr[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \lsu_block|mem_read_addr\(1));

-- Location: LCCOMB_X25_Y21_N20
\lsu_block|mem_read_addr~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \lsu_block|mem_read_addr~3_combout\ = (!\reset~input_o\ & \rf_block|rs_data[2]~_Duplicate_1_q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \reset~input_o\,
	datad => \rf_block|rs_data[2]~_Duplicate_1_q\,
	combout => \lsu_block|mem_read_addr~3_combout\);

-- Location: LCCOMB_X25_Y21_N22
\lsu_block|mem_read_addr[2]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \lsu_block|mem_read_addr[2]~feeder_combout\ = \lsu_block|mem_read_addr~3_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \lsu_block|mem_read_addr~3_combout\,
	combout => \lsu_block|mem_read_addr[2]~feeder_combout\);

-- Location: FF_X25_Y21_N23
\lsu_block|mem_read_addr[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \lsu_block|mem_read_addr[2]~feeder_combout\,
	ena => \lsu_block|mem_read_addr[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \lsu_block|mem_read_addr\(2));

-- Location: LCCOMB_X25_Y21_N18
\lsu_block|mem_read_addr~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \lsu_block|mem_read_addr~4_combout\ = (!\reset~input_o\ & \rf_block|rs_data[3]~_Duplicate_1_q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \reset~input_o\,
	datad => \rf_block|rs_data[3]~_Duplicate_1_q\,
	combout => \lsu_block|mem_read_addr~4_combout\);

-- Location: LCCOMB_X25_Y21_N8
\lsu_block|mem_read_addr[3]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \lsu_block|mem_read_addr[3]~feeder_combout\ = \lsu_block|mem_read_addr~4_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \lsu_block|mem_read_addr~4_combout\,
	combout => \lsu_block|mem_read_addr[3]~feeder_combout\);

-- Location: FF_X25_Y21_N9
\lsu_block|mem_read_addr[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \lsu_block|mem_read_addr[3]~feeder_combout\,
	ena => \lsu_block|mem_read_addr[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \lsu_block|mem_read_addr\(3));

-- Location: LCCOMB_X25_Y21_N12
\lsu_block|mem_read_addr~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \lsu_block|mem_read_addr~5_combout\ = (\rf_block|rs_data[4]~_Duplicate_1_q\ & !\reset~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \rf_block|rs_data[4]~_Duplicate_1_q\,
	datac => \reset~input_o\,
	combout => \lsu_block|mem_read_addr~5_combout\);

-- Location: LCCOMB_X25_Y21_N26
\lsu_block|mem_read_addr[4]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \lsu_block|mem_read_addr[4]~feeder_combout\ = \lsu_block|mem_read_addr~5_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \lsu_block|mem_read_addr~5_combout\,
	combout => \lsu_block|mem_read_addr[4]~feeder_combout\);

-- Location: FF_X25_Y21_N27
\lsu_block|mem_read_addr[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \lsu_block|mem_read_addr[4]~feeder_combout\,
	ena => \lsu_block|mem_read_addr[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \lsu_block|mem_read_addr\(4));

-- Location: LCCOMB_X25_Y21_N14
\lsu_block|mem_read_addr~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \lsu_block|mem_read_addr~6_combout\ = (\rf_block|rs_data[5]~_Duplicate_1_q\ & !\reset~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \rf_block|rs_data[5]~_Duplicate_1_q\,
	datac => \reset~input_o\,
	combout => \lsu_block|mem_read_addr~6_combout\);

-- Location: FF_X25_Y21_N5
\lsu_block|mem_read_addr[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	asdata => \lsu_block|mem_read_addr~6_combout\,
	sload => VCC,
	ena => \lsu_block|mem_read_addr[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \lsu_block|mem_read_addr\(5));

-- Location: LCCOMB_X25_Y21_N0
\lsu_block|mem_read_addr~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \lsu_block|mem_read_addr~7_combout\ = (!\reset~input_o\ & \rf_block|rs_data[6]~_Duplicate_1_q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \reset~input_o\,
	datad => \rf_block|rs_data[6]~_Duplicate_1_q\,
	combout => \lsu_block|mem_read_addr~7_combout\);

-- Location: LCCOMB_X25_Y21_N6
\lsu_block|mem_read_addr[6]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \lsu_block|mem_read_addr[6]~feeder_combout\ = \lsu_block|mem_read_addr~7_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \lsu_block|mem_read_addr~7_combout\,
	combout => \lsu_block|mem_read_addr[6]~feeder_combout\);

-- Location: FF_X25_Y21_N7
\lsu_block|mem_read_addr[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \lsu_block|mem_read_addr[6]~feeder_combout\,
	ena => \lsu_block|mem_read_addr[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \lsu_block|mem_read_addr\(6));

-- Location: LCCOMB_X25_Y21_N30
\lsu_block|mem_read_addr~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \lsu_block|mem_read_addr~8_combout\ = (\rf_block|rs_data[7]~_Duplicate_1_q\ & !\reset~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \rf_block|rs_data[7]~_Duplicate_1_q\,
	datac => \reset~input_o\,
	combout => \lsu_block|mem_read_addr~8_combout\);

-- Location: FF_X25_Y21_N25
\lsu_block|mem_read_addr[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	asdata => \lsu_block|mem_read_addr~8_combout\,
	sload => VCC,
	ena => \lsu_block|mem_read_addr[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \lsu_block|mem_read_addr\(7));

-- Location: LCCOMB_X24_Y21_N18
\lsu_block|mem_write_addr[0]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \lsu_block|mem_write_addr[0]~0_combout\ = (\reset~input_o\) # ((\lsu_block|Equal3~0_combout\ & (\mem_write_en~input_o\ & !\enable~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \lsu_block|Equal3~0_combout\,
	datab => \reset~input_o\,
	datac => \mem_write_en~input_o\,
	datad => \enable~input_o\,
	combout => \lsu_block|mem_write_addr[0]~0_combout\);

-- Location: FF_X25_Y21_N11
\lsu_block|mem_write_addr[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \lsu_block|mem_read_addr~0_combout\,
	ena => \lsu_block|mem_write_addr[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \lsu_block|mem_write_addr\(0));

-- Location: FF_X27_Y19_N13
\lsu_block|mem_write_addr[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \lsu_block|mem_read_addr~2_combout\,
	ena => \lsu_block|mem_write_addr[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \lsu_block|mem_write_addr\(1));

-- Location: FF_X25_Y21_N21
\lsu_block|mem_write_addr[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \lsu_block|mem_read_addr~3_combout\,
	ena => \lsu_block|mem_write_addr[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \lsu_block|mem_write_addr\(2));

-- Location: FF_X25_Y21_N19
\lsu_block|mem_write_addr[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \lsu_block|mem_read_addr~4_combout\,
	ena => \lsu_block|mem_write_addr[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \lsu_block|mem_write_addr\(3));

-- Location: FF_X25_Y21_N13
\lsu_block|mem_write_addr[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \lsu_block|mem_read_addr~5_combout\,
	ena => \lsu_block|mem_write_addr[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \lsu_block|mem_write_addr\(4));

-- Location: FF_X25_Y21_N15
\lsu_block|mem_write_addr[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \lsu_block|mem_read_addr~6_combout\,
	ena => \lsu_block|mem_write_addr[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \lsu_block|mem_write_addr\(5));

-- Location: FF_X25_Y21_N1
\lsu_block|mem_write_addr[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \lsu_block|mem_read_addr~7_combout\,
	ena => \lsu_block|mem_write_addr[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \lsu_block|mem_write_addr\(6));

-- Location: FF_X25_Y21_N31
\lsu_block|mem_write_addr[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \lsu_block|mem_read_addr~8_combout\,
	ena => \lsu_block|mem_write_addr[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \lsu_block|mem_write_addr\(7));

-- Location: LCCOMB_X27_Y19_N22
\lsu_block|mem_write_data~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \lsu_block|mem_write_data~0_combout\ = (!\reset~input_o\ & \rf_block|rt_data[0]~_Duplicate_1_q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \reset~input_o\,
	datac => \rf_block|rt_data[0]~_Duplicate_1_q\,
	combout => \lsu_block|mem_write_data~0_combout\);

-- Location: FF_X27_Y19_N23
\lsu_block|mem_write_data[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \lsu_block|mem_write_data~0_combout\,
	ena => \lsu_block|mem_write_addr[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \lsu_block|mem_write_data\(0));

-- Location: LCCOMB_X27_Y19_N24
\lsu_block|mem_write_data~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \lsu_block|mem_write_data~1_combout\ = (!\reset~input_o\ & \rf_block|rt_data[1]~_Duplicate_1_q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \reset~input_o\,
	datad => \rf_block|rt_data[1]~_Duplicate_1_q\,
	combout => \lsu_block|mem_write_data~1_combout\);

-- Location: FF_X27_Y19_N25
\lsu_block|mem_write_data[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \lsu_block|mem_write_data~1_combout\,
	ena => \lsu_block|mem_write_addr[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \lsu_block|mem_write_data\(1));

-- Location: LCCOMB_X27_Y19_N14
\lsu_block|mem_write_data~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \lsu_block|mem_write_data~2_combout\ = (!\reset~input_o\ & \rf_block|rt_data[2]~_Duplicate_1_q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \reset~input_o\,
	datac => \rf_block|rt_data[2]~_Duplicate_1_q\,
	combout => \lsu_block|mem_write_data~2_combout\);

-- Location: FF_X27_Y19_N15
\lsu_block|mem_write_data[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \lsu_block|mem_write_data~2_combout\,
	ena => \lsu_block|mem_write_addr[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \lsu_block|mem_write_data\(2));

-- Location: LCCOMB_X27_Y19_N16
\lsu_block|mem_write_data~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \lsu_block|mem_write_data~3_combout\ = (!\reset~input_o\ & \rf_block|rt_data[3]~_Duplicate_1_q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \reset~input_o\,
	datac => \rf_block|rt_data[3]~_Duplicate_1_q\,
	combout => \lsu_block|mem_write_data~3_combout\);

-- Location: FF_X27_Y19_N17
\lsu_block|mem_write_data[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \lsu_block|mem_write_data~3_combout\,
	ena => \lsu_block|mem_write_addr[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \lsu_block|mem_write_data\(3));

-- Location: LCCOMB_X27_Y19_N10
\lsu_block|mem_write_data~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \lsu_block|mem_write_data~4_combout\ = (!\reset~input_o\ & \rf_block|rt_data[4]~_Duplicate_1_q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \reset~input_o\,
	datad => \rf_block|rt_data[4]~_Duplicate_1_q\,
	combout => \lsu_block|mem_write_data~4_combout\);

-- Location: FF_X27_Y19_N11
\lsu_block|mem_write_data[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \lsu_block|mem_write_data~4_combout\,
	ena => \lsu_block|mem_write_addr[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \lsu_block|mem_write_data\(4));

-- Location: LCCOMB_X27_Y19_N20
\lsu_block|mem_write_data~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \lsu_block|mem_write_data~5_combout\ = (!\reset~input_o\ & \rf_block|rt_data[5]~_Duplicate_1_q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \reset~input_o\,
	datad => \rf_block|rt_data[5]~_Duplicate_1_q\,
	combout => \lsu_block|mem_write_data~5_combout\);

-- Location: FF_X27_Y19_N21
\lsu_block|mem_write_data[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \lsu_block|mem_write_data~5_combout\,
	ena => \lsu_block|mem_write_addr[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \lsu_block|mem_write_data\(5));

-- Location: LCCOMB_X27_Y19_N30
\lsu_block|mem_write_data~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \lsu_block|mem_write_data~6_combout\ = (!\reset~input_o\ & \rf_block|rt_data[6]~_Duplicate_1_q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \reset~input_o\,
	datac => \rf_block|rt_data[6]~_Duplicate_1_q\,
	combout => \lsu_block|mem_write_data~6_combout\);

-- Location: FF_X27_Y19_N31
\lsu_block|mem_write_data[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \lsu_block|mem_write_data~6_combout\,
	ena => \lsu_block|mem_write_addr[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \lsu_block|mem_write_data\(6));

-- Location: LCCOMB_X27_Y19_N8
\lsu_block|mem_write_data~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \lsu_block|mem_write_data~7_combout\ = (!\reset~input_o\ & \rf_block|rt_data[7]~_Duplicate_1_q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \reset~input_o\,
	datad => \rf_block|rt_data[7]~_Duplicate_1_q\,
	combout => \lsu_block|mem_write_data~7_combout\);

-- Location: FF_X27_Y19_N9
\lsu_block|mem_write_data[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \lsu_block|mem_write_data~7_combout\,
	ena => \lsu_block|mem_write_addr[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \lsu_block|mem_write_data\(7));

-- Location: IOIBUF_X13_Y25_N29
\current_pc[0]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_current_pc(0),
	o => \current_pc[0]~input_o\);

-- Location: IOIBUF_X19_Y0_N8
\nzp_instr[2]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_nzp_instr(2),
	o => \nzp_instr[2]~input_o\);

-- Location: LCCOMB_X24_Y20_N6
\alu_block|Equal1~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Equal1~2_combout\ = (\rf_block|rt_data[4]~_Duplicate_1_q\ & (\rf_block|rs_data[4]~_Duplicate_1_q\ & (\rf_block|rt_data[5]~_Duplicate_1_q\ $ (!\rf_block|rs_data[5]~_Duplicate_1_q\)))) # (!\rf_block|rt_data[4]~_Duplicate_1_q\ & 
-- (!\rf_block|rs_data[4]~_Duplicate_1_q\ & (\rf_block|rt_data[5]~_Duplicate_1_q\ $ (!\rf_block|rs_data[5]~_Duplicate_1_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010000100001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rt_data[4]~_Duplicate_1_q\,
	datab => \rf_block|rt_data[5]~_Duplicate_1_q\,
	datac => \rf_block|rs_data[4]~_Duplicate_1_q\,
	datad => \rf_block|rs_data[5]~_Duplicate_1_q\,
	combout => \alu_block|Equal1~2_combout\);

-- Location: LCCOMB_X24_Y20_N28
\alu_block|Equal1~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Equal1~1_combout\ = (\rf_block|rs_data[2]~_Duplicate_1_q\ & (\rf_block|rt_data[2]~_Duplicate_1_q\ & (\rf_block|rt_data[3]~_Duplicate_1_q\ $ (!\rf_block|rs_data[3]~_Duplicate_1_q\)))) # (!\rf_block|rs_data[2]~_Duplicate_1_q\ & 
-- (!\rf_block|rt_data[2]~_Duplicate_1_q\ & (\rf_block|rt_data[3]~_Duplicate_1_q\ $ (!\rf_block|rs_data[3]~_Duplicate_1_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001000000001001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rs_data[2]~_Duplicate_1_q\,
	datab => \rf_block|rt_data[2]~_Duplicate_1_q\,
	datac => \rf_block|rt_data[3]~_Duplicate_1_q\,
	datad => \rf_block|rs_data[3]~_Duplicate_1_q\,
	combout => \alu_block|Equal1~1_combout\);

-- Location: LCCOMB_X24_Y20_N4
\alu_block|Equal1~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Equal1~3_combout\ = (\rf_block|rt_data[6]~_Duplicate_1_q\ & (\rf_block|rs_data[6]~_Duplicate_1_q\ & (\rf_block|rs_data[7]~_Duplicate_1_q\ $ (!\rf_block|rt_data[7]~_Duplicate_1_q\)))) # (!\rf_block|rt_data[6]~_Duplicate_1_q\ & 
-- (!\rf_block|rs_data[6]~_Duplicate_1_q\ & (\rf_block|rs_data[7]~_Duplicate_1_q\ $ (!\rf_block|rt_data[7]~_Duplicate_1_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010000100001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rt_data[6]~_Duplicate_1_q\,
	datab => \rf_block|rs_data[7]~_Duplicate_1_q\,
	datac => \rf_block|rs_data[6]~_Duplicate_1_q\,
	datad => \rf_block|rt_data[7]~_Duplicate_1_q\,
	combout => \alu_block|Equal1~3_combout\);

-- Location: LCCOMB_X24_Y20_N2
\alu_block|Equal1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Equal1~0_combout\ = (\rf_block|rs_data[1]~_Duplicate_1_q\ & (\rf_block|rt_data[1]~_Duplicate_1_q\ & (\rf_block|rt_data[0]~_Duplicate_1_q\ $ (!\rf_block|rs_data[0]~_Duplicate_1_q\)))) # (!\rf_block|rs_data[1]~_Duplicate_1_q\ & 
-- (!\rf_block|rt_data[1]~_Duplicate_1_q\ & (\rf_block|rt_data[0]~_Duplicate_1_q\ $ (!\rf_block|rs_data[0]~_Duplicate_1_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001000000001001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rs_data[1]~_Duplicate_1_q\,
	datab => \rf_block|rt_data[1]~_Duplicate_1_q\,
	datac => \rf_block|rt_data[0]~_Duplicate_1_q\,
	datad => \rf_block|rs_data[0]~_Duplicate_1_q\,
	combout => \alu_block|Equal1~0_combout\);

-- Location: LCCOMB_X24_Y20_N24
\alu_block|Equal1~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|Equal1~4_combout\ = (\alu_block|Equal1~2_combout\ & (\alu_block|Equal1~1_combout\ & (\alu_block|Equal1~3_combout\ & \alu_block|Equal1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \alu_block|Equal1~2_combout\,
	datab => \alu_block|Equal1~1_combout\,
	datac => \alu_block|Equal1~3_combout\,
	datad => \alu_block|Equal1~0_combout\,
	combout => \alu_block|Equal1~4_combout\);

-- Location: FF_X24_Y20_N25
\alu_block|alu_nzp[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \alu_block|Equal1~4_combout\,
	sclr => \reset~input_o\,
	ena => \pc_nzp_block|new_pc[7]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \alu_block|alu_nzp\(1));

-- Location: LCCOMB_X20_Y20_N10
\pc_nzp_block|nzp~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \pc_nzp_block|nzp~0_combout\ = (!\reset~input_o\ & \alu_block|alu_nzp\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datad => \alu_block|alu_nzp\(1),
	combout => \pc_nzp_block|nzp~0_combout\);

-- Location: IOIBUF_X22_Y25_N29
\nzp_write_enable~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_nzp_write_enable,
	o => \nzp_write_enable~input_o\);

-- Location: LCCOMB_X20_Y20_N0
\pc_nzp_block|nzp[2]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \pc_nzp_block|nzp[2]~1_combout\ = (\reset~input_o\) # ((\nzp_write_enable~input_o\ & (\lsu_block|Equal5~0_combout\ & \enable~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => \nzp_write_enable~input_o\,
	datac => \lsu_block|Equal5~0_combout\,
	datad => \enable~input_o\,
	combout => \pc_nzp_block|nzp[2]~1_combout\);

-- Location: FF_X20_Y20_N11
\pc_nzp_block|nzp[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \pc_nzp_block|nzp~0_combout\,
	ena => \pc_nzp_block|nzp[2]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pc_nzp_block|nzp\(1));

-- Location: IOIBUF_X27_Y25_N29
\nzp_instr[0]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_nzp_instr(0),
	o => \nzp_instr[0]~input_o\);

-- Location: IOIBUF_X31_Y20_N22
\nzp_instr[1]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_nzp_instr(1),
	o => \nzp_instr[1]~input_o\);

-- Location: LCCOMB_X23_Y19_N0
\alu_block|LessThan0~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|LessThan0~1_cout\ = CARRY((\rf_block|rs_data[0]~_Duplicate_1_q\ & !\rf_block|rt_data[0]~_Duplicate_1_q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rs_data[0]~_Duplicate_1_q\,
	datab => \rf_block|rt_data[0]~_Duplicate_1_q\,
	datad => VCC,
	cout => \alu_block|LessThan0~1_cout\);

-- Location: LCCOMB_X23_Y19_N2
\alu_block|LessThan0~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|LessThan0~3_cout\ = CARRY((\rf_block|rs_data[1]~_Duplicate_1_q\ & (\rf_block|rt_data[1]~_Duplicate_1_q\ & !\alu_block|LessThan0~1_cout\)) # (!\rf_block|rs_data[1]~_Duplicate_1_q\ & ((\rf_block|rt_data[1]~_Duplicate_1_q\) # 
-- (!\alu_block|LessThan0~1_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rs_data[1]~_Duplicate_1_q\,
	datab => \rf_block|rt_data[1]~_Duplicate_1_q\,
	datad => VCC,
	cin => \alu_block|LessThan0~1_cout\,
	cout => \alu_block|LessThan0~3_cout\);

-- Location: LCCOMB_X23_Y19_N4
\alu_block|LessThan0~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|LessThan0~5_cout\ = CARRY((\rf_block|rt_data[2]~_Duplicate_1_q\ & (\rf_block|rs_data[2]~_Duplicate_1_q\ & !\alu_block|LessThan0~3_cout\)) # (!\rf_block|rt_data[2]~_Duplicate_1_q\ & ((\rf_block|rs_data[2]~_Duplicate_1_q\) # 
-- (!\alu_block|LessThan0~3_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rt_data[2]~_Duplicate_1_q\,
	datab => \rf_block|rs_data[2]~_Duplicate_1_q\,
	datad => VCC,
	cin => \alu_block|LessThan0~3_cout\,
	cout => \alu_block|LessThan0~5_cout\);

-- Location: LCCOMB_X23_Y19_N6
\alu_block|LessThan0~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|LessThan0~7_cout\ = CARRY((\rf_block|rs_data[3]~_Duplicate_1_q\ & (\rf_block|rt_data[3]~_Duplicate_1_q\ & !\alu_block|LessThan0~5_cout\)) # (!\rf_block|rs_data[3]~_Duplicate_1_q\ & ((\rf_block|rt_data[3]~_Duplicate_1_q\) # 
-- (!\alu_block|LessThan0~5_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rs_data[3]~_Duplicate_1_q\,
	datab => \rf_block|rt_data[3]~_Duplicate_1_q\,
	datad => VCC,
	cin => \alu_block|LessThan0~5_cout\,
	cout => \alu_block|LessThan0~7_cout\);

-- Location: LCCOMB_X23_Y19_N8
\alu_block|LessThan0~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|LessThan0~9_cout\ = CARRY((\rf_block|rs_data[4]~_Duplicate_1_q\ & ((!\alu_block|LessThan0~7_cout\) # (!\rf_block|rt_data[4]~_Duplicate_1_q\))) # (!\rf_block|rs_data[4]~_Duplicate_1_q\ & (!\rf_block|rt_data[4]~_Duplicate_1_q\ & 
-- !\alu_block|LessThan0~7_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rs_data[4]~_Duplicate_1_q\,
	datab => \rf_block|rt_data[4]~_Duplicate_1_q\,
	datad => VCC,
	cin => \alu_block|LessThan0~7_cout\,
	cout => \alu_block|LessThan0~9_cout\);

-- Location: LCCOMB_X23_Y19_N10
\alu_block|LessThan0~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|LessThan0~11_cout\ = CARRY((\rf_block|rt_data[5]~_Duplicate_1_q\ & ((!\alu_block|LessThan0~9_cout\) # (!\rf_block|rs_data[5]~_Duplicate_1_q\))) # (!\rf_block|rt_data[5]~_Duplicate_1_q\ & (!\rf_block|rs_data[5]~_Duplicate_1_q\ & 
-- !\alu_block|LessThan0~9_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rt_data[5]~_Duplicate_1_q\,
	datab => \rf_block|rs_data[5]~_Duplicate_1_q\,
	datad => VCC,
	cin => \alu_block|LessThan0~9_cout\,
	cout => \alu_block|LessThan0~11_cout\);

-- Location: LCCOMB_X23_Y19_N12
\alu_block|LessThan0~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|LessThan0~13_cout\ = CARRY((\rf_block|rt_data[6]~_Duplicate_1_q\ & (\rf_block|rs_data[6]~_Duplicate_1_q\ & !\alu_block|LessThan0~11_cout\)) # (!\rf_block|rt_data[6]~_Duplicate_1_q\ & ((\rf_block|rs_data[6]~_Duplicate_1_q\) # 
-- (!\alu_block|LessThan0~11_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rt_data[6]~_Duplicate_1_q\,
	datab => \rf_block|rs_data[6]~_Duplicate_1_q\,
	datad => VCC,
	cin => \alu_block|LessThan0~11_cout\,
	cout => \alu_block|LessThan0~13_cout\);

-- Location: LCCOMB_X23_Y19_N14
\alu_block|LessThan0~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|LessThan0~14_combout\ = (\rf_block|rt_data[7]~_Duplicate_1_q\ & (\alu_block|LessThan0~13_cout\ & \rf_block|rs_data[7]~_Duplicate_1_q\)) # (!\rf_block|rt_data[7]~_Duplicate_1_q\ & ((\alu_block|LessThan0~13_cout\) # 
-- (\rf_block|rs_data[7]~_Duplicate_1_q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010101010000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rt_data[7]~_Duplicate_1_q\,
	datad => \rf_block|rs_data[7]~_Duplicate_1_q\,
	cin => \alu_block|LessThan0~13_cout\,
	combout => \alu_block|LessThan0~14_combout\);

-- Location: FF_X23_Y19_N15
\alu_block|alu_nzp[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \alu_block|LessThan0~14_combout\,
	sclr => \reset~input_o\,
	ena => \pc_nzp_block|new_pc[7]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \alu_block|alu_nzp\(0));

-- Location: LCCOMB_X20_Y20_N20
\pc_nzp_block|nzp~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \pc_nzp_block|nzp~2_combout\ = (!\reset~input_o\ & \alu_block|alu_nzp\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datad => \alu_block|alu_nzp\(0),
	combout => \pc_nzp_block|nzp~2_combout\);

-- Location: FF_X20_Y20_N21
\pc_nzp_block|nzp[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \pc_nzp_block|nzp~2_combout\,
	ena => \pc_nzp_block|nzp[2]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pc_nzp_block|nzp\(0));

-- Location: LCCOMB_X20_Y20_N14
\pc_nzp_block|new_pc~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \pc_nzp_block|new_pc~0_combout\ = (\pc_nzp_block|nzp\(1) & (\nzp_instr[1]~input_o\ & (\nzp_instr[0]~input_o\ $ (!\pc_nzp_block|nzp\(0))))) # (!\pc_nzp_block|nzp\(1) & (!\nzp_instr[1]~input_o\ & (\nzp_instr[0]~input_o\ $ (!\pc_nzp_block|nzp\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010000100001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pc_nzp_block|nzp\(1),
	datab => \nzp_instr[0]~input_o\,
	datac => \nzp_instr[1]~input_o\,
	datad => \pc_nzp_block|nzp\(0),
	combout => \pc_nzp_block|new_pc~0_combout\);

-- Location: IOIBUF_X31_Y22_N8
\pc_out_mux~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_pc_out_mux,
	o => \pc_out_mux~input_o\);

-- Location: LCCOMB_X24_Y20_N8
\alu_block|LessThan1~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|LessThan1~1_cout\ = CARRY((\rf_block|rt_data[0]~_Duplicate_1_q\ & !\rf_block|rs_data[0]~_Duplicate_1_q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rt_data[0]~_Duplicate_1_q\,
	datab => \rf_block|rs_data[0]~_Duplicate_1_q\,
	datad => VCC,
	cout => \alu_block|LessThan1~1_cout\);

-- Location: LCCOMB_X24_Y20_N10
\alu_block|LessThan1~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|LessThan1~3_cout\ = CARRY((\rf_block|rs_data[1]~_Duplicate_1_q\ & ((!\alu_block|LessThan1~1_cout\) # (!\rf_block|rt_data[1]~_Duplicate_1_q\))) # (!\rf_block|rs_data[1]~_Duplicate_1_q\ & (!\rf_block|rt_data[1]~_Duplicate_1_q\ & 
-- !\alu_block|LessThan1~1_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rs_data[1]~_Duplicate_1_q\,
	datab => \rf_block|rt_data[1]~_Duplicate_1_q\,
	datad => VCC,
	cin => \alu_block|LessThan1~1_cout\,
	cout => \alu_block|LessThan1~3_cout\);

-- Location: LCCOMB_X24_Y20_N12
\alu_block|LessThan1~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|LessThan1~5_cout\ = CARRY((\rf_block|rs_data[2]~_Duplicate_1_q\ & (\rf_block|rt_data[2]~_Duplicate_1_q\ & !\alu_block|LessThan1~3_cout\)) # (!\rf_block|rs_data[2]~_Duplicate_1_q\ & ((\rf_block|rt_data[2]~_Duplicate_1_q\) # 
-- (!\alu_block|LessThan1~3_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rs_data[2]~_Duplicate_1_q\,
	datab => \rf_block|rt_data[2]~_Duplicate_1_q\,
	datad => VCC,
	cin => \alu_block|LessThan1~3_cout\,
	cout => \alu_block|LessThan1~5_cout\);

-- Location: LCCOMB_X24_Y20_N14
\alu_block|LessThan1~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|LessThan1~7_cout\ = CARRY((\rf_block|rs_data[3]~_Duplicate_1_q\ & ((!\alu_block|LessThan1~5_cout\) # (!\rf_block|rt_data[3]~_Duplicate_1_q\))) # (!\rf_block|rs_data[3]~_Duplicate_1_q\ & (!\rf_block|rt_data[3]~_Duplicate_1_q\ & 
-- !\alu_block|LessThan1~5_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rs_data[3]~_Duplicate_1_q\,
	datab => \rf_block|rt_data[3]~_Duplicate_1_q\,
	datad => VCC,
	cin => \alu_block|LessThan1~5_cout\,
	cout => \alu_block|LessThan1~7_cout\);

-- Location: LCCOMB_X24_Y20_N16
\alu_block|LessThan1~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|LessThan1~9_cout\ = CARRY((\rf_block|rt_data[4]~_Duplicate_1_q\ & ((!\alu_block|LessThan1~7_cout\) # (!\rf_block|rs_data[4]~_Duplicate_1_q\))) # (!\rf_block|rt_data[4]~_Duplicate_1_q\ & (!\rf_block|rs_data[4]~_Duplicate_1_q\ & 
-- !\alu_block|LessThan1~7_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rt_data[4]~_Duplicate_1_q\,
	datab => \rf_block|rs_data[4]~_Duplicate_1_q\,
	datad => VCC,
	cin => \alu_block|LessThan1~7_cout\,
	cout => \alu_block|LessThan1~9_cout\);

-- Location: LCCOMB_X24_Y20_N18
\alu_block|LessThan1~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|LessThan1~11_cout\ = CARRY((\rf_block|rs_data[5]~_Duplicate_1_q\ & ((!\alu_block|LessThan1~9_cout\) # (!\rf_block|rt_data[5]~_Duplicate_1_q\))) # (!\rf_block|rs_data[5]~_Duplicate_1_q\ & (!\rf_block|rt_data[5]~_Duplicate_1_q\ & 
-- !\alu_block|LessThan1~9_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rs_data[5]~_Duplicate_1_q\,
	datab => \rf_block|rt_data[5]~_Duplicate_1_q\,
	datad => VCC,
	cin => \alu_block|LessThan1~9_cout\,
	cout => \alu_block|LessThan1~11_cout\);

-- Location: LCCOMB_X24_Y20_N20
\alu_block|LessThan1~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|LessThan1~13_cout\ = CARRY((\rf_block|rt_data[6]~_Duplicate_1_q\ & ((!\alu_block|LessThan1~11_cout\) # (!\rf_block|rs_data[6]~_Duplicate_1_q\))) # (!\rf_block|rt_data[6]~_Duplicate_1_q\ & (!\rf_block|rs_data[6]~_Duplicate_1_q\ & 
-- !\alu_block|LessThan1~11_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \rf_block|rt_data[6]~_Duplicate_1_q\,
	datab => \rf_block|rs_data[6]~_Duplicate_1_q\,
	datad => VCC,
	cin => \alu_block|LessThan1~11_cout\,
	cout => \alu_block|LessThan1~13_cout\);

-- Location: LCCOMB_X24_Y20_N22
\alu_block|LessThan1~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \alu_block|LessThan1~14_combout\ = (\rf_block|rs_data[7]~_Duplicate_1_q\ & (\alu_block|LessThan1~13_cout\ & \rf_block|rt_data[7]~_Duplicate_1_q\)) # (!\rf_block|rs_data[7]~_Duplicate_1_q\ & ((\alu_block|LessThan1~13_cout\) # 
-- (\rf_block|rt_data[7]~_Duplicate_1_q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001100110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \rf_block|rs_data[7]~_Duplicate_1_q\,
	datad => \rf_block|rt_data[7]~_Duplicate_1_q\,
	cin => \alu_block|LessThan1~13_cout\,
	combout => \alu_block|LessThan1~14_combout\);

-- Location: FF_X24_Y20_N23
\alu_block|alu_nzp[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \alu_block|LessThan1~14_combout\,
	sclr => \reset~input_o\,
	ena => \pc_nzp_block|new_pc[7]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \alu_block|alu_nzp\(2));

-- Location: LCCOMB_X20_Y20_N24
\pc_nzp_block|nzp~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \pc_nzp_block|nzp~3_combout\ = (!\reset~input_o\ & \alu_block|alu_nzp\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datad => \alu_block|alu_nzp\(2),
	combout => \pc_nzp_block|nzp~3_combout\);

-- Location: FF_X20_Y20_N25
\pc_nzp_block|nzp[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \pc_nzp_block|nzp~3_combout\,
	ena => \pc_nzp_block|nzp[2]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pc_nzp_block|nzp\(2));

-- Location: LCCOMB_X20_Y20_N2
\pc_nzp_block|new_pc~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \pc_nzp_block|new_pc~1_combout\ = (\pc_nzp_block|new_pc~0_combout\ & (\pc_out_mux~input_o\ & (\nzp_instr[2]~input_o\ $ (!\pc_nzp_block|nzp\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \nzp_instr[2]~input_o\,
	datab => \pc_nzp_block|new_pc~0_combout\,
	datac => \pc_out_mux~input_o\,
	datad => \pc_nzp_block|nzp\(2),
	combout => \pc_nzp_block|new_pc~1_combout\);

-- Location: LCCOMB_X14_Y21_N24
\pc_nzp_block|new_pc~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \pc_nzp_block|new_pc~2_combout\ = (\pc_nzp_block|new_pc~1_combout\ & ((\immediate[0]~input_o\))) # (!\pc_nzp_block|new_pc~1_combout\ & (!\current_pc[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \current_pc[0]~input_o\,
	datac => \immediate[0]~input_o\,
	datad => \pc_nzp_block|new_pc~1_combout\,
	combout => \pc_nzp_block|new_pc~2_combout\);

-- Location: FF_X14_Y21_N25
\pc_nzp_block|new_pc[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \pc_nzp_block|new_pc~2_combout\,
	sclr => \reset~input_o\,
	ena => \pc_nzp_block|new_pc[7]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pc_nzp_block|new_pc\(0));

-- Location: IOIBUF_X15_Y25_N8
\current_pc[1]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_current_pc(1),
	o => \current_pc[1]~input_o\);

-- Location: LCCOMB_X14_Y21_N2
\pc_nzp_block|new_pc~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \pc_nzp_block|new_pc~5_combout\ = (\pc_nzp_block|new_pc~1_combout\ & (((\immediate[1]~input_o\)))) # (!\pc_nzp_block|new_pc~1_combout\ & (\current_pc[1]~input_o\ $ ((\current_pc[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000001100110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_pc[1]~input_o\,
	datab => \current_pc[0]~input_o\,
	datac => \immediate[1]~input_o\,
	datad => \pc_nzp_block|new_pc~1_combout\,
	combout => \pc_nzp_block|new_pc~5_combout\);

-- Location: FF_X14_Y21_N3
\pc_nzp_block|new_pc[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \pc_nzp_block|new_pc~5_combout\,
	sclr => \reset~input_o\,
	ena => \pc_nzp_block|new_pc[7]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pc_nzp_block|new_pc\(1));

-- Location: IOIBUF_X10_Y22_N8
\current_pc[2]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_current_pc(2),
	o => \current_pc[2]~input_o\);

-- Location: LCCOMB_X14_Y21_N12
\pc_nzp_block|pc_incrementer|additions:2:adders|s\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \pc_nzp_block|pc_incrementer|additions:2:adders|s~combout\ = \current_pc[2]~input_o\ $ (((\current_pc[1]~input_o\ & \current_pc[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100001111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_pc[1]~input_o\,
	datab => \current_pc[0]~input_o\,
	datac => \current_pc[2]~input_o\,
	combout => \pc_nzp_block|pc_incrementer|additions:2:adders|s~combout\);

-- Location: LCCOMB_X14_Y21_N4
\pc_nzp_block|new_pc~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \pc_nzp_block|new_pc~6_combout\ = (\pc_nzp_block|new_pc~1_combout\ & ((\immediate[2]~input_o\))) # (!\pc_nzp_block|new_pc~1_combout\ & (\pc_nzp_block|pc_incrementer|additions:2:adders|s~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pc_nzp_block|pc_incrementer|additions:2:adders|s~combout\,
	datac => \immediate[2]~input_o\,
	datad => \pc_nzp_block|new_pc~1_combout\,
	combout => \pc_nzp_block|new_pc~6_combout\);

-- Location: FF_X14_Y21_N5
\pc_nzp_block|new_pc[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \pc_nzp_block|new_pc~6_combout\,
	sclr => \reset~input_o\,
	ena => \pc_nzp_block|new_pc[7]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pc_nzp_block|new_pc\(2));

-- Location: IOIBUF_X10_Y21_N15
\current_pc[3]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_current_pc(3),
	o => \current_pc[3]~input_o\);

-- Location: LCCOMB_X14_Y21_N26
\pc_nzp_block|pc_incrementer|additions:3:adders|s\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \pc_nzp_block|pc_incrementer|additions:3:adders|s~combout\ = \current_pc[3]~input_o\ $ (((\current_pc[2]~input_o\ & (\current_pc[0]~input_o\ & \current_pc[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_pc[2]~input_o\,
	datab => \current_pc[0]~input_o\,
	datac => \current_pc[1]~input_o\,
	datad => \current_pc[3]~input_o\,
	combout => \pc_nzp_block|pc_incrementer|additions:3:adders|s~combout\);

-- Location: LCCOMB_X14_Y21_N6
\pc_nzp_block|new_pc~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \pc_nzp_block|new_pc~7_combout\ = (\pc_nzp_block|new_pc~1_combout\ & (\immediate[3]~input_o\)) # (!\pc_nzp_block|new_pc~1_combout\ & ((\pc_nzp_block|pc_incrementer|additions:3:adders|s~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \immediate[3]~input_o\,
	datac => \pc_nzp_block|pc_incrementer|additions:3:adders|s~combout\,
	datad => \pc_nzp_block|new_pc~1_combout\,
	combout => \pc_nzp_block|new_pc~7_combout\);

-- Location: FF_X14_Y21_N7
\pc_nzp_block|new_pc[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \pc_nzp_block|new_pc~7_combout\,
	sclr => \reset~input_o\,
	ena => \pc_nzp_block|new_pc[7]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pc_nzp_block|new_pc\(3));

-- Location: IOIBUF_X10_Y21_N22
\current_pc[4]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_current_pc(4),
	o => \current_pc[4]~input_o\);

-- Location: LCCOMB_X14_Y21_N16
\pc_nzp_block|pc_incrementer|additions:3:adders|cout~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \pc_nzp_block|pc_incrementer|additions:3:adders|cout~0_combout\ = (\current_pc[2]~input_o\ & (\current_pc[0]~input_o\ & (\current_pc[1]~input_o\ & \current_pc[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_pc[2]~input_o\,
	datab => \current_pc[0]~input_o\,
	datac => \current_pc[1]~input_o\,
	datad => \current_pc[3]~input_o\,
	combout => \pc_nzp_block|pc_incrementer|additions:3:adders|cout~0_combout\);

-- Location: LCCOMB_X14_Y21_N20
\pc_nzp_block|new_pc~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \pc_nzp_block|new_pc~8_combout\ = (\pc_nzp_block|new_pc~1_combout\ & (((\immediate[4]~input_o\)))) # (!\pc_nzp_block|new_pc~1_combout\ & (\current_pc[4]~input_o\ $ ((\pc_nzp_block|pc_incrementer|additions:3:adders|cout~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000001100110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_pc[4]~input_o\,
	datab => \pc_nzp_block|pc_incrementer|additions:3:adders|cout~0_combout\,
	datac => \immediate[4]~input_o\,
	datad => \pc_nzp_block|new_pc~1_combout\,
	combout => \pc_nzp_block|new_pc~8_combout\);

-- Location: FF_X14_Y21_N21
\pc_nzp_block|new_pc[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \pc_nzp_block|new_pc~8_combout\,
	sclr => \reset~input_o\,
	ena => \pc_nzp_block|new_pc[7]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pc_nzp_block|new_pc\(4));

-- Location: LCCOMB_X14_Y21_N30
\pc_nzp_block|pc_incrementer|additions:4:adders|cout~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \pc_nzp_block|pc_incrementer|additions:4:adders|cout~0_combout\ = (\current_pc[4]~input_o\ & \pc_nzp_block|pc_incrementer|additions:3:adders|cout~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_pc[4]~input_o\,
	datad => \pc_nzp_block|pc_incrementer|additions:3:adders|cout~0_combout\,
	combout => \pc_nzp_block|pc_incrementer|additions:4:adders|cout~0_combout\);

-- Location: IOIBUF_X15_Y25_N22
\current_pc[5]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_current_pc(5),
	o => \current_pc[5]~input_o\);

-- Location: LCCOMB_X14_Y21_N22
\pc_nzp_block|new_pc~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \pc_nzp_block|new_pc~9_combout\ = (\pc_nzp_block|new_pc~1_combout\ & (\immediate[5]~input_o\)) # (!\pc_nzp_block|new_pc~1_combout\ & ((\pc_nzp_block|pc_incrementer|additions:4:adders|cout~0_combout\ $ (\current_pc[5]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000110111011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pc_nzp_block|new_pc~1_combout\,
	datab => \immediate[5]~input_o\,
	datac => \pc_nzp_block|pc_incrementer|additions:4:adders|cout~0_combout\,
	datad => \current_pc[5]~input_o\,
	combout => \pc_nzp_block|new_pc~9_combout\);

-- Location: FF_X14_Y21_N23
\pc_nzp_block|new_pc[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \pc_nzp_block|new_pc~9_combout\,
	sclr => \reset~input_o\,
	ena => \pc_nzp_block|new_pc[7]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pc_nzp_block|new_pc\(5));

-- Location: IOIBUF_X10_Y21_N1
\current_pc[6]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_current_pc(6),
	o => \current_pc[6]~input_o\);

-- Location: LCCOMB_X14_Y21_N28
\pc_nzp_block|pc_incrementer|additions:5:adders|cout~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \pc_nzp_block|pc_incrementer|additions:5:adders|cout~0_combout\ = (\current_pc[4]~input_o\ & (\pc_nzp_block|pc_incrementer|additions:3:adders|cout~0_combout\ & \current_pc[5]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_pc[4]~input_o\,
	datab => \pc_nzp_block|pc_incrementer|additions:3:adders|cout~0_combout\,
	datad => \current_pc[5]~input_o\,
	combout => \pc_nzp_block|pc_incrementer|additions:5:adders|cout~0_combout\);

-- Location: LCCOMB_X14_Y21_N0
\pc_nzp_block|new_pc~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \pc_nzp_block|new_pc~10_combout\ = (\pc_nzp_block|new_pc~1_combout\ & (\immediate[6]~input_o\)) # (!\pc_nzp_block|new_pc~1_combout\ & ((\current_pc[6]~input_o\ $ (\pc_nzp_block|pc_incrementer|additions:5:adders|cout~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000110111011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pc_nzp_block|new_pc~1_combout\,
	datab => \immediate[6]~input_o\,
	datac => \current_pc[6]~input_o\,
	datad => \pc_nzp_block|pc_incrementer|additions:5:adders|cout~0_combout\,
	combout => \pc_nzp_block|new_pc~10_combout\);

-- Location: FF_X14_Y21_N1
\pc_nzp_block|new_pc[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \pc_nzp_block|new_pc~10_combout\,
	sclr => \reset~input_o\,
	ena => \pc_nzp_block|new_pc[7]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pc_nzp_block|new_pc\(6));

-- Location: IOIBUF_X10_Y21_N8
\current_pc[7]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_current_pc(7),
	o => \current_pc[7]~input_o\);

-- Location: LCCOMB_X14_Y21_N14
\pc_nzp_block|pc_incrementer|additions:6:adders|cout~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \pc_nzp_block|pc_incrementer|additions:6:adders|cout~0_combout\ = (\current_pc[4]~input_o\ & (\pc_nzp_block|pc_incrementer|additions:3:adders|cout~0_combout\ & (\current_pc[6]~input_o\ & \current_pc[5]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_pc[4]~input_o\,
	datab => \pc_nzp_block|pc_incrementer|additions:3:adders|cout~0_combout\,
	datac => \current_pc[6]~input_o\,
	datad => \current_pc[5]~input_o\,
	combout => \pc_nzp_block|pc_incrementer|additions:6:adders|cout~0_combout\);

-- Location: LCCOMB_X14_Y21_N18
\pc_nzp_block|new_pc~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \pc_nzp_block|new_pc~11_combout\ = (\pc_nzp_block|new_pc~1_combout\ & (((\immediate[7]~input_o\)))) # (!\pc_nzp_block|new_pc~1_combout\ & (\current_pc[7]~input_o\ $ ((\pc_nzp_block|pc_incrementer|additions:6:adders|cout~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000001100110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_pc[7]~input_o\,
	datab => \pc_nzp_block|pc_incrementer|additions:6:adders|cout~0_combout\,
	datac => \immediate[7]~input_o\,
	datad => \pc_nzp_block|new_pc~1_combout\,
	combout => \pc_nzp_block|new_pc~11_combout\);

-- Location: FF_X14_Y21_N19
\pc_nzp_block|new_pc[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \pc_nzp_block|new_pc~11_combout\,
	sclr => \reset~input_o\,
	ena => \pc_nzp_block|new_pc[7]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pc_nzp_block|new_pc\(7));

-- Location: UNVM_X0_Y11_N40
\~QUARTUS_CREATED_UNVM~\ : fiftyfivenm_unvm
-- pragma translate_off
GENERIC MAP (
	addr_range1_end_addr => -1,
	addr_range1_offset => -1,
	addr_range2_end_addr => -1,
	addr_range2_offset => -1,
	addr_range3_offset => -1,
	is_compressed_image => "false",
	is_dual_boot => "false",
	is_eram_skip => "false",
	max_ufm_valid_addr => -1,
	max_valid_addr => -1,
	min_ufm_valid_addr => -1,
	min_valid_addr => -1,
	part_name => "quartus_created_unvm",
	reserve_block => "true")
-- pragma translate_on
PORT MAP (
	nosc_ena => \~QUARTUS_CREATED_GND~I_combout\,
	xe_ye => \~QUARTUS_CREATED_GND~I_combout\,
	se => \~QUARTUS_CREATED_GND~I_combout\,
	busy => \~QUARTUS_CREATED_UNVM~~busy\);

-- Location: ADCBLOCK_X10_Y24_N0
\~QUARTUS_CREATED_ADC1~\ : fiftyfivenm_adcblock
-- pragma translate_off
GENERIC MAP (
	analog_input_pin_mask => 0,
	clkdiv => 1,
	device_partname_fivechar_prefix => "none",
	is_this_first_or_second_adc => 1,
	prescalar => 0,
	pwd => 1,
	refsel => 0,
	reserve_block => "true",
	testbits => 66,
	tsclkdiv => 1,
	tsclksel => 0)
-- pragma translate_on
PORT MAP (
	soc => \~QUARTUS_CREATED_GND~I_combout\,
	usr_pwd => VCC,
	tsen => \~QUARTUS_CREATED_GND~I_combout\,
	chsel => \~QUARTUS_CREATED_ADC1~_CHSEL_bus\,
	eoc => \~QUARTUS_CREATED_ADC1~~eoc\);

ww_mem_read_address(0) <= \mem_read_address[0]~output_o\;

ww_mem_read_address(1) <= \mem_read_address[1]~output_o\;

ww_mem_read_address(2) <= \mem_read_address[2]~output_o\;

ww_mem_read_address(3) <= \mem_read_address[3]~output_o\;

ww_mem_read_address(4) <= \mem_read_address[4]~output_o\;

ww_mem_read_address(5) <= \mem_read_address[5]~output_o\;

ww_mem_read_address(6) <= \mem_read_address[6]~output_o\;

ww_mem_read_address(7) <= \mem_read_address[7]~output_o\;

ww_mem_write_address(0) <= \mem_write_address[0]~output_o\;

ww_mem_write_address(1) <= \mem_write_address[1]~output_o\;

ww_mem_write_address(2) <= \mem_write_address[2]~output_o\;

ww_mem_write_address(3) <= \mem_write_address[3]~output_o\;

ww_mem_write_address(4) <= \mem_write_address[4]~output_o\;

ww_mem_write_address(5) <= \mem_write_address[5]~output_o\;

ww_mem_write_address(6) <= \mem_write_address[6]~output_o\;

ww_mem_write_address(7) <= \mem_write_address[7]~output_o\;

ww_mem_write_data(0) <= \mem_write_data[0]~output_o\;

ww_mem_write_data(1) <= \mem_write_data[1]~output_o\;

ww_mem_write_data(2) <= \mem_write_data[2]~output_o\;

ww_mem_write_data(3) <= \mem_write_data[3]~output_o\;

ww_mem_write_data(4) <= \mem_write_data[4]~output_o\;

ww_mem_write_data(5) <= \mem_write_data[5]~output_o\;

ww_mem_write_data(6) <= \mem_write_data[6]~output_o\;

ww_mem_write_data(7) <= \mem_write_data[7]~output_o\;

ww_new_pc(0) <= \new_pc[0]~output_o\;

ww_new_pc(1) <= \new_pc[1]~output_o\;

ww_new_pc(2) <= \new_pc[2]~output_o\;

ww_new_pc(3) <= \new_pc[3]~output_o\;

ww_new_pc(4) <= \new_pc[4]~output_o\;

ww_new_pc(5) <= \new_pc[5]~output_o\;

ww_new_pc(6) <= \new_pc[6]~output_o\;

ww_new_pc(7) <= \new_pc[7]~output_o\;
END structure;


