library ieee;

use ieee.numeric_std.all;
use ieee.std_logic_1164.all;


entity componente_2 is

	port ( 	sel : in std_logic;
				
				a : in bit;
				
				b : out bit
	
	);

end entity;

architecture logica_2 of componente_2 is

	
begin

	process ( sel, a)
	
	begin
		
		case sel is
				
				when '1' => b <= a;
					
				when '0' => b <= NOT a;
					
				when others => null;
					
		end case;
			
end process;

		
end architecture;