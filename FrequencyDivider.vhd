
-- Divisore di frequenza da 50Mhz a 6hz

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- Dichiarazione entità

entity clock_div is
	port(
		clk         : in  std_logic; -- clock a 50Mhz
		reset       : in  std_logic; -- reset
		clk_div     : out std_logic  -- clock a circa 6hz
		);
end clock_div;

-- Dichiarazione architettura

architecture rtl of clock_div is

	-- creo un contatarore a 23 bit
	signal clk_divider      : unsigned(22 downto 0):=(others=>'0');
	
		begin

			p_clk_divider: process(reset,clk)
			begin
			-- condizione di reset
				if(reset='1') then
					clk_divider <= (others=>'0');
					
			-- ad ogni colpo di clock incremento il contatore a 23 bit di 1
				elsif(rising_edge(clk)) then
					clk_divider <= clk_divider + 1;
				end if;
			
			end process p_clk_divider;
			
			-- prendo in output l'ultimo bit del contatore a 23bit
			clk_div <= clk_divider(22);
			
end rtl;