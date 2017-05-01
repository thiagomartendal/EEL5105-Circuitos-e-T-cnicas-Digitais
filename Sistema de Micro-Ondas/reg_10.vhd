library ieee;
use ieee.std_logic_1164.all;
entity reg_10 is
	port(
		CLK, RST: in std_logic;
		D: in std_logic_vector(9 downto 0);
		Q: out std_logic_vector(9 downto 0)
	);
end reg_10;
architecture behv of reg_10 is
	signal R: std_logic_vector(9 downto 0);
	begin
		process(CLK, D)
			begin
				if RST = '0' then
					R <= "0000000000";
				elsif (CLK'event and CLK = '1') then
					R <= D;
				end if;
				Q <= not R; --A saída recebe um sinal negado
		end process;
end behv;