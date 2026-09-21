library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 

entity divisor_reloj is
    Port ( 
        clk_in  : in  STD_LOGIC;
        rst     : in  STD_LOGIC;
        clk_1hz : out STD_LOGIC
    );
end divisor_reloj;

architecture arch1 of divisor_reloj is
    constant mitad_ciclos : integer := 50000000 / 2;
    signal conteo : integer range 0 to Mitad_ciclos := 0;
    signal estado_clk : STD_LOGIC := '0';
begin
    process (clk_in,  rst)
    if rst '1' then
        conteo <= 0
        estado_clk <=  0;
    elsif rising.edge(clk_in) then
        if conteo = (mitad_ciclos -1) then
            conteo <=0;
            

                
