library ieee;
use ieee.std_logic_1164.all;

entity reg is
	--generic
	--( n : natural := 4 );

	port
	(
		clk: in  std_logic;
		d	: in  std_logic;
		q	: out  std_logic
		--d : in std_logic_vector(n-1 downto 0);
		--q : out std_logic_vector(n-1 downto 0)
	);
end entity;

architecture ifsc_v1 of reg is
begin
	
	reg: process(clk)
	begin
		if (rising_edge (clk)) then
			q <= d;
		end if;
	end process;
end architecture;