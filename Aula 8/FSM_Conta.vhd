library ieee; use ieee.std_logic_1164.all;
entity FSM_Conta is
	port(
		Clk, Rst, Enter : in std_logic;
		Operacao: in std_logic_vector(1 downto 0);
		Selecao: out std_logic_vector(1 downto 0);
		Enable_1, Enable_2: out std_logic
	);
end FSM_Conta;
architecture FSM_beh of FSM_Conta is
	type states is (S0, S1, S2, S3, S4, S5, S6, S7);
	signal EA, PE: states;
	signal clock: std_logic;
	signal reset: std_logic;
	begin
		clock <= Clk;
		reset <= Rst;
		P1: process (clock, reset)
			begin
				if reset = '0' then
					EA <= S0;
				elsif clock'event and clock = '1' then
					EA <= PE;
				end if;
		end process;
		P2: process (EA, Enter)
			begin
				case EA is
					when S0 =>
						if Enter = '1' then
							PE <= S0;
						else
							PE <= S1;
						end if;
						Enable_1 <= '0';
						Enable_2 <= '0';
					when S1 =>
						Enable_1 <= '1';
						Enable_2 <= '0';
						if Enter = '1' then
							PE <= S2;
						else
							PE <= S1;
						end if;
					when S2 =>
						Enable_1 <= '0';
						Enable_2 <= '0';
						if Operacao = "00" then
							PE <= S3;
						elsif Operacao = "01" then
							PE <= S4;
						elsif Operacao = "10" then
							PE <= S5;
						end if;
					when S3 =>
						Selecao <= "00";
						if Enter = '1' then
							PE <= S3;
						else
							PE <= S7;
						end if;
					when S4 =>
						Selecao <= "01";
						if Enter = '1' then
							PE <= S4;
						else
							PE <= S7;
						end if;
					when S5 =>
						Selecao <= "10";
						if Enter = '1' then
							PE <= S5;
						else
							PE <= S7;
						end if;
					when S6 =>
						Enable_1 <= '0';
						Enable_2 <= '1';
						Selecao <= "11";
						PE <= S0;
					when S7 =>
						Enable_1 <= '0';
						Enable_2 <= '1';
						PE <= S0;
					end case;
		end process;
end FSM_beh;