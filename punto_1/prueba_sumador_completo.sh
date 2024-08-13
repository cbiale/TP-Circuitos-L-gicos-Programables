ghdl -a sumador_completo.vhd
ghdl -a sumador_completo_tb.vhd
ghdl -e sumador_completo_tb
ghdl -r sumador_completo_tb --wave=sumador_completo_tb.ghw
gtkwave sumador_completo_tb.ghw