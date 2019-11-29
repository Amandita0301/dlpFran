library ieee;

use ieee.numeric_std.all;
use ieee.std_logic_1164.all;


entity prova_b is
	
	generic ( 	N : in integer := 8);
					
	port (	load : in std_logic;
				clock : in std_logic;
				reset : in std_logic;
				enable : in std_logic;
				
				x : in std_logic_vector (N-1 downto 0);
				d : in std_logic_vector (N-1 downto 0);
				
				q : out std_logic_vector (N-1 downto 0)
	);
	
end entity;


architecture logica of prova_b is

	signal d_x : std_logic_vector ( N-1 downto 0);
	
	begin
	
		process (load, d_x, d, x)
		
		begin
		
		case load is
		
			when '1' => d_x <= d;
				
			when '0' => d_x <= x;
				
			when others => null;
				
		end case;
end process;

				
		process (clock, reset, load)
			
			begin
			
				if (reset = '1') then
					 q <= (others => '0');
							
				elsif (rising_edge(clock)) then
					
					if ( reset = '1') then
						
						q <= ( others => '0');
						
							else
								
								if (enable = '1') then
									
									q <= d_x;
									
									else
								
										q <= (others => '0'); 
				end if;
			end if;
		end if;
	end process;

end architecture;	