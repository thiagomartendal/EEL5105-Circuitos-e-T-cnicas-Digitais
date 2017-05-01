library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity conta_desc is
	port(
		EN_EMTIME, SET, CLK, RST: in std_logic;
		IN_SET: in std_logic_vector(9 downto 0);
		CONTA: out std_logic_vector(9 downto 0)
	);
end conta_desc;
architecture behv of conta_desc is
	signal clock, reset: std_logic;
	signal tempo: std_logic_vector(9 downto 0);
	
	begin
		clock <= CLK;
		reset <= RST;
		
		P1: process(clock, reset)
			begin
				if reset = '0' then
					tempo <= "0000000000";
				else
					if clock'event and clock = '1' then
						if SET = '1' then
							tempo <= IN_SET;
						else
							if EN_EMTIME = '1' then
								tempo(5 downto 0) <= tempo(5 downto 0)-1;
								if tempo(5 downto 0) = "000000" then
									tempo(9 downto 6) <= tempo(9 downto 6)-1;
									tempo(5 downto 0) <= "111011";			
								end if;	
							end if;
						end if;
					end if;
				end if;
		end process;
		CONTA <= tempo;
end behv;