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






