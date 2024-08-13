ghdl -a sumador_completo.vhd
ghdl -a sumador_restador_4_bits.vhd
ghdl -a sumador_restador_4_bits_tb.vhd
ghdl -e sumador_restador_4_bits_tb
ghdl -r sumador_restador_4_bits_tb --wave=sumador_restador_4_bits_tb.ghw
gtkwave sumador_restador_4_bits_tb.ghw