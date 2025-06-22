--library ieee;
--use ieee.std_logic_1164.all;
--use ieee.numeric_std.all;
--
--entity rf is
--	port (
--      clock           : in std_logic;
--      reset           : in std_logic;
--      enable          : in std_logic;
--      core_state      : in std_logic_vector(2 downto 0);
--      reg_write_enable: in std_logic;
--      alu_out         : in std_logic_vector(7 downto 0);
--      lsu_out         : in std_logic_vector(7 downto 0);
--      immediate       : in std_logic_vector(7 downto 0);
--      reg_input_mux   : in std_logic_vector(1 downto 0);
--      rs_address      : in std_logic_vector(3 downto 0);
--      rt_address      : in std_logic_vector(3 downto 0);
--      rd_address      : in std_logic_vector(3 downto 0);
--      block_id        : in std_logic_vector(7 downto 0);
--      rs_data         : out std_logic_vector(7 downto 0);
--      rt_data         : out std_logic_vector(7 downto 0)
--    );
--end rf;
--
--architecture synth of rf is
--	component reg_1b is port (
--		d: in std_logic;
--		e: in std_logic;
--		clock: in std_logic;
--		q: out std_logic
--	);
--	end component;
--	type dq_arr is array(0 to 15) of std_logic_vector(7 downto 0);
--	signal d_arr: dq_arr;
--	signal q_arr: dq_arr;
--begin
--	--create 2^m rows of 2^n registers each
--	reg_row: for row in 0 to 15 generate
--			reg_ind: for reg in 0 to 7 generate
--				begin
--				reg_single_bit: reg_1b port map (d => d_arr(row)(reg) , e => enable, clock => clock, q => q_arr(row)(reg));
--			end generate;
--		end generate;
--
--	rf_process: process(clock) begin
--		if reset = '1' then
--			for byte in 0 to 13 loop
--				d_arr(byte) <= "00000000";
--			end loop;
--			d_arr(14) <= "00000100";
--			d_arr(15) <= "00000000";
--		elsif enable = '1' then
--			if reg_write_enable = '1' then
--				d_arr(13) <= block_id;
--				if core_state = "011" then --read
--					rs_data <= q_arr(to_integer(unsigned(rs_address)));
--					rt_data <= q_arr(to_integer(unsigned(rt_address)));
--				end if;
--				if core_state = "110" then --write
--					if to_integer(unsigned(rd_address)) < 13 then
--						if reg_input_mux = "00" then
--							d_arr(to_integer(unsigned(rd_address))) <= alu_out;
--						end if;
--					elsif reg_input_mux = "01" then
--						d_arr(to_integer(unsigned(rd_address))) <= lsu_out;
--					elsif reg_input_mux = "10" then
--						d_arr(to_integer(unsigned(rd_address))) <= immediate;
--					end if;
--				end if;
--			end if;
--		end if;
--	end process;
--end synth;

-- VHDL Implementation of Provided Pseudocode
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity rf is
    Port (
      clock           : in std_logic;
      reset           : in std_logic;
      enable          : in std_logic;
      core_state      : in std_logic_vector(2 downto 0);
      reg_write_enable: in std_logic;
      alu_out         : in std_logic_vector(7 downto 0);
      lsu_out         : in std_logic_vector(7 downto 0);
      immediate       : in std_logic_vector(7 downto 0);
      reg_input_mux   : in std_logic_vector(1 downto 0);
      rs_address      : in std_logic_vector(3 downto 0);
      rt_address      : in std_logic_vector(3 downto 0);
      rd_address      : in std_logic_vector(3 downto 0);
      block_id        : in std_logic_vector(7 downto 0);
      rs_data         : out std_logic_vector(7 downto 0);
      rt_data         : out std_logic_vector(7 downto 0)
    );
end rf;

architecture Behavioral of rf is

	type reg_array is array (0 to 15) of std_logic_vector(7 downto 0);
	signal registers : reg_array := (others => (others => '0'));
	
begin

	process(clock)

	begin
		if rising_edge(clock) then
			if reset = '1' then
				for i in 0 to 13 loop
					registers(i) <= (others => '0');
				end loop;
				registers(14) <= "00000100";
				registers(15) <= (others => '0');
				rs_data <= (others => '0');
				rt_data <= (others => '0');

				elsif enable = '1' then
					if reg_write_enable = '1' then --write
					  registers(13) <= block_id;			  
					  if core_state = "011" then --write
							rs_data <= registers(to_integer(unsigned(rs_address)));
							rt_data <= registers(to_integer(unsigned(rt_address)));
					  end if;
					  if core_state = "110" then --write
							if to_integer(unsigned(rd_address)) < 13 then
								 case reg_input_mux is
									when "00" =>
											registers(to_integer(unsigned(rd_address))) <= alu_out;
									when "01" =>
										registers(to_integer(unsigned(rd_address))) <= lsu_out;
									when "10" =>
										registers(to_integer(unsigned(rd_address))) <= immediate;
									when others =>
										null;
								 end case;
							end if;
					  end if;
					end if;
			end if;
		end if;
	end process;

end Behavioral;