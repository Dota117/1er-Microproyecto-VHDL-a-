library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package pkg_temporizador1 is

    component divisor_reloj is
        Port (
             clk_in  : in  STD_LOGIC;
             rst     : in  STD_LOGIC;
             clk_1hz : out STD_LOGIC
        );
    end component;

    component contador_segundos1 is
        Port (
            clk_1hz : in  STD_LOGIC;
            rst     : in  STD_LOGIC;
            start   : in  STD_LOGIC;
            stop    : in  STD_LOGIC;
            bcd_min : out STD_LOGIC_VECTOR(3 downto 0);
            bcd_dseg: out STD_LOGIC_VECTOR(3 downto 0);
            bcd_useg: out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;

    component decodificador_7seg is
        Port (
            bcd_in : in  STD_LOGIC_VECTOR(3 downto 0);
            seg_out: out STD_LOGIC_VECTOR(6 downto 0)
        );
    end component;

end package pkg_temporizador1;

package body pkg_temporizador1 is
end package body pkg_temporizador1;

