library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity contador_segundos1 is
    Port (
        clk_1hz : in  STD_LOGIC;
        rst     : in  STD_LOGIC;
        start   : in  STD_LOGIC;
        stop    : in  STD_LOGIC;
        bcd_min : out STD_LOGIC_VECTOR(3 downto 0);
        bcd_dseg: out STD_LOGIC_VECTOR(3 downto 0);
        bcd_useg: out STD_LOGIC_VECTOR(3 downto 0)
    );
end contador_segundos1;

architecture arch1 of contador_segundos1 is
    signal ena_run : STD_LOGIC := '0';
    signal count_min  : unsigned(3 downto 0) := (others => '0');
    signal count_dseg : unsigned(3 downto 0) := (others => '0');
    signal count_useg : unsigned(3 downto 0) := (others => '0');
begin

    process(clk_1hz, rst)
    begin
        if rst = '1' then
            ena_run <= '0';
        elsif rising_edge(clk_1hz) then
            if start = '1' then
                ena_run <= '1';
            elsif stop = '1' then
                ena_run <= '0';
            end if;
        end if;
    end process;

    process(clk_1hz, rst)
    begin
        if rst = '1' then
            count_min  <= (others => '0');
            count_dseg <= (others => '0');
            count_useg <= (others => '0');
        elsif rising_edge(clk_1hz) then
            if ena_run = '1' then
                if count_useg = 9 then
                    count_useg <= (others => '0');
                    if count_dseg = 5 then
                        count_dseg <= (others => '0');
                        if count_min = 9 then
                            count_min <= (others => '0');
                        else
                            count_min <= count_min + 1;
                        end if;
                    else
                        count_dseg <= count_dseg + 1;
                    end if;
                else
                    count_useg <= count_useg + 1;
                end if;
            end if;
        end if;
    end process;

    bcd_min  <= std_logic_vector(count_min);
    bcd_dseg <= std_logic_vector(count_dseg);
    bcd_useg <= std_logic_vector(count_useg);

end arch1;
