---
--- LIBRARIES
---
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
---
--- ENTITY
---
entity muxdisplay7seg is
    Port ( A:in STD_LOGIC_VECTOR(3 downto 0);
           B:in STD_LOGIC_VECTOR(3 downto 0);
           c:in STD_LOGIC_VECTOR(1 downto 0); 
           S:in STD_LOGIC_VECTOR(3 downto 0);     
           clk: in STD_LOGIC;--clock da Basys 3 (100 MHz)
           an: out STD_LOGIC_VECTOR (3 downto 0):="0000";--anodos dos displays de sete segmentos
           seg : out STD_LOGIC_VECTOR (6 downto 0)--catodos dos displays de sete segmentos
          );
end muxdisplay7seg;
---
--- ARCHITECTURE
---
architecture Behavioral of muxdisplay7seg is

    component display7seg
        port ( bcd : in STD_LOGIC_VECTOR (3 downto 0); 
           seg : out STD_LOGIC_VECTOR (6 downto 0)
        );
    end component;
    component conversorDecimal is
        Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
               uni : out STD_LOGIC_VECTOR (3 downto 0);
               dec : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    component conversorOcta is
        Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
               uni : out STD_LOGIC_VECTOR (3 downto 0);
               dec : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    component seletor is
        Port ( a, b, s : in STD_LOGIC_VECTOR(3 downto 0);
               over:out STD_LOGIC;
               f : out STD_LOGIC_VECTOR(3 downto 0) );
    end component;
    
    signal clk_dividido: STD_LOGIC:='0';--Clock divido
    signal count: STD_LOGIC_VECTOR(15 downto 0) := "0000000000000000";--Contador para o clock dividido
    signal Sbcd: STD_LOGIC_VECTOR (3 downto 0):=(others => '0');--Armazena o bcd que será mostrado no display
    signal seletor_bcd: STD_LOGIC_VECTOR(1 downto 0):="00";
    signal mil:STD_LOGIC_VECTOR(3 downto 0):="0000";
    signal cent:STD_LOGIC_VECTOR(3 downto 0):="0000";
    signal dec: STD_LOGIC_VECTOR(3 downto 0):="0000";
    signal uni: STD_LOGIC_VECTOR(3 downto 0):="0000";
    signal San: STD_LOGIC_VECTOR (3 downto 0):="1111";
    signal Sseg: STD_LOGIC_VECTOR (6 downto 0):="1111111";
    signal erro:STD_LOGIC:='0';
    signal resposta:STD_LOGIC_VECTOR(3 downto 0);
    
begin
    clock_divider: process(clk)
    begin 
    if rising_edge(clk) then
     count <= count + 1;
    end if;
    clk_dividido <= count(15);
    end process;
    opselecionada : seletor port map(A,B,S,erro,resposta);
    ----------------------------
    ----  Processo com cloque dividido -----
    ----------------------------
    escolhe_anodo: process(clk_dividido)
    begin
        if rising_edge(clk_dividido) then
        seletor_bcd  <= seletor_bcd + 1;
            case seletor_bcd is
                when "00" =>  Sbcd  <= uni; San <= "1110";
                when "01" =>  Sbcd  <= dec;  San <= "1101";
                when "10" => Sbcd <= cent; San<="1011";
                when "11" => Sbcd <= mil; San<="0111";
                when others => null;
            end case;
--            case Sbcd is
--                when "0000" => Sseg <= "1000000"; -- 0
--                when "0001" => Sseg <= "1111001"; -- 1
--                when "0010" => Sseg <= "0100100"; -- 2
--                when "0011" => Sseg <= "0110000"; -- 3
--                when "0100" => Sseg <= "0011001"; -- 4
--                when "0101" => Sseg <= "0010010"; -- 5
--                when "0110" => Sseg <= "0000010"; -- 6
--                when "0111" => Sseg <= "1111000"; -- 7
--                when "1000" => Sseg <= "0000000"; -- 8
--                when "1001" => Sseg <= "0010000"; -- 9
--                when "1010" => Sseg <= "0001000"; -- a
--                when "1011" => Sseg <= "0000011"; -- b
--                when "1100" => Sseg <= "1000110"; -- c
--                when "1101" => Sseg <= "0100001"; -- d
--                when "1110" => Sseg <= "0000110"; -- e
--                when "1111" => Sseg <= "0001110"; -- f
--                when others => Sseg <= "1111111"; -- others
--            end case;
            
        end if;      
    end process;
    
    seg <= Sseg;
    an <= San;
    driver_BCD_7seg: display7seg port map (Sbcd,seg);
--    with Sbcd select           
--        seg <= "1000000" when "0000",  -- '0'
--               "1111001" when "0001",  -- '1'
--               "0100100" when "0010",  -- '2'
--               "0110000" when "0011",  -- '3'
--               "0011001" when "0100",  -- '4' 
--               "0010010" when "0101",  -- '5'
--               "0000010" when "0110",  -- '6'
--               "1111000" when "0111",  -- '7'
--               "0000000" when "1000",  -- '8'
--               "0010000" when "1001",  -- '9'
--               "0001000" when "1010",  -- 'A'
--               "0000011" when "1011",  -- 'b'
--               "1000110" when "1100",  -- 'C'
--               "0100001" when "1101",  -- 'd'
--               "0000110" when "1110",  -- 'E'
--               "0001110" when "1111",  -- 'F' 
--               "1111111" when others;  -- apaga  
----
end Behavioral;
