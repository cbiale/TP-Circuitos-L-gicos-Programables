library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity flip_flop is
    Port ( clk : in std_logic;
           rst : in std_logic;
           D : in std_logic;
           Q : out std_logic := '0');
end flip_flop;

architecture flip_flop_arq of flip_flop is
begin
    process(clk, rst)
    begin
        if rst = '1' then
            Q <= '0';
        elsif rising_edge(clk) then
            Q <= D;
        end if;
    end process;
end flip_flop_arq;
