library ieee;
use ieee.std_logic_1164.all;

library work;
use work.all;
use work.types.all;

entity gpu_mem_dut is port(
	clock, ext_reset, dcr_write_en, core_enable : in std_logic;
	dcr_data : in std_logic_vector(7 downto 0);
	start : in std_logic);
end gpu_mem_dut;

architecture struct of gpu_mem_dut is
signal data_mem_read_ready : std_logic_vector(data_num_channels - 1 downto 0);
signal prog_mem_read_ready : std_logic_vector(prog_num_channels - 1 downto 0);
signal data_mem_write_ready : std_logic_vector(data_num_channels - 1 downto 0);
signal data_mem_read_data : std_logic_vector(data_num_channels*data_data_bits - 1 downto 0);
signal prog_mem_read_data : std_logic_vector(prog_num_channels*prog_data_bits - 1 downto 0);
signal data_mem_read_valid : std_logic_vector(data_num_channels - 1 downto 0);
signal prog_mem_read_valid : std_logic_vector(prog_num_channels - 1 downto 0);
signal data_mem_read_address : std_logic_vector(data_num_channels*data_addr_bits - 1 downto 0);
signal prog_mem_read_address : std_logic_vector(prog_num_channels*prog_addr_bits - 1 downto 0);
signal data_mem_write_valid : std_logic_vector(data_num_channels - 1 downto 0);
signal data_mem_write_address : std_logic_vector(data_num_channels*data_addr_bits - 1 downto 0);
signal data_mem_write_data : std_logic_vector(data_num_channels*data_data_bits - 1 downto 0);

begin
gpu_inst : entity work.gpu(gpu_arch) port map(
	clock => clock,
	ext_reset => ext_reset,
	dcr_write_en => dcr_write_en,
	core_enable => core_enable,
	dcr_data => dcr_data,
	start => start,
	data_mem_read_ready => data_mem_read_ready,
	prog_mem_read_ready => prog_mem_read_ready,
	data_mem_write_ready => data_mem_write_ready,
	data_mem_read_data => data_mem_read_data,
	prog_mem_read_data => prog_mem_read_data,
	data_mem_read_valid => data_mem_read_valid,
	prog_mem_read_valid => prog_mem_read_valid,
	data_mem_read_address => data_mem_read_address,
	prog_mem_read_address => prog_mem_read_address,
	data_mem_write_valid => data_mem_write_valid,
	data_mem_write_address => data_mem_write_address,
	data_mem_write_data => data_mem_write_data);

prog_mem_inst : entity work.prog_mem(behav) port map(
	clock => clock,
	prog_mem_read_address => prog_mem_read_address,
	prog_mem_read_valid => prog_mem_read_valid,
	prog_mem_read_data => prog_mem_read_data,
	prog_mem_read_ready => prog_mem_read_ready);

data_mem_inst : entity work.data_mem(behav) port map(
	clock => clock,
	data_mem_read_address => data_mem_read_address,
	data_mem_write_address => data_mem_write_address,
	data_mem_read_valid => data_mem_read_valid,
	data_mem_write_valid => data_mem_write_valid,
	data_mem_write_data => data_mem_write_data,
	data_mem_read_data => data_mem_read_data,
	data_mem_read_ready => data_mem_read_ready,
	data_mem_write_ready => data_mem_write_ready);
end struct;
