library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decodificador_7seg is
    Port (
        bcd_in : in  STD_LOGIC_VECTOR(3 downto 0);
        seg_out: out STD_LOGIC_VECTOR(6 downto 0)
    );
end decodificador_7seg;

architecture Dataflow of decodificador_7seg is
begin
    with bcd_in select
        seg_out <=  "0111111" when "0000", 
                    "0000110" when "0001", 
                    "1011011" when "0010", 
                    "1001111" when "0011", 
                    "1100110" when "0100", 
                    "1101101" when "0101", 
                    "1111101" when "0110", 
                    "0000111" when "0111", 
                    "1111111" when "1000", 
                    "1101111" when "1001", 
                    "0000000" when others; 
end Dataflow;
    
