library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity FSM_clock is
	port(
		CLOCK_50: in std_logic;
		CLK1, CLK2: out std_logic
	);
end FSM_clock;
architecture behv of FSM_clock is
	signal contador1, contador2: std_logic_vector(27 downto 0);
	signal clock: std_logic;
	
	begin
		clock <= CLOCK_50;
		
		P1: process(clock)
			begin
				if clock'event and clock= '1' then
					contador1 <= contador1 + 1;
					if contador1 = x"2FAF07F" then --50000000 de ciclos de clock
						contador1 <= x"0000000";
						CLK1 <= '1';
					else
						CLK1 <= '0';
					end if;
				end if;
		end process;
		
		P2: process(clock)
			begin
				if clock'event and clock= '1' then
					contador2 <= contador2 + 1;
					if contador2 = x"54C563" then --5555555 de ciclos de clock
						contador2 <= x"0000000";
						CLK2 <= '1';
					else
						CLK2 <= '0';
					end if;
				end if;
		end process;
end behv;