library ieee;
use ieee.std_logic_1164.all;
entity mux4x1 is
	port(
		W: in std_logic;
		X: in std_logic;
		Y: in std_logic;
		Z: in std_logic;
		S: in std_logic_vector(1 downto 0);
		M: out std_logic
	);
end mux4x1;
architecture mux_estr of mux4x1 is
	begin
		M <= (W and not(S(1)) and not(S(0))) or (X and not(S(1)) and S(0)) or (Y and S(1) and not(S(0))) or (Z and S(1) and S(0));
end mux_estr;