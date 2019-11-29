library ieee;
use ieee.std_logic_1164.all;

entity mux is
	--generic
	--( n : natural := 4 );

	port
	(
		-- Input ports
		load	: in  std_logic;
		d, x : in std_logic;
		--d, x : in std_logic_vector(n-1 downto 0);
		
		-- Output ports
		o	: out std_logic
		--o	: out std_logic_vector(n-1 downto 0)
	);
end entity;


architecture ifsc_v1 of mux is
begin
	Mux: process(load) is
	begin
		case load is
			when '0' => o <= d;
			when others => o <= x;
		end case;
	end process;
end architecture;