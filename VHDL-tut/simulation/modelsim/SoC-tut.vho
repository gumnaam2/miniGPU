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

-- DATE "06/01/2025 22:16:57"

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


LIBRARY FIFTYFIVENM;
LIBRARY IEEE;
USE FIFTYFIVENM.FIFTYFIVENM_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	muxnbit IS
    PORT (
	choice : IN std_logic_vector(3 DOWNTO 0);
	input : IN std_logic_vector(15 DOWNTO 0);
	output : BUFFER std_logic
	);
END muxnbit;

-- Design Ports Information
-- output	=>  Location: PIN_R10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input[10]	=>  Location: PIN_AA3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- choice[1]	=>  Location: PIN_U7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input[9]	=>  Location: PIN_AB4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- choice[0]	=>  Location: PIN_AA1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input[8]	=>  Location: PIN_P10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input[11]	=>  Location: PIN_W7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- choice[3]	=>  Location: PIN_W4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input[5]	=>  Location: PIN_AA5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input[6]	=>  Location: PIN_B5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input[4]	=>  Location: PIN_R5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input[7]	=>  Location: PIN_T2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- choice[2]	=>  Location: PIN_U6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input[2]	=>  Location: PIN_V4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input[1]	=>  Location: PIN_T1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input[0]	=>  Location: PIN_W3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input[3]	=>  Location: PIN_Y3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input[13]	=>  Location: PIN_C4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input[14]	=>  Location: PIN_Y4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input[12]	=>  Location: PIN_AA2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- input[15]	=>  Location: PIN_W8,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF muxnbit IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_choice : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_input : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_output : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC1~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \~QUARTUS_CREATED_UNVM~~busy\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC1~~eoc\ : std_logic;
SIGNAL \output~output_o\ : std_logic;
SIGNAL \choice[1]~input_o\ : std_logic;
SIGNAL \input[8]~input_o\ : std_logic;
SIGNAL \choice[0]~input_o\ : std_logic;
SIGNAL \input[9]~input_o\ : std_logic;
SIGNAL \layer_gen:3:mux_gen:0:mux_inst|selected~0_combout\ : std_logic;
SIGNAL \input[11]~input_o\ : std_logic;
SIGNAL \input[10]~input_o\ : std_logic;
SIGNAL \layer_gen:3:mux_gen:0:mux_inst|selected~1_combout\ : std_logic;
SIGNAL \choice[3]~input_o\ : std_logic;
SIGNAL \input[12]~input_o\ : std_logic;
SIGNAL \input[14]~input_o\ : std_logic;
SIGNAL \layer_gen:3:mux_gen:0:mux_inst|selected~7_combout\ : std_logic;
SIGNAL \input[13]~input_o\ : std_logic;
SIGNAL \input[15]~input_o\ : std_logic;
SIGNAL \layer_gen:3:mux_gen:0:mux_inst|selected~8_combout\ : std_logic;
SIGNAL \input[3]~input_o\ : std_logic;
SIGNAL \input[2]~input_o\ : std_logic;
SIGNAL \input[1]~input_o\ : std_logic;
SIGNAL \input[0]~input_o\ : std_logic;
SIGNAL \layer_gen:3:mux_gen:0:mux_inst|selected~4_combout\ : std_logic;
SIGNAL \layer_gen:3:mux_gen:0:mux_inst|selected~5_combout\ : std_logic;
SIGNAL \input[7]~input_o\ : std_logic;
SIGNAL \input[4]~input_o\ : std_logic;
SIGNAL \input[6]~input_o\ : std_logic;
SIGNAL \layer_gen:3:mux_gen:0:mux_inst|selected~2_combout\ : std_logic;
SIGNAL \input[5]~input_o\ : std_logic;
SIGNAL \layer_gen:3:mux_gen:0:mux_inst|selected~3_combout\ : std_logic;
SIGNAL \choice[2]~input_o\ : std_logic;
SIGNAL \layer_gen:3:mux_gen:0:mux_inst|selected~6_combout\ : std_logic;
SIGNAL \layer_gen:3:mux_gen:0:mux_inst|selected~9_combout\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_choice <= choice;
ww_input <= input;
output <= ww_output;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\~QUARTUS_CREATED_ADC1~_CHSEL_bus\ <= (\~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\);
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: LCCOMB_X11_Y13_N16
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

-- Location: IOOBUF_X11_Y0_N9
\output~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \layer_gen:3:mux_gen:0:mux_inst|selected~9_combout\,
	devoe => ww_devoe,
	o => \output~output_o\);

-- Location: IOIBUF_X6_Y0_N15
\choice[1]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_choice(1),
	o => \choice[1]~input_o\);

-- Location: IOIBUF_X11_Y0_N1
\input[8]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input(8),
	o => \input[8]~input_o\);

-- Location: IOIBUF_X6_Y0_N8
\choice[0]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_choice(0),
	o => \choice[0]~input_o\);

-- Location: IOIBUF_X11_Y0_N15
\input[9]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input(9),
	o => \input[9]~input_o\);

