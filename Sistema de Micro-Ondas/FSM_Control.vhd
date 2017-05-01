library ieee;
use ieee.std_logic_1164.all;
entity FSM_Control is
	port(
		READY, ENTER, PREDEF, CLK, RST: in std_logic;
		IN_POT, RESET_TIME, SET_TIME, EN_TIME, RESET_POT, EN_POT: out std_logic;
		ESTADOS: out std_logic_vector(4 downto 0);
		SEL_DISP, SEL_LED: out std_logic_vector(1 downto 0)
	);
end FSM_Control;
architecture behv of FSM_Control is
	type states is (E0, E1, E2, E3, E4, E5, E6, E7);
	signal EA, PE: states;
	signal clock, reset: std_logic;
	
	begin
		clock <= CLK;
		reset <= RST;
		
		P1: process(clock, reset)
			begin
				if reset = '0' then
					EA <= E0;
				elsif clock'event and clock = '1' then
					EA <= PE;
				end if;
		end process;
		
		P2: process(EA, ENTER, READY, PREDEF)
			begin
				case EA is
					when E0 => --INIT
						SEL_DISP <= "00";
						SEL_LED <= "00";
						ESTADOS <= "00000";
						if ENTER = '1' then
							PE <= E0;
						else
							PE <= E1;
						end if;
					when E1 => --OPEN
						SEL_LED <= "01";
						RESET_TIME <= '1';
						RESET_POT <= '1';
						EN_TIME <= '0';
						SEL_DISP <= "00";
						ESTADOS <= "00001";
						if ENTER = '0' then
							PE <= E2;
						else
							if PREDEF = '0' then
								PE <= E6;
							else
								PE <= E1;
							end if;
						end if;
					when E2 => --IN_TIME
						SET_TIME <= '1';
						SEL_DISP <= "10";
						SEL_LED <= "10";
						RESET_TIME <= '0';
						RESET_POT <= '0';
						ESTADOS <= "00010";
						if ENTER = '1' then
							PE <= E2;
						else
							PE <= E3;
						end if;
					when E3 => --IN_POT
						EN_POT <= '1';
						SEL_LED <= "10";
						SET_TIME <= '0';
						IN_POT <= '0';
						ESTADOS <= "00011";
						if ENTER = '1' then
							PE <= E3;
						else
							PE <= E4;
						end if;
					when E4 => --WARM
						EN_TIME <= '1';
						EN_POT <= '0';
						SEL_DISP <= "10";
						SET_TIME <= '0';
						ESTADOS <= "00100";
						if READY = '1' then 
						   PE <= E5;
						else
						   if ENTER = '1' then
								PE <= E4;
							else
								PE <= E7;
						   end if;
						end if;
					when E5 => --READY
						SEL_DISP <= "11";
						SEL_LED <= "11";
						ESTADOS <= "00101";
						if ENTER = '1' then
							PE <= E5;
						else
							PE <= E1;
						end if;
					when E6 => --IN_PREDEF
						SEL_DISP <= "01";
						SEL_LED <= "10";
						IN_POT <= '1';
						EN_POT <= '1';
						SET_TIME <= '1';
						ESTADOS <= "00110";
						if ENTER = '1' then
							PE <= E6;
						else 
							PE <= E4;
						end if;
					when E7 => --PAUSE
						EN_POT <= '0';
						SEL_LED <= "10";
						SEL_DISP <= "10";
						ESTADOS <= "00111";
						if ENTER = '1' then
							EN_TIME <= '0';
							PE <= E7;
						else
							PE <= E4;
						end if;
				end case;
		end process;
end behv;