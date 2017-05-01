library ieee;
use ieee.std_logic_1164.all;
entity topo is
	port(
		KEY: in  std_logic_vector(3 downto 0);
		SW: in  std_logic_vector(9 downto 0);
		HEX5: out std_logic_vector(6 downto 0);
		HEX4: out std_logic_vector(6 downto 0);
		HEX3: out std_logic_vector(6 downto 0);
		HEX2: out std_logic_vector(6 downto 0);
		HEX1: out std_logic_vector(6 downto 0);
		HEX0: out std_logic_vector(6 downto 0);
		LEDR: out std_logic_vector(9 downto 0);
		clock_50: in std_logic
	);
end topo;
architecture stru of topo is
	signal CONTA, reg_open, out_pot, reg_alarm, led_out, sel_pot, sel_time, leds: std_logic_vector(9 downto 0);
	signal estados: std_logic_vector(4 downto 0);
	signal estado, disp3, disp2, disp1, disp0: std_logic_vector(6 downto 0);
	signal MODE: std_logic_vector(39 downto 0);
	signal sel_disp, sel_led: std_logic_vector(1 downto 0);
	signal CNT, REG: std_logic_vector(19 downto 0);
	signal in_pot, reset_time, set_time, en_time, reset_pot, en_pot, disp, rst_p, en_emtime, rst_cont, READY, CLK1, CLK2, BTN_3, BTN_2, BTN_1, BTN_0: std_logic;
	
	component reg_10
		port(
			CLK, RST: in std_logic;
			D: in std_logic_vector(9 downto 0);
			Q: out std_logic_vector(9 downto 0)
		);
	end component;
	
	component decod7
		port(
			C: in std_logic_vector(4 downto 0);
			F: out std_logic_vector(6 downto 0)
		);
	end component;
	
	component comp
		port(
			conta: in std_logic_vector(9 downto 0);
			ready: out std_logic
		);
	end component;
	
	component ButtonSync
		port(
			-- Input ports
			key0	: in  std_logic;
			key1	: in  std_logic;
			key2	: in  std_logic;
			key3	: in  std_logic;	
			clk : in std_logic;
			-- Output ports
			btn0	: out std_logic;
			btn1	: out std_logic;
			btn2	: out std_logic;
			btn3	: out std_logic
		);
	end component;
	
	component ROM 
		port( 
			address : in std_logic_vector(2 downto 0);
         data : out std_logic_vector(39 downto 0)
		);
	end component;
	
	component FSM_Control
		port(
			READY, ENTER, PREDEF, CLK, RST: in std_logic;
			IN_POT, RESET_TIME, SET_TIME, EN_TIME, RESET_POT, EN_POT: out std_logic;
			ESTADOS: out std_logic_vector(4 downto 0);
			SEL_DISP, SEL_LED: out std_logic_vector(1 downto 0)
		);
	end component;
	
	component efeito
		port(
			CLK, RST: in std_logic;
			LEDR: out std_logic_vector(9 downto 0)
		);
	end component;
	
	component sel1
		port(
			REG_OPEN: in std_logic_vector(9 downto 0);
			OUT_POT: in std_logic_vector(9 downto 0);
			REG_ALARM: in std_logic_vector(9 downto 0);
			SEL_LED: in std_logic_vector(1 downto 0);
			LED_OUT: out std_logic_vector(9 downto 0)
		);
	end component;
	
	component decod_conta
		port(
			CONTA: in std_logic_vector(9 downto 0);
			CNT: out std_logic_vector(19 downto 0)
		);
	end component;
	
	component sel2
		port(
			MODE: in std_logic_vector(19 downto 0);
			CONTA: in std_logic_vector(19 downto 0);
			SEL_DISP: in std_logic_vector(1 downto 0);
			REG: out std_logic_vector(19 downto 0)
		);
	end component;
	
	component sel3
		port(
			SW: in std_logic_vector(9 downto 0);
			MODE: in std_logic_vector(9 downto 0);
			IN_POT: in std_logic;
			SEL_POT: out std_logic_vector(9 downto 0)
		);
	end component;
	
	component comb_seldisp is
		port(
			SEL_DISP: in std_logic_vector(1 downto 0);
			disp: out std_logic
		);
	end component;

	component sel4
		port(
			SW: in std_logic_vector(9 downto 0);
			MODE: in std_logic_vector(19 downto 10);
			SEL_DISP: in std_logic;
			SEL_TIME: out std_logic_vector(9 downto 0)
		);
	end component;
	
	component decod_leds
		port(
			SEL_POT: in std_logic_vector(9 downto 0);
			leds: out std_logic_vector(9 downto 0)
		);
	end component;
	
	component comb_RST_P
		port(
			RST, RESET_POT: in std_logic;
			RST_P: out std_logic
		);
	end component;
	
	component reg_4
		port(
			SEL_POT: in std_logic_vector(9 downto 0);
			EN_POT, CLK, RST_P: in std_logic;
			OUT_POT: out std_logic_vector(9 downto 0)
		);
	end component;
	
	component comb_emtime
		port(
			PAUSE, EN_TIME: in std_logic;
			EN: out std_logic
		);
	end component;
	
	component FSM_clock
		port(
			CLOCK_50: in std_logic;
			CLK1, CLK2: out std_logic
		);
	end component;
	
	component comb_resettime
		port(
			RST, RESET_TIME: in std_logic;
			RST_CONT: out std_logic
		);
	end component;
	
	component conta_desc
		port(
			EN_EMTIME, SET, CLK, RST: in std_logic;
			IN_SET: in std_logic_vector(9 downto 0);
			CONTA: out std_logic_vector(9 downto 0)
		);
	end component;
	
	--KEY(0) => BTN_0
	--KEY(1) => BTN_1
	--KEY(2) => BTN_2
	--KEY(3) => BTN_3
   
	begin
		L0: ButtonSync port map(KEY(0), KEY(1), KEY(2), KEY(3), clock_50, BTN_0, BTN_1, BTN_2, BTN_3);
		L1: ROM port map(SW(2 downto 0), MODE);
		L2: reg_10 port map(CLK1, BTN_0, reg_open, reg_open);
		L3: comp port map(CONTA, READY);
		L4: FSM_Control port map(READY, BTN_1, BTN_2, clock_50, BTN_0, in_pot, reset_time, set_time, en_time, reset_pot, en_pot, estados, sel_disp, sel_led);
		L5: efeito port map(CLK2, BTN_0, reg_alarm);
		L6: sel1 port map(reg_open, out_pot, reg_alarm, sel_led, led_out);
		L7: decod_conta port map(CONTA, CNT);
		L8: sel2 port map(MODE(39 downto 20), CNT, sel_disp, REG);
		L9: sel3 port map(SW(9 downto 0), MODE(9 downto 0), in_pot, sel_pot);
		L10: comb_seldisp port map(sel_disp, disp);
		L11: sel4 port map(SW(9 downto 0), MODE(19 downto 10), disp, sel_time);
		L12: decod_leds port map(sel_pot, leds);
		L13: comb_RST_P port map(BTN_1, reset_pot, rst_p);
		L14: reg_4 port map(leds, en_pot, CLK1, rst_p, out_pot);
		L15: comb_emtime port map(BTN_3, en_time, en_emtime);
		L16: FSM_clock port map(clock_50, CLK1, CLK2);
		L17: comb_resettime port map(BTN_0, reset_time, rst_cont);
		L18: conta_desc port map(en_emtime, set_time, CLK1, BTN_0, sel_time(9 downto 0), CONTA);
		L19: decod7 port map(estados, estado);
		L20: decod7 port map(REG(19 downto 15), disp3);
		L21: decod7 port map(REG(14 downto 10), disp2);
		L22: decod7 port map(REG(9 downto 5), disp1);
		L23: decod7 port map(REG(4 downto 0), disp0);
		HEX5(6 downto 0) <= "0000110";
		HEX4(6 downto 0) <= estado(6 downto 0);
		HEX3(6 downto 0) <= disp3(6 downto 0);
		HEX2(6 downto 0) <= disp2(6 downto 0);
		HEX1(6 downto 0) <= disp1(6 downto 0);
		HEX0(6 downto 0) <= disp0(6 downto 0);
		LEDR(9 downto 0) <= led_out;
		--LEDR(9) <= READY;
end stru;