ghdl -a flip_flop.vhd
ghdl -a contador_binario.vhd
ghdl -a contador_binario_tb.vhd
ghdl -e contador_binario_tb
ghdl -r contador_binario_tb --wave=contador_binario_tb.ghw
gtkwave contador_binario_tb.ghw