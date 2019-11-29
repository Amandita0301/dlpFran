library ieee;
use ieee.std_logic_1164.all;

entity robo_asp is
	port(
		clk, rst  : in std_logic; 
		S, L      : in std_logic;   -- S = Sensor, L = Limpando 
		A, D, E   : out std_logic;  -- A = avançar, D = Direita, E = Esquerda
		Aspirando : out std_logic
		);
end entity;

architecture Francin_v1 of robo_asp is
	type state is (
		W1, W2, Inicio, Fim, I1, I2, I3, I4, I5, A1, A2, R1, R2, R3, R4
		-- I = inicio, A = Avançar, R = Rotacionar 
	);
	signal pr_state, nx_state: state;
	-- attribute enum_encoding: string; --optional attribute
	-- attribute enum_encoding of state: type is "sequential";
begin
	process(clk, rst)
	begin
		if rst = '1' then
			pr_state <= inicio;
		elsif rising_edge(clk) then
			pr_state <= nx_state;
		end if;
	end process;
	
	process(pr_state, S, L)
	begin
		-- Default 
		Aspirando <= '0';
		A <= '0';
		D <= '0';
		E <= '0';
		case pr_state is
			when Inicio =>
				if L = '1' then
					nx_state <= W1;
				else
					nx_state <= Inicio;
				end if;
				
			when W1 =>
				if L = '0' then
					nx_state <= I1;
				else
					nx_state <= W1;
				end if;
				
			when W2 =>
				if L = '0' then
					nx_state <= Inicio;
				else
					nx_state <= W2;
				end if;
				
			when fim => nx_state <= fim;
			
			when I1 => A <= '1';
				if S = '1' then
					nx_state <= I2;
				else
					nx_state <= I1;
				end if;
				
			when I2 => E <= '1';
				nx_state <= I3;
				
			when I3 => A <= '1';
				if S = '1' then
					nx_state <= I4;
				else
					nx_state <= I3;
				end if;
				
			when I4 => D <= '1';
				nx_state <= I5;
				
			when I5 => D <= '1';
				if L = '1' then
					nx_state <= W2;
				else
					nx_state <= A1;
				end if;
				
			when A1 => Aspirando <= '1';
									 A <= '1';
				if L = '1' then
					nx_state <= W2;
				elsif S = '1' then
					nx_state <= R1;
				else
					nx_state <= A1;
				end if;
				
			when R1 => Aspirando <= '1';
				                D <= '1';
				                A <= '1';
				if S = '1' then
					nx_state <= Fim;
				else
					nx_state <= R2;
				end if;
				
			when R2 => Aspirando <= '1';
									 D <= '1';
				nx_state <= A2;
				
			when A2 => Aspirando <= '1';
								    A <= '1';
				if L = '1' then
					nx_state <= W2;
				elsif S = '1' then
					nx_state <= R3;
				else
					nx_state <= A2;
				end if;
				
			when R3 => Aspirando <= '1';
									 E <= '1';
				if S = '1' then
					nx_state <= Fim;
				else
					nx_state <= R4;
				end if;
				
			when R4 => Aspirando <= '1';
									 E <= '1';
				nx_state <= A1;
				
		end case;
	end process;
end architecture;

architecture Francin_v2 of robo_asp is
	type state is (
		W1, W2, Inicio, Fim, I1, I2, I3, I4, I5, A1, A2, A3, A4, R1, R2, R3, R4
	);
	signal pr_state, nx_state: state;
	-- attribute enum_encoding: string; --optional attribute
	-- attribute enum_encoding of state: type is "sequential";
begin
	process(clk, rst)
	begin
		if rst = '1' then
			pr_state <= inicio;
		elsif rising_edge(clk) then -- subida da borda do clock
			pr_state <= nx_state;
		end if;
	end process;
	
	process(pr_state, S, L)
	begin
	-- Default 
		Aspirando <= '0';
		A <= '0';
		D <= '0';
		E <= '0';
		
		case pr_state is
			when Inicio =>
				if L = '1' then
					nx_state <= W1;
				else
					nx_state <= Inicio;
				end if;
				
			when W1 =>
				if L = '0' then
					nx_state <= I1;
				else
					nx_state <= W1;
				end if;
				
			when W2 =>
				if L = '0' then
					nx_state <= Inicio;
				else
					nx_state <= W2;
				end if;
				
			when Fim =>
				nx_state <= Fim;
				
			when I1 => A <= '1';
				if L = '1' then
					nx_state <= W2;
				elsif S = '1' then
					nx_state <= I2;
				else
					nx_state <= I1;
				end if;
				
			when I2 => E <= '1';
				nx_state <= I3;
				
			when I3 => A <= '1';
				if L = '1' then
					nx_state <= W2;
				elsif S = '1' then
					nx_state <= I4;
				else
					nx_state <= I3;
				end if;
				
			when I4 => D <= '1';
				nx_state <= I5;
				
			when I5 => D <= '1';
				nx_state <= A1;
				
			when A1 => Aspirando <= '1';
									 A <= '1';
				if L = '1' then
					nx_state <= W2;
				elsif S = '1' then
					nx_state <= R1;
				else
					nx_state <= A1;
				end if;
				
			when R1 => Aspirando <= '1';
									 D <= '1';
				if S = '1' then
					nx_state <= Fim;
				else
					nx_state <= A2;
				end if;
				
			when A2 => Aspirando <= '1';
									 A <= '1';
				nx_state <= R2;
				
			when R2 => Aspirando <= '1';
									 D <= '1';
				nx_state <= A3;
				
			when A3 => Aspirando <= '1';
									 A <= '1';
				if L = '1' then
					nx_state <= W2;
				elsif S = '1' then
					nx_state <= R3;
				else
					nx_state <= A3;
				end if;
				
			when R3 => Aspirando <= '1';
									 E <= '1';
				if S = '1' then
					nx_state <= Fim;
				else
					nx_state <= A4;
				end if;
				
			when A4 => Aspirando <= '1';
									 A <= '1';
				nx_state <= R4;
				
			when R4 => nx_state <= A1;
			
		end case;
	end process;
end architecture;

CONFIGURATION conf_robo OF robo_asp IS
   FOR Francin_v1 END FOR;
END CONFIGURATION;
