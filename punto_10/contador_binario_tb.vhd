library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity contador_binario_tb is
end contador_binario_tb;

architecture contador_binario_arq of contador_binario_tb is

    -- Declaraci�n del componente del contador binario
    component contador_binario
        Port (
            ena : in std_logic;
            rst : in std_logic;
            clk : in std_logic;
            Q : out std_logic_vector(3 downto 0)
        );
    end component;

    -- Se�ales para conectar al DUT (Device Under Test)
    signal clk : std_logic := '0';
    signal rst : std_logic := '0';
    signal ena : std_logic := '0';
    signal Q : std_logic_vector(3 downto 0);

    -- Definici�n del periodo del reloj
    constant tiempo : time := 10 ns;

begin

    -- Instanciar el contador binario
    instancia : contador_binario Port map (
          clk => clk,
          rst => rst,
          ena => ena,
          Q => Q
        );

    -- Proceso para generar el reloj
    process
    begin
        while now < 350 ns loop
            clk <= '0';
            wait for tiempo / 2;
            clk <= '1';
            wait for tiempo / 2;
        end loop;
        wait;
    end process;

    -- Proceso de est�mulos
    process
    begin
        -- Esperar tiempo
        wait for tiempo;  
        
        -- Habilitar el contador y aplicar reset
        ena <= '1';
        rst <= '1';
        wait for tiempo;
        rst <= '0';
        
        -- Dejar el contador funcionando por 300 ns
        wait for 300 ns;
        
        -- Deshabilitar el contador
        ena <= '0';
        
        -- Finalizar la simulaci�n
        wait;
    end process;

end contador_binario_arq;