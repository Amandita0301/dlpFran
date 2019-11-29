LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY robo_asp_vhd_tst IS
END robo_asp_vhd_tst;
ARCHITECTURE robo_asp_arch OF robo_asp_vhd_tst IS
-- constants 
constant tclk: time := 1 ns;  
constant treset: time := 100 ps; 
                                             
-- signals                                                   
SIGNAL A : STD_LOGIC;
SIGNAL Aspirando : STD_LOGIC;
SIGNAL clk : STD_LOGIC;
SIGNAL D : STD_LOGIC;
SIGNAL E : STD_LOGIC;
SIGNAL L : STD_LOGIC;
SIGNAL rst : STD_LOGIC;
SIGNAL S : STD_LOGIC;
COMPONENT robo_asp
	PORT (
	A : OUT STD_LOGIC;
	Aspirando : OUT STD_LOGIC;
	clk : IN STD_LOGIC;
	D : OUT STD_LOGIC;
	E : OUT STD_LOGIC;
	L : IN STD_LOGIC;
	rst : IN STD_LOGIC;
	S : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : robo_asp
	PORT MAP (
-- list connections between master ports and signals
	A => A,
	Aspirando => Aspirando,
	clk => clk,
	D => D,
	E => E,
	L => L,
	rst => rst,
	S => S
	);

sim_rst: PROCESS                                              
BEGIN  
  rst <= '1';
  wait for treset;
  rst <= '0';
  wait;
END PROCESS;


sim_clk: PROCESS                                              
BEGIN  
  clk <= '1';
  wait for tclk;
  clk <= '0';
  wait for tclk;
END PROCESS;

sim_L: PROCESS                                              
BEGIN  
  L <= '0';
  wait for 3 ns;
  L <= '1';
  wait for 1 ns;
END PROCESS;

sim_S: S <= '0', '1' after 5 ns, '0' after 6 ns;

	
END robo_asp_arch;
