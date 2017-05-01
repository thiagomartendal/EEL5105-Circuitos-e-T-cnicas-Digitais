library ieee;
use ieee.std_logic_1164.all;
entity topo is
	port(
		LEDR: out std_logic_vector(3 downto 0);
		KEY: in std_logic_vector(1 downto 0)
	);
end topo;
architecture topo_estru of topo is
	signal F: std_logic_vector (3 downto 0);
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
		L0: FSM_Conta port map (LEDR, KEY(1), KEY(0));
end topo_estru;