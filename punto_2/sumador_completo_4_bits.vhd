library ieee;
use ieee.std_logic_1164.all;

entity sumador_completo_4_bits is
    port (
        a, b : in std_logic_vector(3 downto 0); 
        ci: in std_logic;
        s : out std_logic_vector(3 downto 0);
        co: out std_logic
    );
end entity sumador_completo_4_bits;

architecture sumador_completo_4_bits_arq of sumador_completo_4_bits is

    component sumador_completo is
        port (
            a, b, ci: in std_logic;
            s, co: out std_logic
        );
    end component sumador_completo;

    signal c0, c1, c2 : std_logic;

begin

    -- instancias
    sumador_0 : sumador_completo
    port map (
        a => a(0),
        b => b(0),
        ci => ci,
        s => s(0),
        co => c0
    );

    sumador_1 : sumador_completo
    port map (
        a => a(1),
        b => b(1),
        ci => c0,
        s => s(1),
        co => c1
    );


    sumador_2 : sumador_completo
    port map (
        a => a(2),
        b => b(2),
        ci => c1,
        s => s(2),
        co => c2
    );


    sumador_3 : sumador_completo
    port map (
        a => a(3),
        b => b(3),
        ci => c2,
        s => s(3),
        co => co
    );

end architecture sumador_completo_4_bits_arq;
