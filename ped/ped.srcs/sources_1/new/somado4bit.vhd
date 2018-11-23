

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity somador4 is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           cout : out STD_LOGIC;
           cin : in STD_LOGIC;
           soma : out STD_LOGIC_VECTOR (3 downto 0));
end somador4;

architecture Behavioral of somador4 is
component soma1 is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           cout : out STD_LOGIC;
           cin : in STD_LOGIC;
           soma : out STD_LOGIC);
end component;
signal cu1,cu2,cu3 : STD_LOGIC;
begin
    somabit1 : soma1 PORT MAP(a(0),b(0),cu1,'0',soma(0));
    somabit2 : soma1 PORT MAP(a(1),b(1),cu2,cu1,soma(1));
    somabit3 : soma1 PORT MAP(a(2),b(2),cu3,cu2,soma(2));
    somabit4 : soma1 PORT MAP(a(3),b(3),cout,cu3,soma(3));

end Behavioral;
