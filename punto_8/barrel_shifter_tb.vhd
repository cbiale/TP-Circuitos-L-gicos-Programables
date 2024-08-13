library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity barrel_shifter_tb is
end barrel_shifter_tb;

architecture barrel_shifter_tb_arq of barrel_shifter_tb is

    -- Declaración del componente del barrel shifter
    component barrel_shifter
        Port (
            clk : in std_logic;
            reset : in std_logic;
            des : in std_logic_vector(2 downto 0);
            a : in std_logic_vector(7 downto 0);
            s : out std_logic_vector(7 downto 0)
        );
    end component;

    -- Señales
    signal clk : std_logic := '0';
    signal reset : std_logic := '0';
    signal des : std_logic_vector(2 downto 0) := (others => '0');
    signal a : std_logic_vector(7 downto 0) := (others => '0');
    signal s : std_logic_vector(7 downto 0);

    -- Definición del periodo del reloj
    constant periodo_reloj : time := 10 ns;

begin

    -- Instancia del barrel shifter
    instancia : barrel_shifter Port map (
          clk => clk,
          reset => reset,
          des => des,
          a => a,
          s => s
        );

    -- reloj
    process
    begin
        while now < 200 ns loop
            clk <= '0';
            wait for periodo_reloj/2;
            clk <= '1';
            wait for periodo_reloj/2;
        end loop;
        wait;
    end process;

    -- estímulos
    process
    begin
        -- Aplicar reset
        reset <= '1';
        wait for 20 ns;
        
        reset <= '0';
        -- Prueba 1: Desplazamiento 0
        a <= "10101010";
        des <= "000";
        wait for 20 ns;
        
        -- Prueba 2: Desplazamiento 1
        des <= "001";
        wait for 20 ns;
        
        -- Prueba 3: Desplazamiento 2
        des <= "010";
        wait for 20 ns;
        
        -- Prueba 4: Desplazamiento 3
        des <= "011";
        wait for 20 ns;
        
        -- Prueba 5: Desplazamiento 4
        des <= "100";
        wait for 20 ns;
        
        -- Prueba 6: Desplazamiento 5
        des <= "101";
        wait for 20 ns;
        
        -- Prueba 7: Desplazamiento 6
        des <= "110";
        wait for 20 ns;
        
        -- Prueba 8: Desplazamiento 7
        des <= "111";
        wait for 20 ns;
        
        -- Finalizar
        wait;
end process;
end barrel_shifter_tb_arq;