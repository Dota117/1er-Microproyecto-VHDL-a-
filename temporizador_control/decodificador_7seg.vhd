library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decodificador_7seg is
    Port (
        bcd_in : in  STD_LOGIC_VECTOR(3 downto 0);
        seg_out: out STD_LOGIC_VECTOR(6 downto 0)
    );
end decodificador_7seg;
