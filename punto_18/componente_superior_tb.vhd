library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity componente_superior_tb is
end componente_superior_tb;

architecture componente_superior_tb_arq of componente_superior_tb is

    -- Declaración del componente del componente_superior
    component componente_superior
        Port (
            clk : in std_logic;
            rst : in std_logic;
            led_1 : out std_logic;
            led_2 : out std_logic;
            led_3 : out std_logic;
            led_4 : out std_logic
        );
    end component;

    -- Señales
    signal clk : std_logic := '0';
    signal rst : std_logic := '0';
    signal led_1 : std_logic;
    signal led_2 : std_logic;
    signal led_3 : std_logic;
    signal led_4 : std_logic;

    -- Definición del periodo del reloj
    constant periodo_reloj : time := 10 ns;

begin

    -- Instancia del componente_superior
    instancia : componente_superior Port map (
          clk => clk,
          rst => rst,
          led_1 => led_1,
          led_2 => led_2,
          led_3 => led_3,
          led_4 => led_4
        );

    -- Proceso para generar el reloj
    process
    begin
        while now < 1200 ns loop
            clk <= '0';
            wait for periodo_reloj/2;
            clk <= '1';
            wait for periodo_reloj/2;
        end loop;
        wait;
    end process;

    -- Proceso de estímulos
    process
    begin
        -- Aplicar reset
        rst <= '1';
        wait for 20 ns;
        rst <= '0';
        
        -- Esperar para observar el comportamiento
        wait for 1180 ns;
        
        -- Finalizar la simulación
        wait;
    end process;

end componente_superior_tb_arq;