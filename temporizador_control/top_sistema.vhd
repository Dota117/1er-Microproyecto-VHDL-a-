library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.pkg_temporizador.all;

entity top_sistema is
    Port (
        clk_50mhz   : in  STD_LOGIC; 
        rst_btn     : in  STD_LOGIC; 
        sensor_in   : in  STD_LOGIC; 

        led_multa   : out STD_LOGIC; 
        led_ok      : out STD_LOGIC; 

        seg_base_u  : out STD_LOGIC_VECTOR(6 downto 0); 
        seg_base_d  : out STD_LOGIC_VECTOR(6 downto 0); 
        
        seg_exceso_u: out STD_LOGIC_VECTOR(6 downto 0); 
        seg_exceso_d: out STD_LOGIC_VECTOR(6 downto 0)  
    );
end top_sistema;
