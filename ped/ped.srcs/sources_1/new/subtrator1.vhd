----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.11.2018 22:24:16
-- Design Name: 
-- Module Name: subw1 - Behavioral
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
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity subs1 is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           bout : out STD_LOGIC;
           bin : in STD_LOGIC;
           sub : out STD_LOGIC);
end subs1;

architecture Behavioral of subs1 is

begin
sub <= (A XOR B) XOR bin;

bout <=((not A) AND B) OR (B and bin) OR ((not A)AND bin);


end Behavioral;
