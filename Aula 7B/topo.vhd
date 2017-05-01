library ieee;
use ieee.std_logic_1164.all;
entity topo is
	port(
		LEDR: out std_logic_vector(3 downto 0);
		KEY: in std_logic_vector(1 downto 0);
		HEX0: out std_logic_vector(6 downto 0);
		clock_50: in std_logic
	);
end topo;
architecture topo_estru of topo is
	signal G: std_logic_vector (3 downto 0);
	component decod7
		port(
			C: in std_logic_vector(3 downto 0);
			F: out std_logic_vector(6 downto 0)
		);
	end component;
	component FSM_Conta
		port(
			contagem: out std_logic_vector(3 downto 0);
			clock: in std_logic;
			reset: in std_logic
		);
	end	component;
	begin
		L0: FSM_Conta port map (G, clock_50, KEY(0));
		L1: decod7 port map (G, HEX0);
		LEDR <= G;
end topo_estru;