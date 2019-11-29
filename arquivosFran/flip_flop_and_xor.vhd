library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


------------------------------------------------------------------
entity q1 is 
	generic(n : natural := 3);
	port(
		c, d, e : in std_logic_vector(n-1 downto 0);
		f, g : out std_logic_vector(n-1 downto 0);
		clk, rst : in std_logic
	);

end entity;
------------------------------------------------------------------

architecture rtl of q1 is 
--------------------------SIGNALS----------------------------------------
	signal f_aux : std_logic_vector(f'range);
	signal d_int : std_logic_vector(f'range);
	signal q : std_logic_vector(f'range);
	signal idk : std_logic_vector(f'range) := "000"; 

-------------------------------------------------------------------------

------------------------ COMPONENT DECLARATION --------------------------

component flip_flop is 
	generic(max :  natural:= n);
	port(
		clk, clr : in std_logic;
		d : in std_logic_vector(max -1 downto 0);
		q : out std_logic_vector(max -1 downto 0)
	); 
	

end component;

-------------------------------------------------------------------------


begin 
----------------------instanciacao componentes --------------------------
	g_int : flip_flop 
	port map(
		d => d_int, 
		clk => clk, 
		clr => rst, 
		q => q
	);


-------------------------Ligar uns fiozinho ---------------------------------

	f <= f_aux;
	d_int <= c xor f_aux;
	f_aux <= d and e;
	g <= q; 
	
------------------------------------------------------------------------------
end architecture; 

