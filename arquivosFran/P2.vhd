library ieee;

use ieee.numeric_std.all;
use ieee.std_logic_1164.all;


entity prova is
	


	port (	load : in std_logic;
				clock : in std_logic;
				reset : in std_logic;
				
				d : in std_logic_vector ( 3 downto 0);
				x : in std_logic_vector ( 3 downto 0);
				
				q : out std_logic_vector ( 3 downto 0)
	
	);
	
end entity;


architecture logica of prova is

	signal d_x : std_logic_vector ( 3 downto 0);
	
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
				q <= d_x;
				
			end if;
		end process;

end architecture;	