-- Location: LCCOMB_X9_Y4_N16
\layer_gen:3:mux_gen:0:mux_inst|selected~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \layer_gen:3:mux_gen:0:mux_inst|selected~0_combout\ = (\choice[1]~input_o\ & (((\choice[0]~input_o\)))) # (!\choice[1]~input_o\ & ((\choice[0]~input_o\ & ((\input[9]~input_o\))) # (!\choice[0]~input_o\ & (\input[8]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \choice[1]~input_o\,
	datab => \input[8]~input_o\,
	datac => \choice[0]~input_o\,
	datad => \input[9]~input_o\,
	combout => \layer_gen:3:mux_gen:0:mux_inst|selected~0_combout\);

-- Location: IOIBUF_X9_Y0_N1
\input[11]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input(11),
	o => \input[11]~input_o\);

-- Location: IOIBUF_X11_Y0_N22
\input[10]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input(10),
	o => \input[10]~input_o\);

-- Location: LCCOMB_X9_Y4_N10
\layer_gen:3:mux_gen:0:mux_inst|selected~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \layer_gen:3:mux_gen:0:mux_inst|selected~1_combout\ = (\choice[1]~input_o\ & ((\layer_gen:3:mux_gen:0:mux_inst|selected~0_combout\ & (\input[11]~input_o\)) # (!\layer_gen:3:mux_gen:0:mux_inst|selected~0_combout\ & ((\input[10]~input_o\))))) # 
-- (!\choice[1]~input_o\ & (\layer_gen:3:mux_gen:0:mux_inst|selected~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \choice[1]~input_o\,
	datab => \layer_gen:3:mux_gen:0:mux_inst|selected~0_combout\,
	datac => \input[11]~input_o\,
	datad => \input[10]~input_o\,
	combout => \layer_gen:3:mux_gen:0:mux_inst|selected~1_combout\);

-- Location: IOIBUF_X9_Y0_N29
\choice[3]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_choice(3),
	o => \choice[3]~input_o\);

-- Location: IOIBUF_X6_Y0_N1
\input[12]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input(12),
	o => \input[12]~input_o\);

-- Location: IOIBUF_X9_Y0_N8
\input[14]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input(14),
	o => \input[14]~input_o\);

-- Location: LCCOMB_X9_Y4_N6
\layer_gen:3:mux_gen:0:mux_inst|selected~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \layer_gen:3:mux_gen:0:mux_inst|selected~7_combout\ = (\choice[1]~input_o\ & ((\choice[0]~input_o\) # ((\input[14]~input_o\)))) # (!\choice[1]~input_o\ & (!\choice[0]~input_o\ & (\input[12]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \choice[1]~input_o\,
	datab => \choice[0]~input_o\,
	datac => \input[12]~input_o\,
	datad => \input[14]~input_o\,
	combout => \layer_gen:3:mux_gen:0:mux_inst|selected~7_combout\);

-- Location: IOIBUF_X6_Y10_N15
\input[13]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input(13),
	o => \input[13]~input_o\);

-- Location: IOIBUF_X11_Y0_N29
\input[15]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input(15),
	o => \input[15]~input_o\);

-- Location: LCCOMB_X9_Y4_N8
\layer_gen:3:mux_gen:0:mux_inst|selected~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \layer_gen:3:mux_gen:0:mux_inst|selected~8_combout\ = (\layer_gen:3:mux_gen:0:mux_inst|selected~7_combout\ & (((\input[15]~input_o\) # (!\choice[0]~input_o\)))) # (!\layer_gen:3:mux_gen:0:mux_inst|selected~7_combout\ & (\input[13]~input_o\ & 
-- (\choice[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \layer_gen:3:mux_gen:0:mux_inst|selected~7_combout\,
	datab => \input[13]~input_o\,
	datac => \choice[0]~input_o\,
	datad => \input[15]~input_o\,
	combout => \layer_gen:3:mux_gen:0:mux_inst|selected~8_combout\);

-- Location: IOIBUF_X9_Y0_N15
\input[3]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input(3),
	o => \input[3]~input_o\);

-- Location: IOIBUF_X3_Y0_N29
\input[2]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input(2),
	o => \input[2]~input_o\);

-- Location: IOIBUF_X0_Y4_N1
\input[1]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input(1),
	o => \input[1]~input_o\);

-- Location: IOIBUF_X9_Y0_N22
\input[0]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input(0),
	o => \input[0]~input_o\);

-- Location: LCCOMB_X9_Y4_N24
\layer_gen:3:mux_gen:0:mux_inst|selected~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \layer_gen:3:mux_gen:0:mux_inst|selected~4_combout\ = (\choice[1]~input_o\ & (\choice[0]~input_o\)) # (!\choice[1]~input_o\ & ((\choice[0]~input_o\ & (\input[1]~input_o\)) # (!\choice[0]~input_o\ & ((\input[0]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \choice[1]~input_o\,
	datab => \choice[0]~input_o\,
	datac => \input[1]~input_o\,
	datad => \input[0]~input_o\,
	combout => \layer_gen:3:mux_gen:0:mux_inst|selected~4_combout\);

