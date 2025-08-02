library ieee;
use ieee.std_logic_1164.all;
use work.types.all;

entity dcr is port(
	clock, reset, dcr_write_enable : in std_logic;
	dcr_data : in std_logic_vector(7 downto 0);
	
	thread_count : out std_logic_vector(7 downto 0)
);
end dcr;

architecture register_write of dcr is
begin
	process(clock) begin
	if rising_edge(clock) then
		if reset = '1' then
			thread_count <= (others => '0');
		elsif dcr_write_enable = '1' then
			thread_count <= dcr_data;
		end if;
	end if;
	end process;
end register_write;