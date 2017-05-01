library ieee;
use ieee.std_logic_1164.all;
entity reg_4 is
	port(
		SEL_POT: in std_logic_vector(9 downto 0);
		EN_POT, CLK, RST_P: in std_logic;
		OUT_POT: out std_logic_vector(9 downto 0)
	);
end reg_4;
architecture behv of reg_4 is
	begin
		process(CLK, EN_POT, SEL_POT)
			begin
				if RST_P = '0' then
					OUT_POT <= "0000000000";
				elsif EN_POT = '1' then
					if CLK'event and CLK = '1' then
						OUT_POT <= SEL_POT;
					end if;
				end if;
		end process;
end behv;