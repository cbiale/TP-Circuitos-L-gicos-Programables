library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity contador_bcd is
    Port ( clk : in  std_logic;
           rst : in  std_logic;
           bcd : out  std_logic_vector (3 downto 0));
end contador_bcd;

architecture contador_bcd_arq of contador_bcd is
    signal contador : unsigned (3 downto 0) := "0000";
begin
    process(clk, rst)
    begin
        if rst = '1' then
            contador <= (others => '0');
        elsif rising_edge(clk) then
            if contador = 9 then
                contador <= (others => '0');
            else
                contador <= contador + 1;
            end if;
        end if;
    end process;
    bcd <= std_logic_vector(contador);
end contador_bcd_arq;
