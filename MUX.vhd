
-- DIGITAL MULTIPLEXER 4to2

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- Dichiarazione entità

entity mux is
	port(			
		switch        : in  std_logic; -- selettore d'ingressi
		
		led_0			  : in std_logic_vector(8 downto 0);
		seg_0			  : in std_logic_vector(20 downto 0);
		led_1			  : in std_logic_vector(8 downto 0);
		seg_1			  : in std_logic_vector(20 downto 0);
		
		led_out       : out std_logic_vector(8 downto 0);
		seg_out		  : out std_logic_vector(20 downto 0)
		);
end mux;

architecture rtl of mux is

	begin
	
	input_selector: process(switch, led_0, seg_0, led_1, seg_1)
		begin
			case switch is
			-- switch off = funzionamento automatico
				when '0' =>
					led_out <= led_0;
					seg_out <= NOT seg_0;
			-- switch on = funzionamento manuale
				when '1' =>
					led_out <= led_1;
					seg_out <= NOT seg_1;
				when others =>
					NULL;
			end case;
		end process input_selector;

end rtl;