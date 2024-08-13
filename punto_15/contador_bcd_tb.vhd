library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity contador_bcd_tb is
end contador_bcd_tb;

architecture contador_bcd_tb_arq of contador_bcd_tb is

    -- Declaración del componente del contador bcd
    component contador_bcd
        Port ( clk : in  std_logic;
            rst : in  std_logic;
            bcd : out  std_logic_vector (3 downto 0));
    end component;

    -- Señales
    signal clk : std_logic := '0';
    signal rst : std_logic := '0';
    signal bcd : std_logic_vector (3 downto 0);

    -- Definición del periodo del reloj
    constant tiempo : time := 10 ns;

begin

    -- Instanciar contador bcd
    instancia : contador_bcd
    Port map ( 
        clk => clk,
        rst => rst,
        bcd => bcd
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

end contador_bcd_tb_arq;