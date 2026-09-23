library IEEE;
use IEEE.STD.LOGIC_1164.ALL;

entity contador_segundos is
    Port (
        clk_1hz : in  STD_LOGIC;
        rst     : in  STD_LOGIC;
        ena     : in  STD_LOGIC;
        tiempo  : out integer range 0 to 255
    );
end contador_segundos;

architecture arch2 of contador_segundos is
    signal conteo_interno : integer range 0 to 255 := 0;
begin
    process(clk_1hz, rst)
    begin
        if rst = '1' then
            conteo_interno <= 0;
        elsif rising_edge(clk_1hz) then
            if ena = '1' then
                if conteo_interno < 255 then
                    conteo_interno <= conteo_interno + 1;
                end if;
            end if;
        end if;
    end process;
            
    tiempo <= conteo_interno;
end end arch2;
