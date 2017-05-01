library IEEE;
use IEEE.Std_Logic_1164.all;

entity halfadder is
	port(
		SW : in std_logic_vector(9 downto 0);
		LEDR : out std_logic_vector(9 downto 0)
	);
end halfadder;

architecture logica of halfadder is
	begin
		LEDR(0) <= SW(0) xor SW(1);
		LEDR(1) <= SW(0) and SW(1);
end logica;