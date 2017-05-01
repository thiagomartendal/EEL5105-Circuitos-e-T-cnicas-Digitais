library ieee;
use ieee.std_logic_1164.all;
entity comb_emtime is
	port(
		PAUSE, EN_TIME: in std_logic;
		EN: out std_logic
	);
end comb_emtime;
architecture behv of comb_emtime is
	begin
		EN <= PAUSE and EN_TIME;
end behv;