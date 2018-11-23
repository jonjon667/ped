----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.11.2018 15:58:40
-- Design Name: 
-- Module Name: conversorocta - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity conversorocta is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           uni : out STD_LOGIC_VECTOR (3 downto 0);
           dec : out STD_LOGIC_VECTOR (3 downto 0));
end conversorocta;

architecture Behavioral of conversorocta is

begin
    with A select uni
    <="0000" when "0000",
      "0001" when "0001",
      "0010" when "0010",
      "0011" when "0011",
      "0100" when "0100",
      "0101" when "0101",
      "0110" when "0110",
      "0111" when "0111",
      "0000" when "1000",
      "0001" when "1001",
      "0010" when "1010",
      "0011" when "1011",
      "0100" when "1100",
      "0101" when "1101",
      "1110" when "1110",
      "0111" when "1111",
      "X" when others
      ;
    with A select dec
      <="0000" when "0000",
        "0000" when "0001",
        "0000" when "0010",
        "0000" when "0011",
        "0000" when "0100",
        "0000" when "0101",
        "0000" when "0110",
        "0000" when "0111",
        "0001" when "1000",
        "0001" when "1001",
        "0001" when "1010",
        "0001" when "1011",
        "0001" when "1100",
        "0001" when "1101",
        "0001" when "1110",
        "0001" when "1111",
        "X" when others
        ;

end Behavioral;
