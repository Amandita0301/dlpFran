library ieee;

use ieee.numeric_std.all;
use ieee.std_logic_1164.all;


entity componentes is

	port ( 	a : in bit;
				c : in bit;
				d : in bit;
				e : in bit;
				
				clk : in std_logic;
				rst : in std_logic;
				sel : in std_logic;
				
				b : out bit;
				f : out bit;
				g : out bit
	
	);


end entity;

architecture logica of componentes is

	component componente_1 is
	
	port ( 	c : in bit;
				d : in bit;
				e : in bit;
				
				clk : in std_logic;
				rst : in std_logic;
								
				f : out bit;
				g : out bit
	
	);
	
	end component;
	
	component componente_2 is
	
	port ( 	sel : in std_logic;
				
				a : in bit;
				
				b : out bit
	
	);
	
	end component;
	
	begin
	
	A_1 : componente_1 port map ( c => c,
											d => d,
											e => e,
											clk => clk,
											rst => rst,
											f => f,
											g => g);
	
	B_1 : componente_2 port map (	sel => sel,
											a => a,
											b => b);
	
end architecture;