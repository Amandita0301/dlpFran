library ieee; 
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;

entity comp2 is 
	generic(n : natural := 3);
	port(
		a : in std_logic_vector(n -1 downto 0);
		sel : in std_logic; 
		b : out std_logic_vector(n-1 downto 0)
	);

end entity;

architecture rtl of comp2 is 

begin 
	
--	with sel select
--		b <= (not a) when => '0',
--		b <= a when => others;

	process(sel, a)
	begin 
		if sel = '1' then 
			b <= not a; 
		else 
			b <= a; 
		end if; 
	end process;

end architecture; 

