library IEEE;
use IEEE.Std_Logic_1164.all;
entity C2 is
	port(
		macaco: in std_logic;
		elefante: in std_logic;
		abobora: out std_logic
	);
end C2;
architecture c2_estr of C2 is
	begin
		abobora <= macaco xor elefante;
end c2_estr;