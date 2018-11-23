----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.11.2018 21:38:40
-- Design Name: 
-- Module Name: seletorOp - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.ALL;
use IEEE.numeric_std.ALL;

entity seletor is
    Port ( a, b, s : in STD_LOGIC_VECTOR(3 downto 0);
           over:out STD_LOGIC;
           f : out STD_LOGIC_VECTOR(3 downto 0) );
end seletor;

architecture Behavioral of seletor is
    
    component negative is
        Port ( a : in STD_LOGIC_VECTOR(3 downto 0);
               s : out STD_LOGIC_VECTOR(3 downto 0) );
    end component;
    
    component somador4 is
        Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
               B : in STD_LOGIC_VECTOR (3 downto 0);
               cout : out STD_LOGIC;
               cin : in STD_LOGIC;
               soma : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    component subtrator4 is
        Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
               B : in STD_LOGIC_VECTOR (3 downto 0);
               bout : out STD_LOGIC;
               bin : in STD_LOGIC;
               sub : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    component  xorab is
       Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
              B : in STD_LOGIC_VECTOR (3 downto 0);
              saida : out STD_LOGIC_VECTOR (3 downto 0));
   end component;
   
    component ORAB is
       Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
              B : in STD_LOGIC_VECTOR (3 downto 0);
              saida : out STD_LOGIC_VECTOR (3 downto 0));
   end component;
   
  component nota is
       Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
              saida : out STD_LOGIC_VECTOR (3 downto 0));
   end  component;

  component multiplicador is
    Port ( a, b : in STD_LOGIC_VECTOR(3 downto 0);
           s : out STD_LOGIC_VECTOR(3 downto 0) );
  end component;

  component divisor is
    Port ( a, b : in STD_LOGIC_VECTOR(3 downto 0);
           s : out STD_LOGIC_VECTOR(3 downto 0) );
  end component;

  component mod is
    Port ( a, b : in STD_LOGIC_VECTOR(3 downto 0);
           s : out STD_LOGIC_VECTOR(3 downto 0) );
  end component;
   
    signal errorS,errorSub : STD_LOGIC:='0';
    signal neg : STD_LOGIC_VECTOR(3 downto 0);
    signal soma,xoab,orba,opb,notia: STD_LOGIC_VECTOR(3 downto 0);
    signal subs: STD_LOGIC_VECTOR(3 downto 0);
    signal mult, div, mod, pow : STD_LOGIC_VECTOR(3 downto 0);
begin
    
    negativ: negative PORT MAP(a, neg);
    somador: somador4 PORT MAP(a,b,errorS,'0',soma); --CALCULANDO TODAS AS OPERAÇOES AO MESMO TEMPO
    subtrator:subtrator4 PORT MAP(a,b,errorSub,'0',subs);
    exorab : xorab port map(a,b,xoab);
    oab : orab port map(a,b,orba);
    naoa : nota port map(a,notia);
    multiplicar : multiplicador PORT MAP(a, b, mult);
    dividir : divisor PORT MAP(a, b, div);
    mod1 : mod PORT MAP(a, b, mod);
    pow : multiplicador PORT MAP(a, a, pow);
    
    
    process(a,b,s)
    begin 
        case s is
        when "0000" => f <= "0000";
        when "0001" => f <= "1111";
        when "0010" => f <= a;
        when "0011" => f <= b;
        when "0100" => f <= orba;
        when "0101" => f <= a and b;
        when "0110" => f <= xoab;
        when "0111" => f <= notia;
        when "1000" => f <= soma;
        when "1001" => f <= subs;
        when "1010" => f <= mult;
        when "1011" => f <= div;
        when "1100" => f <= mod;
        when "1101" => f <= pow;
        when "1110" => f <= neg;
        when "1111" => f <= a + "0001";
        end case;
    end process;

end Behavioral;