-- Location: LCCOMB_X9_Y4_N26
\layer_gen:3:mux_gen:0:mux_inst|selected~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \layer_gen:3:mux_gen:0:mux_inst|selected~5_combout\ = (\choice[1]~input_o\ & ((\layer_gen:3:mux_gen:0:mux_inst|selected~4_combout\ & (\input[3]~input_o\)) # (!\layer_gen:3:mux_gen:0:mux_inst|selected~4_combout\ & ((\input[2]~input_o\))))) # 
-- (!\choice[1]~input_o\ & (((\layer_gen:3:mux_gen:0:mux_inst|selected~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \choice[1]~input_o\,
	datab => \input[3]~input_o\,
	datac => \input[2]~input_o\,
	datad => \layer_gen:3:mux_gen:0:mux_inst|selected~4_combout\,
	combout => \layer_gen:3:mux_gen:0:mux_inst|selected~5_combout\);

-- Location: IOIBUF_X0_Y4_N8
\input[7]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input(7),
	o => \input[7]~input_o\);

-- Location: IOIBUF_X0_Y4_N22
\input[4]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input(4),
	o => \input[4]~input_o\);

-- Location: IOIBUF_X6_Y10_N8
\input[6]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input(6),
	o => \input[6]~input_o\);

-- Location: LCCOMB_X9_Y4_N4
\layer_gen:3:mux_gen:0:mux_inst|selected~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \layer_gen:3:mux_gen:0:mux_inst|selected~2_combout\ = (\choice[0]~input_o\ & (((\choice[1]~input_o\)))) # (!\choice[0]~input_o\ & ((\choice[1]~input_o\ & ((\input[6]~input_o\))) # (!\choice[1]~input_o\ & (\input[4]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \input[4]~input_o\,
	datab => \input[6]~input_o\,
	datac => \choice[0]~input_o\,
	datad => \choice[1]~input_o\,
	combout => \layer_gen:3:mux_gen:0:mux_inst|selected~2_combout\);

-- Location: IOIBUF_X13_Y0_N29
\input[5]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_input(5),
	o => \input[5]~input_o\);

-- Location: LCCOMB_X9_Y4_N22
\layer_gen:3:mux_gen:0:mux_inst|selected~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \layer_gen:3:mux_gen:0:mux_inst|selected~3_combout\ = (\layer_gen:3:mux_gen:0:mux_inst|selected~2_combout\ & ((\input[7]~input_o\) # ((!\choice[0]~input_o\)))) # (!\layer_gen:3:mux_gen:0:mux_inst|selected~2_combout\ & (((\choice[0]~input_o\ & 
-- \input[5]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011110010001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \input[7]~input_o\,
	datab => \layer_gen:3:mux_gen:0:mux_inst|selected~2_combout\,
	datac => \choice[0]~input_o\,
	datad => \input[5]~input_o\,
	combout => \layer_gen:3:mux_gen:0:mux_inst|selected~3_combout\);

-- Location: IOIBUF_X6_Y0_N22
\choice[2]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_choice(2),
	o => \choice[2]~input_o\);

-- Location: LCCOMB_X9_Y4_N20
\layer_gen:3:mux_gen:0:mux_inst|selected~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \layer_gen:3:mux_gen:0:mux_inst|selected~6_combout\ = (\choice[3]~input_o\ & (((\choice[2]~input_o\)))) # (!\choice[3]~input_o\ & ((\choice[2]~input_o\ & ((\layer_gen:3:mux_gen:0:mux_inst|selected~3_combout\))) # (!\choice[2]~input_o\ & 
-- (\layer_gen:3:mux_gen:0:mux_inst|selected~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \layer_gen:3:mux_gen:0:mux_inst|selected~5_combout\,
	datab => \choice[3]~input_o\,
	datac => \layer_gen:3:mux_gen:0:mux_inst|selected~3_combout\,
	datad => \choice[2]~input_o\,
	combout => \layer_gen:3:mux_gen:0:mux_inst|selected~6_combout\);

-- Location: LCCOMB_X9_Y4_N2
\layer_gen:3:mux_gen:0:mux_inst|selected~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \layer_gen:3:mux_gen:0:mux_inst|selected~9_combout\ = (\choice[3]~input_o\ & ((\layer_gen:3:mux_gen:0:mux_inst|selected~6_combout\ & ((\layer_gen:3:mux_gen:0:mux_inst|selected~8_combout\))) # (!\layer_gen:3:mux_gen:0:mux_inst|selected~6_combout\ & 
-- (\layer_gen:3:mux_gen:0:mux_inst|selected~1_combout\)))) # (!\choice[3]~input_o\ & (((\layer_gen:3:mux_gen:0:mux_inst|selected~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \layer_gen:3:mux_gen:0:mux_inst|selected~1_combout\,
	datab => \choice[3]~input_o\,
	datac => \layer_gen:3:mux_gen:0:mux_inst|selected~8_combout\,
	datad => \layer_gen:3:mux_gen:0:mux_inst|selected~6_combout\,
	combout => \layer_gen:3:mux_gen:0:mux_inst|selected~9_combout\);

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

ww_output <= \output~output_o\;
END structure;


