library ieee;
use ieee.std_logic_1164.all;

entity lsu is
	port (
		clock, reset, enable							:in std_logic;
		mem_read_enable, mem_write_enable		:in std_logic;
		core_state										:in std_logic_vector(2 downto 0);
		rs_out, rt_out									:in std_logic_vector(7 downto 0);
		mem_read_ready, mem_write_ready			:in std_logic;
		mem_read_data									:in std_logic_vector(7 downto 0);
		
		mem_read_valid, mem_write_valid			:out std_logic;
		mem_read_addr, mem_write_addr				:out std_logic_vector(7 downto 0);
		mem_write_data									:out std_logic_vector(7 downto 0);
		out_lsu_state									:out std_logic_vector(1 downto 0);
		lsu_out											:out std_logic_vector(7 downto 0)
	);
end lsu;

architecture behavioural of lsu is
	signal lsu_state: std_logic_vector(1 downto 0);
	--lsu_state: 00 IDLE, 01 REQ, 10 WAIT, 11 DONE
begin
	out_lsu_state <= lsu_state;
process(clock) begin
	if rising_edge(clock) then
		if reset = '1' then
			lsu_state <= (others => '0');
			lsu_out <= (others => '0');
			mem_read_valid <= '0';
			mem_read_addr <= (others => '0');
			mem_write_addr <= (others => '0');
			mem_write_data <= (others => '0');
		elsif enable = '1' then
			if mem_read_enable = '1' then --load instruction
				if lsu_state = "00" then --IDLE
					if core_state = "011" then
						lsu_state <= "01";
					end if;
				elsif lsu_state = "01" then --REQ
					mem_read_addr <= rs_out;
					mem_read_valid <= '1';
					lsu_state <= "10";
				elsif lsu_state = "10" then --WAIT
					if mem_read_ready = '1' then
						lsu_out <= mem_read_data;
						lsu_state <= "11";
						mem_read_valid <= '0';
					else
					end if;
				elsif lsu_state = "11" then --DONE
					if core_state = "110" then
						lsu_state <= "00";
					end if;
				end if;
			elsif mem_write_enable = '1' then --store instruction
				if lsu_state = "00" then
					if core_state = "011" then
						lsu_state <= "01";
					end if;
				elsif lsu_state = "01" then
					mem_write_addr <= rs_out;
					mem_write_valid <= '1';
					mem_write_data <= rt_out;
					lsu_state <= "10";
				elsif lsu_state = "10" then
					if mem_write_ready = '1' then
						lsu_state <= "11";
						mem_write_valid <= '0';
					end if;
				elsif lsu_state = "11" then
					if core_state = "110" then
						lsu_state <= "00";
					end if;
				end if;
			end if;
		end if;
	end if;
end process;
end behavioural;