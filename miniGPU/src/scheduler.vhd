library ieee;
use ieee.std_logic_1164.all;
use work.types.all;

--use ieee.std_logic_misc.all;

-- Sets the state (core_state) of the FSM and thus flags various components that their output is required 
entity scheduler is port(
	clock, reset, start  					: in std_logic;
	decoded_ret									: in std_logic; --whether the program end is reached
	mem_read_enable, mem_write_enable	: in std_logic; --enable read/write from the memory
	fetcher_state	: in std_logic_vector(2 downto 0);
	lsu_state		: in std_logic_vector(7 downto 0);
	new_pc			: in std_logic_vector(7 downto 0); --next program line to be fetched
	
	core_state		: buffer std_logic_vector(2 downto 0);
	current_pc		: out std_logic_vector(7 downto 0);
	done				: out std_logic
);

end scheduler;


architecture fsm of scheduler is
	constant IDLE : std_logic_vector(2 downto 0) := "000"; --wait for start to go high
	constant FETCH : std_logic_vector(2 downto 0) := "001"; --send current_pc to instr mem, wait for fetcher_state to be FETCHED
	constant DECODE : std_logic_vector(2 downto 0) := "010"; --send program line to decoder, wait for mem_read_enable, mem_write_enable, decoded_ret
	constant REQUEST : std_logic_vector(2 downto 0) := "011"; --send data to LSUs if needed
	constant WAIT_STATE : std_logic_vector(2 downto 0) := "100"; --wait for all LSUs to perform the load/store operations
	constant EXECUTE : std_logic_vector(2 downto 0) := "101"; --ALU, branch, pc calculations read
	constant UPDATE : std_logic_vector(2 downto 0) := "110"; --write to RF, next_pc
	constant DONE_STATE : std_logic_vector(2 downto 0) := "111"; --activated by decoded_ret, only reset gets IDLE state back
	signal any_lsu_waiting: std_logic := '0';
	signal lsu_xors : std_logic_vector(n_threads - 1 downto 0);
begin
lsu_waiting:
	for i in 0 to n_threads-1 generate
		b: 
		if i = 0 generate
			c: lsu_xors(i) <= lsu_state(2*i) xor lsu_state(2*i + 1);
		else generate
			d: lsu_xors(i) <= lsu_xors(i-1) or (lsu_state(2*i) xor lsu_state(2*i + 1));
		end generate;
	end generate;
	any_lsu_waiting <= lsu_xors(n_threads-1);
process(clock) begin
	if rising_edge(clock) then
		if reset = '1' then
			core_state <= IDLE; current_pc <= (others => '0'); done <= '0';
		else
			if core_state = IDLE then --IDLE
				if start = '1' then
					core_state <= FETCH;
				end if;
			elsif core_state = FETCH then
				if fetcher_state = "010" then
					core_state <= DECODE;
				end if;
			elsif core_state = DECODE then
				core_state <= REQUEST;
			elsif core_state = REQUEST then
				core_state <= WAIT_STATE;
			elsif core_state = WAIT_STATE then
				if any_lsu_waiting = '0' then
					core_state <= EXECUTE;
				end if;
			elsif core_state = EXECUTE then
				core_state <= UPDATE;
			elsif core_state = UPDATE then
				if decoded_ret = '1' then
					done <= '1';
					core_state <= DONE_STATE;
				else
					current_pc <= new_pc; --????
					core_state <= FETCH;
				end if;
			-- do nothing in DONE state
			-- only reset will get you back to IDLE
			end if;
		end if;
	end if;
end process;	
end fsm;