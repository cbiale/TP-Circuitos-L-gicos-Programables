library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ffd_tb is
end ffd_tb;

architecture ffd_tb_arq of ffd_tb is

    -- Declaración del componente del contador bcd
    component ffd
        Port (
            clk : in  std_logic;
            rst : in  std_logic;
            S : out  std_logic
        );
    end component;

    -- Señales
    signal clk : std_logic := '0';
    signal rst : std_logic := '0';
    signal S : std_logic := '0';

    -- Definición del periodo del reloj
    constant tiempo : time := 10 ns;

begin

    -- Instanciar FFD
    instancia : ffd
    Port map ( 
        clk => clk,
        rst => rst,
        S => S
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

    -- Proceso de estímulos
    process
    begin
        -- aplicar reset
        rst <= '1';
        wait for tiempo;
        rst <= '0';
        
        -- Dejar el contador funcionando por 300 ns
        wait for 300 ns;
                
        -- Finalizar la simulación
        wait;
    end process;

end ffd_tb_arq;