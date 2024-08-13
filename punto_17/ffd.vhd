library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ffd is
    Port (
        clk : in  std_logic;
        rst : in  std_logic;
        S : out  std_logic
    );
end ffd;

architecture ffd_arq of ffd is
    signal contador : unsigned (1 downto 0) := (others => '0');
begin
    process(clk, rst)
    begin
        if rst = '1' then
            contador <= (others => '0');
            S <= '0';
        elsif rising_edge(clk) then
            if contador = 2 then
                S <= '1';
                contador <= (others => '0');
            else
                contador <= contador + 1;
                S <= '0';
            end if;
        end if;
    end process;
end ffd_arq;
