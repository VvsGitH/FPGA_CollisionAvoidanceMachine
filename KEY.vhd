-- LOGICA DEL FUNZIONAMENTO MANUALE

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

-- DICHIARAZIONE ENTITA'

entity key is
	port(
		-- input
		switch_comb : 	in std_logic_vector(4 downto 0);
		-- output
		validator:		out std_logic;
		led_out : 		out std_logic_vector(34 downto 0)
		);
end entity key;

architecture security of key is
	-- Registri
	SIGNAL correct_key : std_logic_vector(4 downto 0) := "10101";
	begin
	
		key_verifier: process(switch_comb)
			begin
				if(switch_comb = correct_key) then
					validator <= '1';
					led_out <= "11111111010100101010101001110101111"; -- HELLO
				elsif(switch_comb /= "00000") then
					validator <= '0';
					led_out <= "00000001010100101010101001110101111"; -- LOCK
				else
					validator <= '0';
					led_out <= ( others =>'0');
				end if;
			end process key_verifier;
			
	end architecture security;
					
				