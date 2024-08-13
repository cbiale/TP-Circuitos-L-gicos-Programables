library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity registro_desplazamiento_tb is
end registro_desplazamiento_tb;

architecture registro_desplazamiento_tb_arq of registro_desplazamiento_tb is

    -- Declaración del componente del registro de desplazamiento
    component registro_desplazamiento
        Port ( clk : in std_logic;
               E : in std_logic;
               S : out std_logic);
    end component;

    -- Señales para conectar al DUT (Device Under Test)
    signal clk : std_logic := '0';
    signal E : std_logic := '0';
    signal S : std_logic;

    -- Definición del periodo del reloj
    constant periodo_reloj : time := 10 ns;

begin

    -- Instanciar el registro de desplazamiento
    instancia : registro_desplazamiento Port map (
          clk => clk,
          E => E,
          S => S
        );

    -- Proceso para generar el reloj
    process
    begin
        while now < 100 ns loop
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
        -- Esperar 20 ns antes de comenzar
        wait for 20 ns;  
        
        -- Habilitar el registro de desplazamiento y establecer E en '1'
        E <= '1';
        wait for periodo_reloj*2;
        
        -- Desplazar '0'
        E <= '0';
        wait for periodo_reloj*2;
        
        -- Desplazar '1'
        E <= '1';
        wait for periodo_reloj*2;
        
        -- Desplazar '0'
        E <= '0';
        wait for periodo_reloj*2;
        
        -- Finalizar la simulación
        wait;
    end process;

end registro_desplazamiento_tb_arq;