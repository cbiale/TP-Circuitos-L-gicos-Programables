library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity registro_desplazamiento is
    Port ( clk : in std_logic;
           E : in std_logic;
           S : out std_logic);
end registro_desplazamiento;

architecture registro_desplazamiento_arq of registro_desplazamiento is

    -- Signals para conectar los flip-flops
    signal Q0, Q1, Q2, Q3 : std_logic := '0';

    -- componente del flip-flop
    component flip_flop
        Port ( clk : in std_logic;
               rst : in std_logic;
               ena : in std_logic;
               D : in std_logic;
               Q : out std_logic);
    end component;

begin

    -- Se instancian los 4 flip flops
    ff0: flip_flop Port map (
        clk => clk,
        rst => '0', -- hardcodeamos el reset a 0 (en la figura no se muestran)
        ena => '1', -- hadrcodeamos en enable a 1 (en la figura no se muestran)
        D => E,
        Q => Q0
    );

    ff1: flip_flop Port map (
        clk => clk,
        rst => '0',
        ena => '1',
        D => Q0,
        Q => Q1
    );

    ff2: flip_flop Port map (
        clk => clk,
        rst => '0',
        ena => '1',
        D => Q1,
        Q => Q2
    );

    ff3: flip_flop Port map (
        clk => clk,
        rst => '0',
        ena => '1',
        D => Q2,
        Q => Q3
    );

    S <= Q3;

end registro_desplazamiento_arq;