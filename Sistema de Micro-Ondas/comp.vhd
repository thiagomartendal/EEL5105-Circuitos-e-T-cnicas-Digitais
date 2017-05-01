library ieee;
use ieee.std_logic_1164.all;
entity comp is
	port(
		conta: in std_logic_vector(9 downto 0);
		ready: out std_logic
	);
end comp;
architecture behv of comp is
	begin
		ready <= 
		'1' when conta = "0000000000" else
		'0';
end behv;