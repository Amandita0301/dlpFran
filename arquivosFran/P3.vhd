library ieee;

use ieee.numeric_std.all;
use ieee.std_logic_1164.all;


entity componente_1 is

	port ( 	c : in bit;
				d : in bit;
				e : in bit;
				
				clk : in std_logic;
				rst : in std_logic;
				
				f : out bit;
				g : out bit
	
	);

end entity;

architecture logica of componente_1 is

	signal f_sig : bit;

		
	begin
	
		f_sig <= d AND e;
		
						process (clk, rst)
		begin
			
			if (rst = '0') then
			
				g <= '0';
			
			elsif (rising_edge(clk)) then
			
				g <= f_sig XOR c;
				
			end if;
		end process;

		f <= f_sig;
		
			
	
end architecture;