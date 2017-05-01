library ieee;
use ieee.std_logic_1164.all;
entity efeito is
	port(
		CLK, RST: in std_logic;
		LEDR: out std_logic_vector(9 downto 0)
	);
end efeito;
architecture behv of efeito is
	type states is (E0, E1, E2, E3, E4, E5, E6, E7, E8, E9, E10);
	signal EA, PE: states;
	signal clock, reset: std_logic;
	
	begin
		clock <= CLK;
		reset <= RST;
		
		P1: process(clock, reset)
			begin
				if reset = '0' then
					EA <= E0;
				elsif clock'event and clock = '1' then
					EA <= PE;
				end if;
		end process;
		
		P2: process(EA)
			begin
				case EA is
					when E0 =>
						LEDR(9) <= '0';
						LEDR(8) <= '0';
						LEDR(7) <= '0';
						LEDR(6) <= '0';
						LEDR(5) <= '0';
						LEDR(4) <= '0';
						LEDR(3) <= '0';
						LEDR(1) <= '0';
						LEDR(0) <= '1';
						LEDR(2) <= '1';
						PE <= E1;
					when E1 =>
						LEDR(9) <= '0';
						LEDR(8) <= '0';
						LEDR(7) <= '0';
						LEDR(6) <= '0';
						LEDR(5) <= '0';
						LEDR(4) <= '0';
						LEDR(2) <= '0';
						LEDR(0) <= '0';
						LEDR(1) <= '1';
						LEDR(3) <= '1';
						PE <= E2;
					when E2 =>
						LEDR(9) <= '0';
						LEDR(8) <= '0';
						LEDR(7) <= '0';
						LEDR(6) <= '0';
						LEDR(5) <= '0';
						LEDR(3) <= '0';
						LEDR(1) <= '0';
						LEDR(0) <= '0';
						LEDR(2) <= '1';
						LEDR(4) <= '1';
						PE <= E3;
					when E3 =>
						LEDR(9) <= '0';
						LEDR(8) <= '0';
						LEDR(7) <= '0';
						LEDR(6) <= '0';
						LEDR(4) <= '0';
						LEDR(2) <= '0';
						LEDR(1) <= '0';
						LEDR(0) <= '0';
						LEDR(3) <= '1';
						LEDR(5) <= '1';
						PE <= E4;
					when E4 =>
						LEDR(9) <= '0';
						LEDR(8) <= '0';
						LEDR(7) <= '0';
						LEDR(5) <= '0';
						LEDR(3) <= '0';
						LEDR(2) <= '0';
						LEDR(1) <= '0';
						LEDR(0) <= '0';
						LEDR(4) <= '1';
						LEDR(6) <= '1';
						PE <= E5;
					when E5 =>
						LEDR(9) <= '0';
						LEDR(8) <= '0';
						LEDR(6) <= '0';
						LEDR(4) <= '0';
						LEDR(3) <= '0';
						LEDR(2) <= '0';
						LEDR(1) <= '0';
						LEDR(0) <= '0';
						LEDR(5) <= '1';
						LEDR(7) <= '1';
						PE <= E6;
					when E6 =>
						LEDR(9) <= '0';
						LEDR(7) <= '0';
						LEDR(5) <= '0';
						LEDR(4) <= '0';
						LEDR(3) <= '0';
						LEDR(2) <= '0';
						LEDR(1) <= '0';
						LEDR(0) <= '0';
						LEDR(6) <= '1';
						LEDR(8) <= '1';
						PE <= E7;
					when E7 =>
						LEDR(8) <= '0';
						LEDR(6) <= '0';
						LEDR(5) <= '0';
						LEDR(4) <= '0';
						LEDR(3) <= '0';
						LEDR(2) <= '0';
						LEDR(1) <= '0';
						LEDR(0) <= '0';
						LEDR(7) <= '1';
						LEDR(9) <= '1';
						PE <= E8;
					WHEN E8 =>
						LEDR(9) <= '0';
						LEDR(7) <= '0';
						LEDR(6) <= '0';
						LEDR(5) <= '0';
						LEDR(4) <= '0';
						LEDR(3) <= '0';
						LEDR(2) <= '0';
						LEDR(1) <= '0';
						LEDR(0) <= '1';
						LEDR(8) <= '1';
						PE <= E9;
					when E9 =>
						LEDR(8) <= '0';
						LEDR(7) <= '0';
						LEDR(6) <= '0';
						LEDR(5) <= '0';
						LEDR(4) <= '0';
						LEDR(3) <= '0';
						LEDR(2) <= '0';
						LEDR(0) <= '0';
						LEDR(1) <= '1';
						LEDR(9) <= '1';
						PE <= E10;
					when E10 =>
						LEDR(9) <= '0';
						LEDR(8) <= '0';
						LEDR(7) <= '0';
						LEDR(6) <= '0';
						LEDR(5) <= '0';
						LEDR(4) <= '0';
						LEDR(3) <= '0';
						LEDR(1) <= '0';
						LEDR(0) <= '1';
						LEDR(2) <= '1';
						PE <= E0;
				end case;
		end process;
end behv;