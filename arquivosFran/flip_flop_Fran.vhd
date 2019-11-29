library ieee; 
use ieee.std_logic_1164.all;
use ieee.numeric_std;

entity flip_flop is 
	generic(max : natural := 3);
	port(
		clk, clr : in std_logic;
		d : in std_logic_vector(max -1 downto 0);
		q : out std_logic_vector(max -1 downto 0)
	); 
	
end entity;

architecture rtl of flip_flop is 

begin
		process(clk)
		
		begin 
			if clr = '1' then 
				q <= "000";
			elsif rising_edge(clk) then 
				q <= d; 		
			end if;
		
		end process;

end architecture;
