library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity flip_flop_tb is
end flip_flop_tb;

architecture flip_flop_tb_arq of flip_flop_tb is

    -- Componente
    component flip_flop
    Port ( clk : in std_logic;
           rst : in std_logic;
           ena : in std_logic;
           D : in std_logic;
           Q : out std_logic);
    end component;

    -- Signals
    signal clk : std_logic := '0';
    signal rst : std_logic := '0';
    signal ena : std_logic := '0';
    signal D : std_logic := '0';
    signal Q : std_logic;

    -- Reloj
    constant tiempo : time := 10 ns;

begin

    -- unidad a testear
    instancia : flip_flop Port map (
          clk => clk,
          rst => rst,
          ena => ena,
          D => D,
          Q => Q
        );

    -- proceso del reloj
    process
    begin
        while now < 100 ns loop
            clk <= '0';
            wait for tiempo / 2;
            clk <= '1';
            wait for tiempo / 2;
        end loop;
        wait;
    end process;

    -- proceso de estimulos
    process
    begin
        -- rst por 20 ns
        rst <= '1';
        wait for 20 ns;  
        rst <= '0';
        
        wait for tiempo * 2;
        
        -- activar flip-flop y asignar '1'
        ena <= '1';
        D <= '1';
        wait for tiempo * 2;
        
        -- enable en falso
        ena <= '0';
        wait for tiempo * 2;
        
        -- activar flip-flop y asignar '0'
        ena <= '1';
        D <= '0';
        wait for tiempo * 2;
        
        -- Reset del flip-flop
        rst <= '1';
        wait for tiempo * 2;
        rst <= '0';
        
        wait;
    end process;

end flip_flop_tb_arq;