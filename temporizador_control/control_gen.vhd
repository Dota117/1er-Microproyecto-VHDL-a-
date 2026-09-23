library IEEE;
use IEEE.STD_LOGIC_1164.ALL; 
entity control_gen is
    Port (
        clk          : in  STD_LOGIC; 
        rst          : in  STD_LOGIC; 
        sensor_pres  : in  STD_LOGIC; 
