library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

package pkg_temporizador is
  
    component contador_segundos is
        Port (
            clk_1hz : in  STD_LOGIC;
            rst     : in  STD_LOGIC;
            ena     : in  STD_LOGIC;
            tiempo  : out integer range 0 to 255
        );
    end component;

    component divisor_reloj is
        Port ( 
            clk_in  : in  STD_LOGIC;
            rst     : in  STD_LOGIC;
            clk_1hz : out STD_LOGIC
        );
    end component;
    component bin_a_bcd is
        Port (
            valor_bin : in  integer range 0 to 255;
            unidades  : out STD_LOGIC_VECTOR(3 downto 0);
            decenas   : out STD_LOGIC_VECTOR(3 downto 0);
            centenas  : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;

    component decodificador_7seg is
        Port (
            bcd_in : in  STD_LOGIC_VECTOR(3 downto 0);
            seg_out: out STD_LOGIC_VECTOR(6 downto 0)
        );
    end component;
