library ieee;
use ieee.std_logic_1164.all;

entity pc_nzp is port(
		clock, reset, enable, nzp_write_enable: 	in std_logic;
		pc_out_mux: 										in std_logic; --high if branch instruction, otherwise PC incremented normally
		core_state: 										in std_logic_vector(2 downto 0);--modify PC iff =101 else modify NZP register
		nzp_instr, nzp_out: 								in std_logic_vector(2 downto 0); --for the branch condition, these are compared
		current_pc, immediate: 							in std_logic_vector(7 downto 0); --current PC value, and the immediate PC to jump to if any
		
		new_pc: 												out std_logic_vector(7 downto 0)
	);

end pc_nzp;

architecture behavioural of pc_nzp is 
	signal nzp : std_logic_vector(2 downto 0);
	component addernbit is
		generic(
			n: integer := 8
		);
		port (x: in std_logic_vector(n-1 downto 0);
				y: in std_logic_vector(n-1 downto 0);
				s: out std_logic_vector(n-1 downto 0) --cout: out std_logic
				);
	end component;
	signal pc_plus1: std_logic_vector(7 downto 0);
	
begin
	pc_incrementer: addernbit port map(x => current_pc, y => "00000001", s => pc_plus1);
	
	process(clock) begin
		if rising_edge(clock) then
			if reset = '1' then
				nzp <= "000"; new_pc <= (others => '0');
			elsif enable = '1' then
				if core_state = "110" then
					if nzp_write_enable = '1' then
						nzp <= nzp_out;
					end if;
				elsif core_state = "101" then
					if pc_out_mux = '1' then
						if nzp_out = nzp_instr then
							new_pc <= immediate;
						else
							new_pc <= pc_plus1;
						end if;
					else
						new_pc <= pc_plus1;
					end if;
				end if;
			end if;
		end if;
	end process;
end behavioural;