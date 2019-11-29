library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--------------------------------------------------------------------
entity q2 is 
	generic(max : natural := 3);
	port(
		x, clk, rst : in std_logic; -- x eh o select 
		y : out std_logic_vector(max -1 downto 0)
	);
end entity;

---------------------------------------------------------------------

architecture rtl of q2 is 
--------------------------------DECLARACAO COMPONENTES --------------
	component q1 
		generic(n : natural := max);
		port(
			c, d, e : in std_logic_vector(n-1 downto 0);
			f, g : out std_logic_vector(n-1 downto 0);
			clk, rst : in std_logic
		);
	end component;
	
	component comp2 
		generic(n : natural := max);
		port(
			a : in std_logic_vector(n -1 downto 0);
			sel : in std_logic; 
			b : out std_logic_vector(n-1 downto 0)
		);
	end component;
---------------------------------------------------------------------
------------------------------signals -------------------------------
	signal c1, c2, c3 : std_logic_vector(max - 1 downto 0);
	signal def_in : std_logic_vector(max -1 downto 0) := "111"; 
	signal f_out_1, f_out_2 : std_logic_vector(max - 1 downto 0);
	signal b0, b1, b2 : std_logic_vector(y'range); 
	signal sel : std_logic;
---------------------------------------------------------------------

begin 
-------------------------instanciar componentes ----------------------
	sel <= x; 
comp1_1 : q1 
		port map(
			c => c1, 
			d => def_in,
			e => def_in, 
			clk => clk, 
			rst => rst,
			f => f_out_1,
			g => c1
		);

comp1_2 : q1 
		port map(
			c => c2, 
			d => c1, 
			e => f_out_1, 
			clk => clk,
			rst => rst, 
			g => c2,
			f => f_out_2
		);

comp1_3 : q1 
		port map(
			c => c3, 
			d => c2,
			e => f_out_2,
			clk => clk, 
			rst => rst, 
			g => c3, 
			f => open 
		);
		
comp2_1 : comp2
		port map(
			a =>  c1,
			b => b0,
			sel => sel
		);
		
comp2_2 : comp2 
		port map(
			a => c2, 
			b => b1, 
			sel => sel 
		);
		
comp2_3 : comp2 
		port map(
			a => c3, 
			b => b2,
			sel => sel 
		);
	
		
		y(0) <= b0(0);
		y(1) <= b1(0);
		y(2) <= b2(0);
----------------------------------------------------------------------

end architecture;
