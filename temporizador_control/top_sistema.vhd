library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.pkg_temporizador.all;

entity top_sistema is
    Port (
        clk_50mhz    : in  STD_LOGIC; 
        rst_btn      : in  STD_LOGIC; 
        sensor_in    : in  STD_LOGIC; 

        led_multa    : out STD_LOGIC; 
        led_ok       : out STD_LOGIC; 

        seg_base_u   : out STD_LOGIC_VECTOR(6 downto 0); 
        seg_base_d   : out STD_LOGIC_VECTOR(6 downto 0); 
        
        seg_exceso_u : out STD_LOGIC_VECTOR(6 downto 0); 
        seg_exceso_d : out STD_LOGIC_VECTOR(6 downto 0)  
    );
end top_sistema;
--segmento de codigo generado con ayuda de gemini 3.1 pro extendido
architecture Structural of top_sistema is

    -- =========================================================
    -- Señales internas para interconexión
    -- =========================================================
    
    -- Señal de reloj lento
    signal clk_1hz_sig      : STD_LOGIC;
    
    -- Señales de control emitidas por logica_control
    signal ena_timer_b_sig  : STD_LOGIC;
    signal ena_timer_ex_sig : STD_LOGIC;
    signal rst_timers_sig   : STD_LOGIC;
    
    -- Señales de tiempo (salidas de los contadores)
    signal tiempo_base_sig  : integer range 0 to 255;
    signal tiempo_ex_sig    : integer range 0 to 255;
    
    -- Señales BCD (salidas de los conversores bin_a_bcd)
    signal bcd_base_u       : STD_LOGIC_VECTOR(3 downto 0);
    signal bcd_base_d       : STD_LOGIC_VECTOR(3 downto 0);
    
    signal bcd_exceso_u     : STD_LOGIC_VECTOR(3 downto 0);
    signal bcd_exceso_d     : STD_LOGIC_VECTOR(3 downto 0);

begin

    -- =========================================================
    -- 1. Gestión de Reloj y Control Principal
    -- =========================================================
    
    -- Instancia del divisor de reloj
    U_DIV_RELOJ : divisor_reloj
        port map (
            clk_in  => clk_50mhz,  -- El reloj rápido solo entra aquí
            rst     => rst_btn,    -- El reset físico reinicia el divisor
            clk_1hz => clk_1hz_sig -- Reloj lento generado para el resto del sistema
        );

    -- Instancia de la lógica de control (El Cerebro)
    U_LOGICA_CTRL : logica_control
        port map (
            clk          => clk_1hz_sig,     -- Alimentado por el reloj lento de 1Hz
            rst          => rst_btn,         -- El reset físico reinicia la lógica
            sensor_pres  => sensor_in,
            tiempo_base  => tiempo_base_sig,
            
            ena_timer_b  => ena_timer_b_sig,
            ena_timer_ex => ena_timer_ex_sig,
            rst_timers   => rst_timers_sig,  -- Reset generado internamente para los contadores
            led_alarma   => led_multa,
            led_felicit  => led_ok
        );

    -- =========================================================
    -- 2. Temporizadores (Contadores de Segundos)
    -- =========================================================
    
    -- Temporizador para el tiempo base (hasta 35 seg)
    U_TIMER_BASE : contador_segundos
        port map (
            clk_1hz => clk_1hz_sig,
            rst     => rst_timers_sig,       -- Reset interno de la lógica
            ena     => ena_timer_b_sig,
            tiempo  => tiempo_base_sig
        );

    -- Temporizador para el tiempo de exceso (multa)
    U_TIMER_EXCESO : contador_segundos
        port map (
            clk_1hz => clk_1hz_sig,
            rst     => rst_timers_sig,       -- Reset interno de la lógica
            ena     => ena_timer_ex_sig,
            tiempo  => tiempo_ex_sig
        );

    -- =========================================================
    -- 3. Conversión de Binario a BCD
    -- =========================================================
    
    -- Conversor BCD para el tiempo base
    U_BCD_BASE : bin_a_bcd
        port map (
            valor_bin => tiempo_base_sig,
            unidades  => bcd_base_u,
            decenas   => bcd_base_d,
            centenas  => open                -- Centenas mapeadas explícitamente a open
        );

    -- Conversor BCD para el tiempo de exceso
    U_BCD_EXCESO : bin_a_bcd
        port map (
            valor_bin => tiempo_ex_sig,
            unidades  => bcd_exceso_u,
            decenas   => bcd_exceso_d,
            centenas  => open                -- Centenas mapeadas explícitamente a open
        );

    -- =========================================================
    -- 4. Decodificadores de 7 Segmentos para Displays
    -- =========================================================
    
    -- Displays del Tiempo Base
    U_7SEG_BASE_U : decodificador_7seg
        port map (
            bcd_in  => bcd_base_u,
            seg_out => seg_base_u
        );

    U_7SEG_BASE_D : decodificador_7seg
        port map (
            bcd_in  => bcd_base_d,
            seg_out => seg_base_d
        );

    -- Displays del Tiempo de Exceso
    U_7SEG_EXCESO_U : decodificador_7seg
        port map (
            bcd_in  => bcd_exceso_u,
            seg_out => seg_exceso_u
        );

    U_7SEG_EXCESO_D : decodificador_7seg
        port map (
            bcd_in  => bcd_exceso_d,
            seg_out => seg_exceso_d
        );

end Structural;
