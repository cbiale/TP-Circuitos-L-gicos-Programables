-- Testbench
library ieee;
use ieee.std_logic_1164.all;

entity sumador_completo_4_bits_tb is
end entity sumador_completo_4_bits_tb;

architecture sumador_completo_4_bits_tb_arq of sumador_completo_4_bits_tb is
    component sumador_completo_4_bits is
        port (
            a, b : in std_logic_vector(3 downto 0); 
            ci: in std_logic;
            s : out std_logic_vector(3 downto 0);
            co: out std_logic
        );
    end component sumador_completo_4_bits;

    signal a, b : std_logic_vector(3 downto 0); 
    signal ci: std_logic;
    signal s : std_logic_vector(3 downto 0);
    signal co: std_logic;

begin
    -- instancia a testear
    instancia : sumador_completo_4_bits
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
        a <= "0000";
        b <= "0010";
        ci <= '0';
        wait for 10 ns;
        
        a <= "1000";
        b <= "0111";
        ci <= '0';
        wait for 10 ns;
        
        a <= "1111";
        b <= "0001";
        ci <= '0';
        wait for 10 ns;
        
        a <= "0001";
        b <= "0000";
        ci <= '0';
        wait for 10 ns;
        
        a <= "1111";
        b <= "0001";
        ci <= '1';
        wait for 10 ns;
        
        a <= "0000";
        b <= "1111";
        ci <= '1';
        wait for 10 ns;        

        wait;
    end process;
end architecture sumador_completo_4_bits_tb_arq;
