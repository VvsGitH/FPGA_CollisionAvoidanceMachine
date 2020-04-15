
-- DIGITAL DE-MULTIPLEXER 1to2

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- Dichiarazione entità

entity demux is
	port(		
		switch	      : in  std_logic; -- selettore d'uscite
		
		data_in			: in std_logic_vector(3 downto 0);
		
		data_out0     	: out std_logic_vector(3 downto 0);
		data_out1	  	: out std_logic_vector(3 downto 0)
		);
end demux;

architecture rtl of demux is
	begin
	
	input_selector: process(switch, data_in)
		begin
			case switch is
			-- switch off = funzionamento automatico
				when '0' =>
					data_out0 <= NOT data_in;
					data_out1 <= "0000";
					
			-- switch on = funzionamento manuale
				when '1' =>
					data_out1 <= NOT data_in;
					data_out0 <= "0000";
				when others =>
					NULL;
			end case;
		end process input_selector;

end rtl;