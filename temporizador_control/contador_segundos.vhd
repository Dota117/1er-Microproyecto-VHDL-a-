library IEEE;
use IEEE.STD.LOGIC_1164.ALL;

entity contador_segundos is
    Port (
        clk     : in  STD_LOGIC;
        rst     : in  STD_LOGIC;
        ena     : in  STD_LOGIC;
        tiempo  : out integer range 0 to 255
    );
end contador_segundos;

architecture arch2 of contador_segundos is
    signal conteo_interno : integer range 0 to 255 := 0;
begin
    process(clk , rst)
    begin
        if rst = '1' then
            conteo_interno <= 0;
