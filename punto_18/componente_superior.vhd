library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity componente_superior is
    port (
        clk : in std_logic;
        rst : in std_logic;
        led_1 : out std_logic;
        led_2 : out std_logic;
        led_3 : out std_logic;
        led_4 : out std_logic
        );
end entity;

architecture componente_superior_arq of componente_superior is

    component contador_bcd is
        Port ( clk : in  std_logic;
               rst : in  std_logic;
               bcd : out  std_logic_vector (3 downto 0)
               );
    end component;

    component ffd is
        Port (
            clk : in  std_logic;
            rst : in  std_logic;
            S : out  std_logic
        );
    end component;

    signal salida : std_logic_vector(3 downto 0);
    signal activacion : std_logic := '0';
begin
    
        i_ffd: ffd Port map (
            clk => clk,
            rst => rst,
            S => activacion
        );

        i_contador : contador_bcd Port map (
            clk => activacion,
            rst => rst,
            bcd => salida
        );

        led_1 <= salida(0);
        led_2 <= salida(1);
        led_3 <= salida(2);
        led_4 <= salida(3);
    
    end architecture componente_superior_arq;
