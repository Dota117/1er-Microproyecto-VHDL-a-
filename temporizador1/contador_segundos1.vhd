library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity contador_segundos1 is
    Port ( clk_1hz : in STD_LOGIC;
           rst : in STD_LOGIC;
           start : out STD_LOGIC);
end contador_segundos1

  architecture arch1 of contador_segundos1 is

