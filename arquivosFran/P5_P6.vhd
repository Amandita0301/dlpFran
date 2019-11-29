library ieee;
use ieee.std_logic_1164.all;

entity comp is
	--generic
	--( n_in : natural := 2 );

	port
	(
		load_in, clk_int	: in  std_logic;
--		d_in, x_in : in std_logic_vector(n_in-1 downto 0);
--		q_in : out std_logic_vector(n_in-1 downto 0)
		d_in, x_in : in std_logic;
		q_in : out std_logic

	);
end entity;

architecture ifsc of comp is

	component mux is
		--generic
		--( n : natural := 2 );
		port
		(
			load	: in  std_logic;
--			d, x : in std_logic_vector(n-1 downto 0);
--			o	: out std_logic_vector(n-1 downto 0)

			d, x : in std_logic;
			o	: out std_logic
		);
	end component;

	component reg is
		--generic
		--( n : natural := 2 );
		port
		(
			clk	: in  std_logic;
--			d : in std_logic_vector(n-1 downto 0);
--			q : out std_logic_vector(n-1 downto 0)
			d : in std_logic;
    		q : out std_logic
		);
	end component;

--	signal aux : std_logic_vector(n_in-1 downto 0);
signal aux : std_logic;
	
begin
	
	componente1: component mux
--		generic map( n => n_in )
--		port map(load => load_in, d => d_in, x => x_in, o => aux);
		
		port map(load => load_in, d => d_in, x => x_in, o => aux);

	componente2: component reg
--		generic map( n => n_in )
--		port map( clk => clk_int, d => aux, q => q_in);

		port map( clk => clk_int, d => aux, q => q_in);

end architecture;