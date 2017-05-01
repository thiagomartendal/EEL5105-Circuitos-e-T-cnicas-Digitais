library ieee;
use ieee.std_logic_1164.all;
entity comb_seldisp is
	port(
		SEL_DISP: in std_logic_vector(1 downto 0);
		disp: out std_logic
	);
end comb_seldisp;
architecture behv of comb_seldisp is
	begin
		disp <= 
		'1' when SEL_DISP = "01" else
		'0';
end behv;