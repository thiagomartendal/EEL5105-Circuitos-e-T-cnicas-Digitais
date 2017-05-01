library ieee;
use ieee.std_logic_1164.all;
entity decod_conta is
	port(
		CONTA: in std_logic_vector(9 downto 0);
		CNT: out std_logic_vector(19 downto 0)
	);
end decod_conta;
architecture behv of decod_conta is
	begin
		CNT(9 downto 0) <=
		"0000000000" when CONTA(5 downto 0) = "000000" else
		"0000000001" when CONTA(5 downto 0) = "000001" else
		"0000000010" when CONTA(5 downto 0) = "000010" else
		"0000000011" when CONTA(5 downto 0) = "000011" else
		"0000000100" when CONTA(5 downto 0) = "000100" else
		"0000000101" when CONTA(5 downto 0) = "000101" else
		"0000000110" when CONTA(5 downto 0) = "000110" else
		"0000000111" when CONTA(5 downto 0) = "000111" else
		"0000001000" when CONTA(5 downto 0) = "001000" else
		"0000001001" when CONTA(5 downto 0) = "001001" else --9
		"0000100000" when CONTA(5 downto 0) = "001010" else
		"0000100001" when CONTA(5 downto 0) = "001011" else
		"0000100010" when CONTA(5 downto 0) = "001100" else
		"0000100011" when CONTA(5 downto 0) = "001101" else
		"0000100100" when CONTA(5 downto 0) = "001110" else
		"0000100101" when CONTA(5 downto 0) = "001111" else
		"0000100110" when CONTA(5 downto 0) = "010000" else
		"0000100111" when CONTA(5 downto 0) = "010001" else
		"0000101000" when CONTA(5 downto 0) = "010010" else
		"0000101001" when CONTA(5 downto 0) = "010011" else --19
		"0001000000" when CONTA(5 downto 0) = "010100" else
		"0001000001" when CONTA(5 downto 0) = "010101" else
		"0001000010" when CONTA(5 downto 0) = "010110" else
		"0001000011" when CONTA(5 downto 0) = "010111" else
		"0001000100" when CONTA(5 downto 0) = "011000" else
		"0001000101" when CONTA(5 downto 0) = "011001" else
		"0001000110" when CONTA(5 downto 0) = "011010" else
		"0001000111" when CONTA(5 downto 0) = "011011" else
		"0001001000" when CONTA(5 downto 0) = "011100" else
		"0001001001" when CONTA(5 downto 0) = "011101" else --29
		"0001100000" when CONTA(5 downto 0) = "011110" else
		"0001100001" when CONTA(5 downto 0) = "011111" else
		"0001100010" when CONTA(5 downto 0) = "100000" else
		"0001100011" when CONTA(5 downto 0) = "100001" else
		"0001100100" when CONTA(5 downto 0) = "100010" else
		"0001100101" when CONTA(5 downto 0) = "100011" else
		"0001100110" when CONTA(5 downto 0) = "100100" else
		"0001100111" when CONTA(5 downto 0) = "100101" else
		"0001101000" when CONTA(5 downto 0) = "100110" else
		"0001101001" when CONTA(5 downto 0) = "100111" else --39
		"0010000000" when CONTA(5 downto 0) = "101000" else
		"0010000001" when CONTA(5 downto 0) = "101001" else
		"0010000010" when CONTA(5 downto 0) = "101010" else
		"0010000011" when CONTA(5 downto 0) = "101011" else
		"0010000100" when CONTA(5 downto 0) = "101100" else
		"0010000101" when CONTA(5 downto 0) = "101101" else
		"0010000110" when CONTA(5 downto 0) = "101110" else
		"0010000111" when CONTA(5 downto 0) = "101111" else
		"0010001000" when CONTA(5 downto 0) = "110000" else
		"0010001001" when CONTA(5 downto 0) = "110001" else --49
		"0010100000" when CONTA(5 downto 0) = "110010" else
		"0010100001" when CONTA(5 downto 0) = "110011" else
		"0010100010" when CONTA(5 downto 0) = "110100" else
		"0010100011" when CONTA(5 downto 0) = "110101" else
		"0010100100" when CONTA(5 downto 0) = "110110" else
		"0010100101" when CONTA(5 downto 0) = "110111" else
		"0010100110" when CONTA(5 downto 0) = "111000" else
		"0010100111" when CONTA(5 downto 0) = "111001" else
		"0010101000" when CONTA(5 downto 0) = "111010" else
		"0010101001" when CONTA(5 downto 0) = "111011" else --59
		"0010101001";
		
		CNT(19 downto 10) <=
		"0000000000" when CONTA(9 downto 6) = "0000" else
		"0000000001" when CONTA(9 downto 6) = "0001" else
		"0000000010" when CONTA(9 downto 6) = "0010" else
		"0000000011" when CONTA(9 downto 6) = "0011" else
		"0000000100" when CONTA(9 downto 6) = "0100" else
		"0000000101" when CONTA(9 downto 6) = "0101" else
		"0000000110" when CONTA(9 downto 6) = "0110" else
		"0000000111" when CONTA(9 downto 6) = "0111" else
		"0000001000" when CONTA(9 downto 6) = "1000" else
		"0000001001" when CONTA(9 downto 6) = "1001" else
		"0000001010" when CONTA(9 downto 6) = "1010" else
		"0000001011" when CONTA(9 downto 6) = "1011" else
		"0000001100" when CONTA(9 downto 6) = "1100" else
		"0000001101" when CONTA(9 downto 6) = "1101" else
		"0000001110" when CONTA(9 downto 6) = "1110" else
		"0000001111" when CONTA(9 downto 6) = "1111" else
		"0000000000";
end behv;