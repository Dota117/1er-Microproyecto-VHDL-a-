library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decodificador_7seg is
    Port (
        bcd_in : in  STD_LOGIC_VECTOR(3 downto 0);
        seg_out: out STD_LOGIC_VECTOR(6 downto 0)
    );
end decodificador_7seg;

architecture Behavioral of decodificador_7seg is
begin
    process(bcd_in)
    begin
        case bcd_in is
            when "0000" => seg_out <= "0111111"; 
            when "0001" => seg_out <= "0000110"; 
            when "0010" => seg_out <= "1011011"; 
            when "0011" => seg_out <= "1001111"; 
            when "0100" => seg_out <= "1100110"; 
            when "0101" => seg_out <= "1101101"; 
            when "0110" => seg_out <= "1111101"; 
            when "0111" => seg_out <= "0000111"; 
            when "1000" => seg_out <= "1111111"; 
            when "1001" => seg_out <= "1101111"; 
            when others => seg_out <= "0000000"; 
        end case;
    end process;
end Behavioral;
          
