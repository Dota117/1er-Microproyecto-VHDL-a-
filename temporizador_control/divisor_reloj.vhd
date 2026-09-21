library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity divisor_reloj is
    Port ( 
        clk_in  : in  STD_LOGIC;
        rst     : in  STD_LOGIC;
        clk_1hz : out STD_LOGIC
    );
