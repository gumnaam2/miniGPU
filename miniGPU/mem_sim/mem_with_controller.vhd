library ieee;
use ieee.std_logic_1164.all;

use work.types.all;

entity ram_with_controller is
generic(
	num_consumers : integer := data_num_consumers;
	num_channels : integer := data_num_channels;
	addr_bits : integer := data_addr_bits;
	data_bits : integer := data_data_bits);

port(
	reset, clock : in std_logic;
	--signals from consumers
	consumer_read_addr : in std_logic_vector(num_consumers*addr_bits - 1 downto 0);
	consumer_read_req : in std_logic_vector(num_consumers - 1 downto 0);
	consumer_write_addr : in std_logic_vector(num_consumers*addr_bits - 1 downto 0);
	consumer_write_data : in std_logic_vector(num_consumers*data_bits - 1 downto 0);
	consumer_write_req : in std_logic_vector(num_consumers - 1 downto 0);
	
	consumer_read_done : out std_logic_vector(num_consumers - 1 downto 0);
	consumer_write_done : out std_logic_vector(num_consumers - 1 downto 0);
	consumer_read_data : out std_logic_vector(num_consumers*data_bits - 1 downto 0)
);
end ram_with_controller;

architecture arch of ram_with_controller is

signal mem_read_addr    : std_logic_vector(num_channels*addr_bits - 1 downto 0) := (others => '0');
signal mem_write_addr   : std_logic_vector(num_channels*addr_bits - 1 downto 0) := (others => '0');
signal mem_write_en     : std_logic_vector(num_channels - 1 downto 0) := (others => '0');
signal mem_write_data   : std_logic_vector(num_channels*data_bits - 1 downto 0) := (others => '0');
signal mem_read_data    : std_logic_vector(num_channels*data_bits - 1 downto 0) := (others => '0');

begin

cont: entity work.mem_controller_2(arch) 
generic map(
	data_bits => data_bits,
	addr_bits => addr_bits,
	n_channels => num_channels,
	n_consumers => 4
)
port map(
	reset => reset,
	clock => clock,
	consumer_read_addr => consumer_read_addr,
	consumer_read_req => consumer_read_req,
	consumer_write_addr => consumer_write_addr,
	consumer_write_data => consumer_write_data,
	consumer_write_req => consumer_write_req,
	mem_read_addr => mem_read_addr,
	mem_write_addr => mem_write_addr,
	mem_write_en => mem_write_en,
	mem_write_data => mem_write_data,
	mem_read_data => mem_read_data,
	consumer_read_done => consumer_read_done,
	consumer_write_done => consumer_write_done,
	consumer_read_data => consumer_read_data
);

ram: entity work.data_mem_ram(rtl) port map(
	clock	=> clock,
	data_write => mem_write_data,
	write_address=> mem_write_addr,
	read_address => mem_read_addr,
	we => mem_write_en(0),
	q => mem_read_data);
end arch;


library ieee;
use ieee.std_logic_1164.all;

use work.types.all;

entity prog_mem_with_controller is
generic(
	num_consumers : integer := prog_num_consumers;
	num_channels : integer := prog_num_channels;
	addr_bits : integer := prog_addr_bits;
	data_bits : integer := prog_data_bits
);
port(
	reset, clock : in std_logic;
	--signals from consumers
	consumer_read_addr : in std_logic_vector(num_consumers*addr_bits - 1 downto 0);
	consumer_read_req : in std_logic_vector(num_consumers - 1 downto 0);
	consumer_write_addr : in std_logic_vector(num_consumers*addr_bits - 1 downto 0);
	consumer_write_data : in std_logic_vector(num_consumers*data_bits - 1 downto 0);
	consumer_write_req : in std_logic_vector(num_consumers - 1 downto 0);
	
	consumer_read_done : out std_logic_vector(num_consumers - 1 downto 0);
	consumer_write_done : out std_logic_vector(num_consumers - 1 downto 0);
	consumer_read_data : out std_logic_vector(num_consumers*data_bits - 1 downto 0)
);
end prog_mem_with_controller;

architecture arch of prog_mem_with_controller is

signal mem_read_addr    : std_logic_vector(num_channels*addr_bits - 1 downto 0) := (others => '0');
signal mem_write_addr   : std_logic_vector(num_channels*addr_bits - 1 downto 0) := (others => '0');
signal mem_write_en     : std_logic_vector(num_channels - 1 downto 0) := (others => '0');
signal mem_write_data   : std_logic_vector(num_channels*data_bits - 1 downto 0) := (others => '0');
signal mem_read_data    : std_logic_vector(num_channels*data_bits - 1 downto 0) := (others => '0');

begin

cont: entity work.mem_controller_2(arch) 
generic map(
	data_bits => prog_data_bits,
	addr_bits => prog_addr_bits,
	n_channels => prog_num_channels,
	n_consumers => 1
)
port map(
	reset => reset,
	clock => clock,
	consumer_read_addr => consumer_read_addr,
	consumer_read_req => consumer_read_req,
	consumer_write_addr => consumer_write_addr,
	consumer_write_data => consumer_write_data,
	consumer_write_req => (others => '0'),
	mem_read_addr => mem_read_addr,
	mem_write_addr => mem_write_addr,
	mem_write_en => mem_write_en,
	mem_write_data => mem_write_data,
	mem_read_data => mem_read_data,
	consumer_read_done => consumer_read_done,
	consumer_write_done => consumer_write_done,
	consumer_read_data => consumer_read_data
);

prog_mem: entity work.prog_mem_rom(rtl) port map(
	clock => clock,
	addr => mem_read_addr,
	prog_line => mem_read_data);
end arch;