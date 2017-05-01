library ieee;
use ieee.std_logic_1164.all;
entity comb_resettime is
	port(
		RST, RESET_TIME: in std_logic;
		RST_CONT: out std_logic
	);
end comb_resettime;
architecture behv of comb_resettime is
	begin
		RST_CONT <= not(RST) or RESET_TIME;
end behv;