library ieee;
use ieee.std_logic_1164.all;
entity topo is
	port(
		LEDR: out std_logic_vector(9 downto 0);
		KEY: in std_logic_vector(3 downto 0);
		HEX0, HEX1: out std_logic_vector(6 downto 0);
		SW : in std_logic_vector(9 downto 0);
		clock_50: in std_logic
	);
end topo;
architecture topo_estru of topo is
	signal G, Q1, Q2: std_logic_vector(3 downto 0);
	signal F, Q3, F1, F2, F3, F4: std_logic_vector(7 downto 0);
	signal sel: std_logic_vector (1 downto 0);
	signal en1, en2: std_logic;
	
	component decod7
		port(
			C: in std_logic_vector(3 downto 0);
			F: out std_logic_vector(6 downto 0)
		);
	end component;
	component FSM_Conta
		port(
			Clk, Rst, Enter : in std_logic;
			Operacao: in std_logic_vector(1 downto 0);
			Selecao: out std_logic_vector(1 downto 0);
			Enable_1, Enable_2: out std_logic
		);
	end component;
	component D_4FF
		port(
			CLK, RST, EN: in std_logic;
			D: in std_logic_vector(3 downto 0);
			Q: out std_logic_vector(3 downto 0)
		);
	end component;
	component reg
		port(
			CLK, RST, EN: in std_logic;
			D: in std_logic_vector(7 downto 0);
			Q: out std_logic_vector(7 downto 0)
		);
	end component;
	component C1
		port(
			A: in std_logic_vector(7 downto 0);
			B: in std_logic_vector(7 downto 0);
			F: out std_logic_vector(7 downto 0)
		);
	end component;
	component C2
		port(
			A: in std_logic_vector(7 downto 0);
			B: in std_logic_vector(7 downto 0);
			F: out std_logic_vector(7 downto 0)
		);
	end component;
	component C3
		port(
			A: in std_logic_vector(7 downto 0);
			B: in std_logic_vector(7 downto 0);
			F: out std_logic_vector(7 downto 0)
		);
	end component;
	component C4
		port(
			A: in std_logic_vector(7 downto 0);
			F: out std_logic_vector(7 downto 0)
		);
	end component;
	component mux4x1
		port(
			w, x, y, z: in std_logic_vector(7 downto 0);
			s: in std_logic_vector(1 downto 0);
			m: out std_logic_vector(7 downto 0)
		);
	end component;
	begin
		L0: FSM_Conta port map (clock_50, KEY(0), KEY(1), SW(9 downto 8), sel, en1, en2);
		L1: decod7 port map (Q1, HEX1);
		L2: decod7 port map (Q2, HEX0);
		L3: D_4FF port map (clock_50, KEY(0), en2, F(7 downto 4), Q1);
		L4: D_4FF port map (clock_50, KEY(0), en2, F(3 downto 0), Q2);
		L5: reg port map (clock_50, KEY(0), en1, SW(7 downto 0), Q3);
		L6: reg port map (clock_50, KEY(0), en2, F, LEDR(7 downto 0));
		L7: C1 port map (Q3, SW(7 downto 0), F1);
		L8: C2 port map (Q3, SW(7 downto 0), F2);
		L9: C3 port map (Q3, SW(7 downto 0), F3);
		L10: C4 port map (SW(7 downto 0), F4);
		L11: mux4x1 port map (F1, F2, F3, F4, sel, F);
		LEDR(9 downto 8) <= "00";
end topo_estru;