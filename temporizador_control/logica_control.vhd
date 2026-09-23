library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity logica_control is
    Port (
        clk          : in  STD_LOGIC; 
        rst          : in  STD_LOGIC; -- Btn
        sensor_pres  : in  STD_LOGIC; 
        tiempo_base  : in  integer range 0 to 255; 
        
        ena_timer_b  : out STD_LOGIC; 
        ena_timer_ex : out STD_LOGIC; 
        rst_timers   : out STD_LOGIC; 
        led_alarma   : out STD_LOGIC; 
        led_felicit  : out STD_LOGIC
    );
end logica_control;
  


architecture arch_ctrl of logica_control is
    signal limite_alcanzado : STD_LOGIC := '0';
    signal memoria_felicita : STD_LOGIC := '0';
begin

    limite_alcanzado <= '1' when (tiempo_base >= 35) else '0';

    ena_timer_b  <= sensor_pres and (not limite_alcanzado);
    
    ena_timer_ex <= sensor_pres and limite_alcanzado;
    
    rst_timers   <= rst;
    
    led_alarma   <= limite_alcanzado and sensor_pres;

