library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.pkg_temporizador1.all;

entity top_sistema1 is
    Port (
        clk_50mhz : in  STD_LOGIC;
        rst       : in  STD_LOGIC;
        start     : in  STD_LOGIC;
        stop      : in  STD_LOGIC;
        seg_min   : out STD_LOGIC_VECTOR(6 downto 0);
        seg_dseg  : out STD_LOGIC_VECTOR(6 downto 0);
        seg_useg  : out STD_LOGIC_VECTOR(6 downto 0)
    );
end top_sistema1;

architecture Structural of top_sistema1 is

    -- Señales de interconexión
    signal clk_1hz_sig  : STD_LOGIC;
    signal bcd_min_sig  : STD_LOGIC_VECTOR(3 downto 0);
    signal bcd_dseg_sig : STD_LOGIC_VECTOR(3 downto 0);
    signal bcd_useg_sig : STD_LOGIC_VECTOR(3 downto 0);

begin

    -- Instancia del divisor de frecuencia
    U_DIV_RELOJ : divisor_reloj
        port map (
            clk_in  => clk_50mhz,
            rst     => rst,
            clk_1hz => clk_1hz_sig
        );

    -- Instancia del temporizador principal
    U_CONTADOR : contador_segundos1
        port map (
            clk_1hz  => clk_1hz_sig,
            rst      => rst,
            start    => start,
            stop     => stop,
            bcd_min  => bcd_min_sig,
            bcd_dseg => bcd_dseg_sig,
            bcd_useg => bcd_useg_sig
        );

    -- Instancias de los decodificadores de 7 segmentos
    U_DEC_MIN : decodificador_7seg
        port map (
            bcd_in  => bcd_min_sig,
            seg_out => seg_min
        );

    U_DEC_DSEG : decodificador_7seg
        port map (
            bcd_in  => bcd_dseg_sig,
            seg_out => seg_dseg
        );

    U_DEC_USEG : decodificador_7seg
        port map (
            bcd_in  => bcd_useg_sig,
            seg_out => seg_useg
        );

end Structural;
