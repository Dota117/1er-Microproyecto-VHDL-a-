library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.pkg_temporizador.all; 

entity control_gen is
    Port (
        clk          : in  STD_LOGIC; 
        rst          : in  STD_LOGIC; 
        sensor_pres  : in  STD_LOGIC; 
        tiempo_base  : in  integer range 0 to 255; 
        
        ena_timer_b  : out STD_LOGIC; 
        ena_timer_ex : out STD_LOGIC; 
        rst_timers   : out STD_LOGIC; 
        led_alarma   : out STD_LOGIC; 
        led_felicit  : out STD_LOGIC
    );
end control_gen;

architecture arch_3 of control_gen is
    signal estado_actual, estado_siguiente : estado_sistema_t;
begin

    process(clk, rst)
    begin
        if rst = '1' then
            estado_actual <= ESPERA;
        elsif rising_edge(clk) then
            estado_actual <= estado_siguiente;
        end if;
    end process;
    process(estado_actual, sensor_pres, tiempo_base)
    begin
        estado_siguiente <= estado_actual; 
        ena_timer_b      <= '0';
        ena_timer_ex     <= '0';
        rst_timers       <= '0';
        led_alarma       <= '0';
        led_felicit      <= '0';

        case estado_actual is
            when ESPERA =>
                rst_timers <= '1';
                if sensor_pres = '1' then
                    estado_siguiente <= CONTEO;
                end if;
            





