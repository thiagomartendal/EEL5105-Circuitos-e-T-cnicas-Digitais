library ieee;
use ieee.std_logic_1164.all;
entity sel4 is
	port(
		SW: in std_logic_vector(9 downto 0);
		MODE: in std_logic_vector(19 downto 10);
		SEL_DISP: in std_logic;
		SEL_TIME: out std_logic_vector(9 downto 0)
	);
end sel4;
architecture behv of sel4 is
	begin
		SEL_TIME <= 
		SW(9 downto 0) when SEL_DISP = '0' else
		MODE(19 downto 10);
end behv;