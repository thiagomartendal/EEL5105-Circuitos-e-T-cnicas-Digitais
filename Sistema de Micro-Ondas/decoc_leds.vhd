library ieee;
use ieee.std_logic_1164.all;
entity decod_leds is
	port(
		SEL_POT: in std_logic_vector(9 downto 0);
		leds: out std_logic_vector(9 downto 0)
	);
end decod_leds;
architecture behv of decod_leds is
	begin
		leds <= 
		"0000000001" when SEL_POT = "0000000001" else
		"0000000011" when SEL_POT = "0000000010" else
		"0000000111" when SEL_POT = "0000000100" else
		"0000001111" when SEL_POT = "0000001000" else
		"0000011111" when SEL_POT = "0000010000" else
		"0000111111" when SEL_POT = "0000100000" else
		"0001111111" when SEL_POT = "0001000000" else
		"0011111111" when SEL_POT = "0010000000" else
		"0111111111" when SEL_POT = "0100000000" else
		"1111111111" when SEL_POT = "1000000000" else
		"0000000000";
end behv;