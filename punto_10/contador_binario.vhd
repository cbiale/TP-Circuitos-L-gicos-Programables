library ieee;
use ieee.std_logic_1164.all;

entity contador_binario is
    Port (
        ena : in std_logic;
        rst : in std_logic;
        clk : in std_logic;
        Q : out std_logic_vector(3 downto 0)
    );
end contador_binario;

architecture contador_binario_arq of contador_binario is

    -- componentes
    component flip_flop
        Port (
            clk : in std_logic;
            rst : in std_logic;
            D : in std_logic;
            Q : out std_logic
        );
    end component;

    -- señales
    signal Q0, Q1, Q2, Q3 : std_logic;
    signal and0, and1, and2 : std_logic;
    signal xor0, xor1, xor2, xor3 : std_logic;

begin   

    xor0 <= ena xor Q0;
    and0 <= ena and Q0;
    xor1 <= Q1 xor and0;
    and1 <= and0 and Q1;
    xor2 <= Q2 xor and1;
    and2 <= and1 and Q2;
    xor3 <= Q3 xor and2;

    -- instancias de flip flops    
        FF0: flip_flop Port map (
            clk => clk,
            rst => rst,
            D => xor0,
            Q => Q0
        );
        
        FF1: flip_flop Port map (
            clk => clk,
            rst => rst,
            D => xor1,
            Q => Q1
        );
        
        FF2: flip_flop Port map (
            clk => clk,
            rst => rst,
            D => xor2,
            Q => Q2
        );

        FF3: flip_flop Port map (
            clk => clk,
            rst => rst,
            D => xor3,
            Q => Q3
        );
        
        Q <= Q3 & Q2 & Q1 & Q0;
    
    end contador_binario_arq;