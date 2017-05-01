library ieee;
use ieee.std_logic_1164.all;
entity sel1 is
	port(
		REG_OPEN: in std_logic_vector(9 downto 0);
		OUT_POT: in std_logic_vector(9 downto 0);
		REG_ALARM: in std_logic_vector(9 downto 0);
		SEL_LED: in std_logic_vector(1 downto 0);
		LED_OUT: out std_logic_vector(9 downto 0)
	);
end sel1;
architecture behv of sel1 is
	begin
		LED_OUT <= 
		"0000000000" when SEL_LED = "00" else
		REG_OPEN when SEL_LED = "01" else
		OUT_POT when SEL_LED = "10" else
		REG_ALARM;
end behv;