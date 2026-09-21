library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

package pkg_temporizador is
  
    constant CICLOS : integer := 50_000_000;

    component divisor_reloj is
        Port ( 
            clk_in  : in  STD_LOGIC;
            rst     : in  STD_LOGIC;
            clk_1hz : out STD_LOGIC
        );
    end component;
