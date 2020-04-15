-- LOGICA DEL FUNZIONAMENTO AUTOMATICO

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

-- DICHIARAZIONE ENTITA'

entity state_logic_auto is 
	port (
	clk_div		: in std_logic; -- segnale di clock
	reset		: in std_logic; -- segnale di reset
	
	-- vettori di input
	data_in	: in std_logic_vector(3 downto 0);
	
	-- segnali di accensione dei LED
	led_out	: out std_logic_vector(8 downto 0);
	
	-- segnali di accensione del 7 segmenti
	seg_out	: out std_logic_vector(20 downto 0)
	);
end entity state_logic_auto;
	

-- DICHIARAZIONE ARCHITETTURA

architecture rtl of state_logic_auto is
	-- Registri
	TYPE state_type is (s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,s16,s17,sB); -- Definisco gli stati
	SIGNAL state, next_state : state_type;	-- Creo due segnali per identificare stato presente e futuro
		
	-- Definizione archittetura
	begin
	
		-- Condizione di reset e temporizzazione
		statereg: process(clk_div,reset)
			begin
				-- Condizione di reset
				if (reset = '1') then
					state <= s0;
					
				-- Condizione di clock
				elsif rising_edge(clk_div) then
				state <= next_state;	
				end if;
			end process statereg;
					
		-- Logica a stati
		fsm: process(state, data_in)
			begin
				case state is
				
					-- stato s0
					when s0 =>
						-- Output
						led_out <= "000000000";	--led spenti
						seg_out <= "100000010000001000000";	--acceso il segmento centrale
						-- Transitions
						case data_in is
							when "0000" => next_state <= s1;
							when "0001" => next_state <= s1;
							when "0010" => next_state <= s2;
							when "0011" => next_state <= s2;
							when "0100" => next_state <= s6;
							when "0101" => next_state <= s6;
							when "0110" => next_state <= s10;
							when "0111" => next_state <= s0;
							when "1000" => next_state <= s10;
							when "1001" => next_state <= s0;
							when "1010" => next_state <= s10;
							when "1011" => next_state <= s0;
							when "1100" => next_state <= s14;
							when "1101" => next_state <= s0;
							when "1110" => next_state <= s10;
							when "1111" => next_state <= s0;
							when others => next_state <= s0;
						end case;
						
					-- stato s1
					when s1 =>
						-- Output
						led_out <= "000010000";	--led centrale
						seg_out <= "001111001111001110001";	--freccia in alto
						-- Transitions
						case data_in is
							when "0000" => next_state <= s1;
							when "0001" => next_state <= s1;
							when "0010" => next_state <= s2;
							when "0011" => next_state <= s2;
							when "0100" => next_state <= s6;
							when "0101" => next_state <= s6;
							when "0110" => next_state <= s10;
							when "0111" => next_state <= s0;
							when "1000" => next_state <= s10;
							when "1001" => next_state <= s0;
							when "1010" => next_state <= s10;
							when "1011" => next_state <= s0;
							when "1100" => next_state <= s14;
							when "1101" => next_state <= s0;
							when "1110" => next_state <= s10;
							when "1111" => next_state <= s0;
							when others => next_state <= s0;
						end case;
					
					-- stato s2
					when s2 =>
						-- Output
						led_out <= "000001000";	--1st led dx
						seg_out <= "001111001111001110001";	--freccia in alto
						-- Transitions
						case data_in is
							when "0000" => next_state <= s1;
							when "0001" => next_state <= s1;
							when "0010" => next_state <= s3;
							when "0011" => next_state <= s3;
							when "0100" => next_state <= s1;
							when "0101" => next_state <= s1;
							when "0110" => next_state <= s10;
							when "0111" => next_state <= s0;
							when "1000" => next_state <= s10;
							when "1001" => next_state <= s0;
							when "1010" => next_state <= s10;
							when "1011" => next_state <= s0;
							when "1100" => next_state <= s14;
							when "1101" => next_state <= s0;
							when "1110" => next_state <= s10;
							when "1111" => next_state <= s0;
							when others => next_state <= s0;
						end case;
					
					-- stato s3
					when s3 =>
						-- Output
						led_out <= "000000100";	--2nd led dx
						seg_out <= "001111001111001110001";	--freccia in alto
						case data_in is
							when "0000" => next_state <= s1;
							when "0001" => next_state <= s1;
							when "0010" => next_state <= s4;
							when "0011" => next_state <= s4;
							when "0100" => next_state <= s2;
							when "0101" => next_state <= s2;
							when "0110" => next_state <= s10;
							when "0111" => next_state <= s0;
							when "1000" => next_state <= s10;
							when "1001" => next_state <= s0;
							when "1010" => next_state <= s10;
							when "1011" => next_state <= s0;
							when "1100" => next_state <= s14;
							when "1101" => next_state <= s0;
							when "1110" => next_state <= s10;
							when "1111" => next_state <= s0;
							when others => next_state <= s0;
						end case;
					
					-- stato s4
					when s4 =>
						-- Output
						led_out <= "000000010";	--3rd led dx
						seg_out <= "001111001111001110001";	--freccia in alto
						case data_in is
							when "0000" => next_state <= s1;
							when "0001" => next_state <= s1;
							when "0010" => next_state <= s5;
							when "0011" => next_state <= s5;
							when "0100" => next_state <= s3;
							when "0101" => next_state <= s3;
							when "0110" => next_state <= s10;
							when "0111" => next_state <= s0;
							when "1000" => next_state <= s10;
							when "1001" => next_state <= s0;
							when "1010" => next_state <= s10;
							when "1011" => next_state <= s0;
							when "1100" => next_state <= s14;
							when "1101" => next_state <= s0;
							when "1110" => next_state <= s10;
							when "1111" => next_state <= s0;
							when others => next_state <= s0;
						end case;
					
					-- stato s5
					when s5 =>
						-- Output
						led_out <= "000000001";	--4th led dx
						seg_out <= "001111001111001110001";	--freccia in alto
						case data_in is
							when "0000" => next_state <= s1;
							when "0001" => next_state <= s1;
							when "0010" => next_state <= sB;
							when "0011" => next_state <= sB;
							when "0100" => next_state <= s4;
							when "0101" => next_state <= s4;
							when "0110" => next_state <= s10;
							when "0111" => next_state <= s0;
							when "1000" => next_state <= s10;
							when "1001" => next_state <= s0;
							when "1010" => next_state <= s10;
							when "1011" => next_state <= s0;
							when "1100" => next_state <= s14;
							when "1101" => next_state <= s0;
							when "1110" => next_state <= s10;
							when "1111" => next_state <= s0;
							when others => next_state <= s0;
						end case;
					
					-- stato s6
					when s6 =>
						-- Output
						led_out <= "000100000";	--1st led sx
						seg_out <= "001111001111001110001";	--freccia in alto
						case data_in is
							when "0000" => next_state <= s1;
							when "0001" => next_state <= s1;
							when "0010" => next_state <= s1;
							when "0011" => next_state <= s1;
							when "0100" => next_state <= s7;
							when "0101" => next_state <= s7;
							when "0110" => next_state <= s10;
							when "0111" => next_state <= s0;
							when "1000" => next_state <= s10;
							when "1001" => next_state <= s0;
							when "1010" => next_state <= s10;
							when "1011" => next_state <= s0;
							when "1100" => next_state <= s14;
							when "1101" => next_state <= s0;
							when "1110" => next_state <= s10;
							when "1111" => next_state <= s0;
							when others => next_state <= s0;
						end case;
					
					-- stato s7
					when s7 =>
						-- Output
						led_out <= "001000000";	--2nd led sx
						seg_out <= "001111001111001110001";	--freccia in alto
						case data_in is
							when "0000" => next_state <= s1;
							when "0001" => next_state <= s1;
							when "0010" => next_state <= s6;
							when "0011" => next_state <= s6;
							when "0100" => next_state <= s8;
							when "0101" => next_state <= s8;
							when "0110" => next_state <= s10;
							when "0111" => next_state <= s0;
							when "1000" => next_state <= s10;
							when "1001" => next_state <= s0;
							when "1010" => next_state <= s10;
							when "1011" => next_state <= s0;
							when "1100" => next_state <= s14;
							when "1101" => next_state <= s0;
							when "1110" => next_state <= s10;
							when "1111" => next_state <= s0;
							when others => next_state <= s0;
						end case;
						
					-- stato s8
					when s8 =>
						-- Output
						led_out <= "010000000";	--3rd led sx
						seg_out <= "001111001111001110001";	--freccia in alto
						case data_in is
							when "0000" => next_state <= s1;
							when "0001" => next_state <= s1;
							when "0010" => next_state <= s7;
							when "0011" => next_state <= s7;
							when "0100" => next_state <= s9;
							when "0101" => next_state <= s9;
							when "0110" => next_state <= s10;
							when "0111" => next_state <= s0;
							when "1000" => next_state <= s10;
							when "1001" => next_state <= s0;
							when "1010" => next_state <= s10;
							when "1011" => next_state <= s0;
							when "1100" => next_state <= s14;
							when "1101" => next_state <= s0;
							when "1110" => next_state <= s10;
							when "1111" => next_state <= s0;
							when others => next_state <= s0;
						end case;
					
					-- stato s9
					when s9 =>
						-- Output
						led_out <= "100000000";	--4th led sx
						seg_out <= "001111001111001110001";	--freccia in alto
						case data_in is
							when "0000" => next_state <= s1;
							when "0001" => next_state <= s1;
							when "0010" => next_state <= s8;
							when "0011" => next_state <= s8;
							when "0100" => next_state <= sB;
							when "0101" => next_state <= sB;
							when "0110" => next_state <= s10;
							when "0111" => next_state <= s0;
							when "1000" => next_state <= s10;
							when "1001" => next_state <= s0;
							when "1010" => next_state <= s10;
							when "1011" => next_state <= s0;
							when "1100" => next_state <= s14;
							when "1101" => next_state <= s0;
							when "1110" => next_state <= s10;
							when "1111" => next_state <= s0;
							when others => next_state <= s0;
						end case;
					
					-- stato s10
					when s10 =>
						-- Output
						led_out <= "000100000";	--1st led sx
						seg_out <= "001111001111001111111";	--freccia in basso
						case data_in is
							when "0000" => next_state <= s1;
							when "0001" => next_state <= s1;
							when "0010" => next_state <= s2;
							when "0011" => next_state <= s2;
							when "0100" => next_state <= s6;
							when "0101" => next_state <= s6;
							when "0110" => next_state <= s10;
							when "0111" => next_state <= s0;
							when "1000" => next_state <= s10;
							when "1001" => next_state <= s0;
							when "1010" => next_state <= s11;
							when "1011" => next_state <= s0;
							when "1100" => next_state <= s14;
							when "1101" => next_state <= s0;
							when "1110" => next_state <= s11;
							when "1111" => next_state <= s0;
							when others => next_state <= s0;
						end case;
					
					-- stato s11
					when s11 =>
						-- Output
						led_out <= "001000000";	--2nd led sx
						seg_out <= "001111001111001111111";	--freccia in basso
						case data_in is
							when "0000" => next_state <= s1;
							when "0001" => next_state <= s1;
							when "0010" => next_state <= s2;
							when "0011" => next_state <= s2;
							when "0100" => next_state <= s6;
							when "0101" => next_state <= s6;
							when "0110" => next_state <= s10;
							when "0111" => next_state <= s0;
							when "1000" => next_state <= s10;
							when "1001" => next_state <= s0;
							when "1010" => next_state <= s12;
							when "1011" => next_state <= s0;
							when "1100" => next_state <= s10;
							when "1101" => next_state <= s0;
							when "1110" => next_state <= s12;
							when "1111" => next_state <= s0;
							when others => next_state <= s0;
						end case;
					
					-- stato s12
					when s12 =>
						-- Output
						led_out <= "010000000";	--3rd led sx
						seg_out <= "001111001111001111111";	--freccia in basso
						case data_in is
							when "0000" => next_state <= s1;
							when "0001" => next_state <= s1;
							when "0010" => next_state <= s2;
							when "0011" => next_state <= s2;
							when "0100" => next_state <= s6;
							when "0101" => next_state <= s6;
							when "0110" => next_state <= s10;
							when "0111" => next_state <= s0;
							when "1000" => next_state <= s10;
							when "1001" => next_state <= s0;
							when "1010" => next_state <= s13;
							when "1011" => next_state <= s0;
							when "1100" => next_state <= s11;
							when "1101" => next_state <= s0;
							when "1110" => next_state <= s13;
							when "1111" => next_state <= s0;
							when others => next_state <= s0;
						end case;
					
					-- stato s13
					when s13 =>
						-- Output
						led_out <= "100000000";	--4th led sx
						seg_out <= "001111001111001111111";	--freccia in basso
						case data_in is
							when "0000" => next_state <= s1;
							when "0001" => next_state <= s1;
							when "0010" => next_state <= s2;
							when "0011" => next_state <= s2;
							when "0100" => next_state <= s6;
							when "0101" => next_state <= s6;
							when "0110" => next_state <= s10;
							when "0111" => next_state <= s0;
							when "1000" => next_state <= s10;
							when "1001" => next_state <= s0;
							when "1010" => next_state <= sB;
							when "1011" => next_state <= s0;
							when "1100" => next_state <= s12;
							when "1101" => next_state <= s0;
							when "1110" => next_state <= sB;
							when "1111" => next_state <= s0;
							when others => next_state <= s0;
						end case;
					
					-- stato s14
					when s14 =>
						-- Output
						led_out <= "000001000";	--1st led dx
						seg_out <= "001111001111001111111";	--freccia in basso
						case data_in is
							when "0000" => next_state <= s1;
							when "0001" => next_state <= s1;
							when "0010" => next_state <= s2;
							when "0011" => next_state <= s2;
							when "0100" => next_state <= s6;
							when "0101" => next_state <= s6;
							when "0110" => next_state <= s14;
							when "0111" => next_state <= s0;
							when "1000" => next_state <= s14;
							when "1001" => next_state <= s0;
							when "1010" => next_state <= s10;
							when "1011" => next_state <= s0;
							when "1100" => next_state <= s15;
							when "1101" => next_state <= s0;
							when "1110" => next_state <= s15;
							when "1111" => next_state <= s0;
							when others => next_state <= s0;
						end case;
					
					-- stato s15
					when s15 =>
						-- Output
						led_out <= "000000100";	--2nd led dx
						seg_out <= "001111001111001111111";	--freccia in basso
						case data_in is
							when "0000" => next_state <= s1;
							when "0001" => next_state <= s1;
							when "0010" => next_state <= s2;
							when "0011" => next_state <= s2;
							when "0100" => next_state <= s6;
							when "0101" => next_state <= s6;
							when "0110" => next_state <= s14;
							when "0111" => next_state <= s0;
							when "1000" => next_state <= s14;
							when "1001" => next_state <= s0;
							when "1010" => next_state <= s14;
							when "1011" => next_state <= s0;
							when "1100" => next_state <= s16;
							when "1101" => next_state <= s0;
							when "1110" => next_state <= s16;
							when "1111" => next_state <= s0;
							when others => next_state <= s0;
						end case;
					
					-- stato s16
					when s16 =>
						-- Output
						led_out <= "000000010";	--3rd led dx
						seg_out <= "001111001111001111111";	--freccia in basso
						case data_in is
							when "0000" => next_state <= s1;
							when "0001" => next_state <= s1;
							when "0010" => next_state <= s2;
							when "0011" => next_state <= s2;
							when "0100" => next_state <= s6;
							when "0101" => next_state <= s6;
							when "0110" => next_state <= s14;
							when "0111" => next_state <= s0;
							when "1000" => next_state <= s14;
							when "1001" => next_state <= s0;
							when "1010" => next_state <= s15;
							when "1011" => next_state <= s0;
							when "1100" => next_state <= s17;
							when "1101" => next_state <= s0;
							when "1110" => next_state <= s17;
							when "1111" => next_state <= s0;
							when others => next_state <= s0;
						end case;
					
					-- stato s17
					when s17 =>
						-- Output
						led_out <= "000000001";	--4th led dx
						seg_out <= "001111001111001111111";	--freccia in basso
						case data_in is
							when "0000" => next_state <= s1;
							when "0001" => next_state <= s1;
							when "0010" => next_state <= s2;
							when "0011" => next_state <= s2;
							when "0100" => next_state <= s6;
							when "0101" => next_state <= s6;
							when "0110" => next_state <= s14;
							when "0111" => next_state <= s0;
							when "1000" => next_state <= s14;
							when "1001" => next_state <= s0;
							when "1010" => next_state <= s16;
							when "1011" => next_state <= s0;
							when "1100" => next_state <= sB;
							when "1101" => next_state <= s0;
							when "1110" => next_state <= sB;
							when "1111" => next_state <= s0;
							when others => next_state <= s0;
						end case;
						
					-- stato sB - Stato di blocco post sterzata
					when sB =>
						-- Output
						led_out <= "000000000";	--led spenti
						seg_out <= "100000010000001000000";	--acceso il segmento centrale
						-- Transitions
						case data_in is
							when "0000" => next_state <= s0;
							when "0001" => next_state <= s0;
							when "0010" => next_state <= sB;
							when "0011" => next_state <= sB;
							when "0100" => next_state <= sB;
							when "0101" => next_state <= sB;
							when "0110" => next_state <= sB;
							when "0111" => next_state <= s0;
							when "1000" => next_state <= sB;
							when "1001" => next_state <= s0;
							when "1010" => next_state <= sB;
							when "1011" => next_state <= s0;
							when "1100" => next_state <= sB;
							when "1101" => next_state <= s0;
							when "1110" => next_state <= sB;
							when "1111" => next_state <= s0;
							when others => next_state <= s0;
						end case;
					
					-- Others
					when others =>
						next_state <= s0;
						
				end case;
			end process fsm;
		
end architecture rtl;