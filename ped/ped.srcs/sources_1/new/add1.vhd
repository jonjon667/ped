----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.11.2018 14:57:54
-- Design Name: 
-- Module Name: add1 - Behavioral
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

entity add1 is
    Port ( a : in STD_LOGIC_VECTOR(3 downto 0);
           s : out STD_LOGIC_VECTOR(3 downto 0) );
end add1;

architecture Behavioral of add1 is

    component somador4 is
        Port ( a, b : in STD_LOGIC_VECTOR (3 downto 0);
               cin : in STD_LOGIC;
               s : out STD_LOGIC_VECTOR (3 downto 0);
               cout : out STD_LOGIC);
    end component;
    
    signal aterragem : STD_LOGIC;

begin

    SOMA1: somado4 PORT MAP( a, "0000", '1', s, aterragem);

end Behavioral;