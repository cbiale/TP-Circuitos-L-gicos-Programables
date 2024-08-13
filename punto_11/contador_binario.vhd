library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity contador_binario is
    Port (
        clk : in std_logic;
        rst : in std_logic;
        ena : in std_logic;
        Q : out std_logic_vector(3 downto 0)
    );
end contador_binario;

architecture contador_binario_arq of contador_binario is
    signal contador : unsigned(3 downto 0) := (others => '0');
begin

    process(clk, rst)
    begin
        if rst = '1' then
            contador <= (others => '0');
        elsif rising_edge(clk) then
            if ena = '1' then
                contador <= contador + 1;
                if contador = 15 then
                    contador <= (others => '0');
                end if;
            end if;
        end if;
    end process;

    Q <= std_logic_vector(contador);

end contador_binario_arq;