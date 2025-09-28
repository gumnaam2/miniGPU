library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity rf is
    port (
      clock					:in std_logic;
      reset					:in std_logic;
      enable				:in std_logic;
      core_state			:in std_logic_vector(2 downto 0);
      reg_write_enable	:in std_logic;
      alu_out				:in std_logic_vector(7 downto 0);
      lsu_out				:in std_logic_vector(7 downto 0);
      immediate			:in std_logic_vector(7 downto 0);
      reg_input_mux		:in std_logic_vector(1 downto 0);
      rs_address			:in std_logic_vector(3 downto 0);
      rt_address			:in std_logic_vector(3 downto 0);
      rd_address			:in std_logic_vector(3 downto 0);
      block_id				:in std_logic_vector(7 downto 0);
		grid_num_threads	:in std_logic_vector(7 downto 0);
		thread_id			:in std_logic_vector(7 downto 0);
      rs_data				:out std_logic_vector(7 downto 0);
      rt_data				:out std_logic_vector(7 downto 0)
    );
end rf;

architecture behavioural of rf is

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
				registers(14) <= (others => '0');--threads per block
				registers(15) <= (others => '0');--thread ID
				rs_data <= (others => '0');
				rt_data <= (others => '0');

			elsif enable = '1' then
				registers(13) <= block_id;--block_id
				registers(14) <= grid_num_threads;
				registers(15) <= thread_id;
				if reg_write_enable = '1' then --write
					if core_state = "011" then --write
						rt_data <= registers(to_integer(unsigned(rt_address)));
						rs_data <= registers(to_integer(unsigned(rs_address)));
				  end if;
				  if core_state = "110" then --read from either alu_out, lsu_out, immediate
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

end behavioural;