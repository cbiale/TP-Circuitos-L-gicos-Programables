ghdl -a sumador_completo.vhd
ghdl -a sumador_completo_4_bits.vhd
ghdl -a sumador_completo_4_bits_tb.vhd
ghdl -e sumador_completo_4_bits_tb
ghdl -r sumador_completo_4_bits_tb --wave=sumador_completo_4_bits_tb.ghw
gtkwave sumador_completo_4_bits_tb.ghw