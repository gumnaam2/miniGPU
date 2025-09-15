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

library ieee;
use ieee.std_logic_1164.all;
use work.types.all;

entity gpu_sim is
end gpu_sim;

architecture tb of gpu_sim is
	component gpu_mem_dut is port(
		clock, ext_reset, dcr_write_en, core_enable : in std_logic;
		dcr_data : in std_logic_vector(7 downto 0);
		start : in std_logic);
	end component;
	signal clock, ext_reset, start, core_enable, dcr_write_en : std_logic;
	signal dcr_data : std_logic_vector(7 downto 0);
begin
dut_inst : gpu_mem_dut port map(
	clock => clock, ext_reset => ext_reset,
	dcr_write_en => dcr_write_en,
	core_enable => core_enable,
	dcr_data => dcr_data,
	start => start);

clk_sim : process begin
	for i in 0 to 100 loop
		clock <= '1';
		wait for clk_period/2;
		clock <= '0';
		wait for clk_period/2;
	end loop;
	wait;
end process;

gpu_stim : process begin
	ext_reset <= '1'; wait for 2*clk_period; ext_reset <= '0';
	dcr_write_en <= '1'; dcr_data <= "00000010"; wait for clk_period; dcr_write_en <= '0';
	core_enable <= '1';
	start <= '1';
	wait;
end process;
	
end tb;