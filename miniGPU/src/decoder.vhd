library ieee;
use ieee.std_logic_1164.all;

entity decoder is port(
	clock, reset		: in std_logic;
	core_state			: in std_logic_vector(2 downto 0);
	instr			: in std_logic_vector(15 downto 0); -- the program line
	
	rs_address, rt_address, rd_address	: out std_logic_vector(3 downto 0);
	-- Rs, Rt, Rd register addresses respectively.
	-- Generally, Rs, Rt values are operands; Rd is written into; as explained in instruction set
	
	nzp_instr	: out std_logic_vector(2 downto 0); --neg/zero/pos value to be had by the comparison
	immediate	: out std_logic_vector(7 downto 0);
	
	reg_write_enable, nzp_write_enable, mem_read_enable, mem_write_enable	: out std_logic;
	
	reg_input_mux	: out std_logic_vector(1 downto 0); -- RF to read which of ALU/LSU/IMM
	alu_select		: out std_logic_vector(1 downto 0); -- which op ALU performs
	pc_out_mux		: out std_logic; -- whether to load an immediate pc line
	decoded_ret		: out std_logic --RETURN signal, to end the program
);
end decoder;

architecture conditional of decoder is
	--core state codes
	constant DECODE : std_logic_vector(2 downto 0) := "010";
	
	--instruction mnemonics
	constant NOP : std_logic_vector(3 downto 0) := "0000";
	constant BRNZP : std_logic_vector(3 downto 0) := "0001";
	constant CMP : std_logic_vector(3 downto 0) := "0010";
	constant ADD : std_logic_vector(3 downto 0) := "0011";
	constant SUB : std_logic_vector(3 downto 0) := "0100";
	constant MUL : std_logic_vector(3 downto 0) := "0101";
	constant DIV : std_logic_vector(3 downto 0) := "0110";
	constant LDR : std_logic_vector(3 downto 0) := "0111";
	constant STR : std_logic_vector(3 downto 0) := "1000";
	constant CONST : std_logic_vector(3 downto 0) := "1001";
	constant RET : std_logic_vector(3 downto 0) := "1111";
begin
process(clock) begin
	if rising_edge(clock) then
		if reset = '1' then
			rd_address <= (others => '0');
			rs_address <= (others => '0');
			rt_address <= (others => '0');
			nzp_instr <= (others => '0');
			immediate <= (others => '0');
			reg_write_enable <= '0';
			nzp_write_enable <= '0';
			mem_read_enable <= '0';
			mem_write_enable <= '0';
			reg_input_mux <= (others => '0');
			alu_select <= (others => '0');
			pc_out_mux <= '0';
			decoded_ret <= '0';
		elsif core_state = DECODE then
			rd_address <= instr(11 downto 8);
			rs_address <= instr(7 downto 4);
			rt_address <= instr(3 downto 0);
			immediate <= instr(7 downto 0);
			nzp_instr <= instr(11 downto 9);
			reg_write_enable <= '0';
			mem_read_enable <= '0';
			mem_write_enable <= '0';
			nzp_write_enable <= '0';
			reg_input_mux <= (others => '0');
			alu_select <= (others => '0');
			pc_out_mux <= '0';
			decoded_ret <= '0';
			case instr(15 downto 12) is
				when NOP => --no operation
					null;
				when BRNZP => --branch operation
					pc_out_mux <= '1';
				when CMP => --comparison operation: set NZP register value
					nzp_write_enable <= '1';
				when ADD =>
					reg_write_enable <= '1';
					reg_input_mux <= "00"; --ALU output to be written to Rd, rather than immediate or LSU output
					alu_select <= "00"; --ADDITION code
				when SUB =>
					reg_write_enable <= '1';
					reg_input_mux <= "00";
					alu_select <= "01";
				when MUL =>
					reg_write_enable <= '1';
					reg_input_mux <= "00";
					alu_select <= "10";
				when DIV =>
					reg_write_enable <= '1';
					reg_input_mux <= "00";
					alu_select <= "11";
				when STR =>
					mem_write_enable <= '1';
				when CONST =>
					reg_write_enable <= '1';
					reg_input_mux <= "10"; --register file takes immediate value and writes to output register
				when RET =>
					decoded_ret <= '1';
				when others =>
					null;
			end case;
		end if;
	end if;
end process;
end conditional;