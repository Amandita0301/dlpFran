library ieee;
use ieee.std_logic_1164.all;

entity Q3 is
	port 
	(
		clk, rst, remote, sensors : in STD_LOGIC;
		siren : out STD_LOGIC
	);
end entity;

architecture Francin of Q3 is
	type state is (disarmed, wait1, armed, wait2, intrusion, wait3);
	attribute enum_encoding : string;
--	attribute enum_encoding of state : type is "sequential";
-- attribute enum_encoding of state : type is "000 001 010 011 110";  -- significado dos bits (Sirene Armado Codigo)
	signal pr_state, nx_state        : state;
begin
	----Lower section of FSM:---------
	process (clk, rst) begin
		if (rst = '1') then
			pr_state <= disarmed;
		elsif (clk'EVENT and clk = '1') then
			pr_state <= nx_state;
		end if;
	end process;
	----Upper section of FSM:---------
	process (pr_state, remote, sensors)
	begin
		--siren <= '0';
		case pr_state is
		
			when disarmed => siren <= '0';
				if (remote = '1') then
					nx_state <= wait1;
				else
					nx_state <= disarmed;
				end if;
				
			when wait1 => siren <= '0';
				if (remote = '0') then
					nx_state <= armed;
				else
					nx_state <= wait1;
				end if;
				
			when armed => siren <= '0';
				if (sensors = '1') then
					nx_state <= intrusion;
				elsif (remote = '1') then
					nx_state <= wait2;
				else
					nx_state <= armed;
				end if;
				
			when wait2 => siren <= '0';
				if (remote = '0') then
					nx_state <= disarmed;
				else 
					nx_state <= wait2;
				end if;
				
			when intrusion => siren <= '1';
				if (remote = '1') then
					nx_state <= wait3;
				else
					nx_state <= intrusion;
				end if;
				
			when wait3 => siren <= '0';
				if (remote = '0') then
					nx_state <= disarmed;
				else 
					nx_state <= wait3;
				end if;
				
		end case;
	end process;
end architecture;

