library ieee;
use ieee.std_logic_1164.all;
entity sel3 is
	port(
		SW: in std_logic_vector(9 downto 0);
		MODE: in std_logic_vector(9 downto 0);
		IN_POT: in std_logic;
		SEL_POT: out std_logic_vector(9 downto 0)
	);
end sel3;
architecture behv of sel3 is
	begin
		SEL_POT <= 
		SW(9 downto 0) when IN_POT = '0' else
		MODE(9 downto 0);
end behv;