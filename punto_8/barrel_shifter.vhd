library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity barrel_shifter is
    port(
        clk: in std_logic;
        reset: in std_logic;
        des: in std_logic_vector(2 downto 0);
        a: in std_logic_vector(7 downto 0);
        s: out std_logic_vector(7 downto 0)
    );
end entity barrel_shifter;

-- realizamos desplazamiento a la derecha
-- la cantidad de desplazamientos viene dada por des
-- la entrada de datos es a y la salida es s
architecture barrel_shifter_arq of barrel_shifter is
    signal temp: std_logic_vector(7 downto 0);
begin

    process(clk, reset)
    begin
        if reset = '1' then
            temp <= (others => '0');
        elsif rising_edge(clk) then
            case des is
                when "000" =>
                    temp <= a;
                when "001" =>
                    temp(7 downto 1) <= a(6 downto 0);
                    temp(0) <= a(7);
                when "010" =>
                    temp(7 downto 2) <= a(5 downto 0);
                    temp(1 downto 0) <= a(7 downto 6);
                when "011" =>
                    temp(7 downto 3) <= a(4 downto 0);
                    temp(2 downto 0) <= a(7 downto 5);
                when "100" =>
                    temp(7 downto 4) <= a(3 downto 0);
                    temp(3 downto 0) <= a(7 downto 4);
                when "101" =>
                    temp(7 downto 5) <= a(2 downto 0);
                    temp(4 downto 0) <= a(7 downto 3);
                when "110" =>
                    temp(7 downto 6) <= a(1 downto 0);
                    temp(5 downto 0) <= a(7 downto 2);
                when "111" =>
                    temp <= a;
                when others =>
                    temp <= a;
            end case;
        end if;
    end process;

    s <= temp;

end architecture barrel_shifter_arq;