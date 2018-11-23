----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.11.2018 14:07:15
-- Design Name: 
-- Module Name: negative - Behavioral
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

entity negative is
    Port ( a : in STD_LOGIC_VECTOR(3 downto 0);
           s : out STD_LOGIC_VECTOR(3 downto 0) );
end negative;

architecture Behavioral of negative is

    component add1 is
        Port ( a : in STD_LOGIC_VECTOR(3 downto 0);
               s : out STD_LOGIC_VECTOR(3 downto 0) );
    end component;

    signal signal1 : STD_LOGIC_VECTOR(3 downto 0);

begin

    signal1 <= NOT a;
    SOMA1: add1 PORT MAP(signal1, s);

end Behavioral;