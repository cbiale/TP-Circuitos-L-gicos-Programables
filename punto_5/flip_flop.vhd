library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity flip_flop is
    Port ( clk : in std_logic;
           rst : in std_logic;
           ena : in std_logic;
           D : in std_logic;
           Q : out std_logic);
end flip_flop;

architecture flip_flop_arq of flip_flop is
begin
    process(clk, rst)
    begin
        if rst = '1' then
            Q <= '0';
        elsif rising_edge(clk) then
            if ena = '1' then
                Q <= D;
            else
                Q <= '0';
            end if;
        end if;
    end process;
end flip_flop_arq;
