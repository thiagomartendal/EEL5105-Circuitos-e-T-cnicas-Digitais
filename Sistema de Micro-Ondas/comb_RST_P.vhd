library ieee;
use ieee.std_logic_1164.all;
entity comb_RST_P is
	port(
		RST, RESET_POT: in std_logic;
		RST_P: out std_logic
	);
end comb_RST_P;
architecture behv of comb_RST_P is
	begin
		RST_P <= not(RST) or RESET_POT; --Aqui é definido o reset assíncrono do registrador reg_4
end behv;