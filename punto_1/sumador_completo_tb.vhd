-- Testbench
library ieee;
use ieee.std_logic_1164.all;

entity sumador_completo_tb is
end entity sumador_completo_tb;

architecture sumador_completo_tb_arq of sumador_completo_tb is
    component sumador_completo is
        port (
            a, b, ci: in std_logic;
            s, co: out std_logic
        );
    end component sumador_completo;

    signal a, b, ci, s, co: std_logic;

begin
    -- instancia a testear
    instancia : sumador_completo
        port map (
            a => a,
            b => b,
            ci => ci,
            s => s,
            co => co
        );

    -- proceso de estimulos
    process
    begin
        a <= '0';
        b <= '0';
        ci <= '0';
        wait for 10 ns;
        
        a <= '0';
        b <= '1';
        ci <= '0';
        wait for 10 ns;
        
        a <= '1';
        b <= '0';
        ci <= '0';
        wait for 10 ns;
        
        a <= '1';
        b <= '1';
        ci <= '0';
        wait for 10 ns;
        
        a <= '0';
        b <= '0';
        ci <= '1';
        wait for 10 ns;
        
        a <= '0';
        b <= '1';
        ci <= '1';
        wait for 10 ns;
        
        a <= '1';
        b <= '0';
        ci <= '1';
        wait for 10 ns;
        
        a <= '1';
        b <= '1';
        ci <= '1';
        wait for 10 ns;
        
        wait;
    end process;

end architecture sumador_completo_tb_arq;
