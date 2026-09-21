library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity bin_a_bcd is
    Port (
        valor_bin : in  integer range 0 to 255;
        unidades  : out STD_LOGIC_VECTOR(3 downto 0);
        decenas   : out STD_LOGIC_VECTOR(3 downto 0);
        centenas  : out STD_LOGIC_VECTOR(3 downto 0)
    );
end bin_a_bcd;

architecture Behavioral of bin_a_bcd is
begin
    process(valor_bin)
        variable temp_val  : integer range 0 to 255;
        variable temp_uni  : integer range 0 to 9;
        variable temp_dec  : integer range 0 to 9;
        variable temp_cen  : integer range 0 to 9;
    begin
        temp_val := valor_bin;
        
        temp_cen := temp_val / 100;
        temp_val := temp_val - (temp_cen * 100);
        
        temp_dec := temp_val / 10;
        temp_uni := temp_val mod 10;
        
        centenas <= std_logic_vector(to_unsigned(temp_cen, 4));
        decenas  <= std_logic_vector(to_unsigned(temp_dec, 4));
        unidades <= std_logic_vector(to_unsigned(temp_uni, 4));
    end process;
end Behavioral;
