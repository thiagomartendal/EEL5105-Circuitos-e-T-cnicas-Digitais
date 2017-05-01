library ieee;
use ieee.std_logic_1164.all;
entity ROM is
  port ( address : in std_logic_vector(2 downto 0);
         data : out std_logic_vector(39 downto 0) );
end entity ROM;

architecture behavioral of ROM is
  type mem is array (0 to 2**3 - 1) of std_logic_vector(39 downto 0);
  constant my_Rom : mem := (
    0  => "1101010010110101100100100000000000010000", --Pipoca 2 minutos potência 5
    1  => "0110001010011110111000010111100000001000", --Café 1 minuto e 15 segundo potência 4
    2  => "1010101110100001111001100010100000000001", --Legumes 6 minutos e 5 segundos potência 1
    3  => "0101111001101011100100111100101000000000", --Bolo 3 minutos e 50 segundos potência 10
    4  => "1110011001110100101000011010000001000000", --Sopa 1 minuto e 40 segundo potência 7
    5  => "1000101010101110101101010010100000000010", --Hamburguer 5 minutos e 10 segundos potência 2
    6  => "1101010010000100001010000000000000100000", --Pizza 8 minutos potência 6
    7  => "0110001010110111100010101010000100000000"); --Carne 10 minutos e 40 segundos potência 9
begin
   process (address)
   begin
     case address is
       when "000" => data <= my_rom(0);
       when "001" => data <= my_rom(1);
       when "010" => data <= my_rom(2);
       when "011" => data <= my_rom(3);
       when "100" => data <= my_rom(4);
       when "101" => data <= my_rom(5);
       when "110" => data <= my_rom(6);
       when "111" => data <= my_rom(7);
		 when others => data <= "0000000000000000000000000000000000000000";
	 end case;
  end process;
end architecture behavioral;