library ieee;
use ieee.std_logic_1164.all;
entity sel2 is
	port(
		MODE: in std_logic_vector(19 downto 0);
		CONTA: in std_logic_vector(19 downto 0);
		SEL_DISP: in std_logic_vector(1 downto 0);
		REG: out std_logic_vector(19 downto 0)
	);
end sel2;
architecture behv of sel2 is
	begin
		REG <= 
		"11001110100111011000" when SEL_DISP = "00" else
		MODE(19 downto 0) when SEL_DISP = "01" else
		CONTA(19 downto 0) when SEL_DISP = "10" else
		"11111100011100111101";
end behv;