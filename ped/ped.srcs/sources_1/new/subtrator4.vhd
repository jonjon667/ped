----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.11.2018 22:36:51
-- Design Name: 
-- Module Name: subtrator4 - Behavioral
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

entity subtrator4 is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           bout : out STD_LOGIC;
           bin : in STD_LOGIC;
           sub : out STD_LOGIC_VECTOR (3 downto 0));
end subtrator4;

architecture Behavioral of subtrator4 is

component subs1 is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           bout : out STD_LOGIC;
           bin : in STD_LOGIC;
           sub : out STD_LOGIC);
end component;

signal ass1,ass2,ass3 : STD_LOGIC;
begin
    subsbit1 : subs1 PORT MAP(A(0),B(0),ass1,'0',sub(0));
    substbit2 : subs1 PORT MAP(A(1),B(1),ass2,ass1,sub(1));
    subsbit3 : subs1 PORT MAP(A(2),B(2),ass3,ass2,sub(2));
    subsbit4 : subs1 PORT MAP(A(3),B(3),bout,ass3,sub(3));
end Behavioral;

