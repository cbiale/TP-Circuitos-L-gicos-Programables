ghdl -a flip_flop.vhd
ghdl -a registro_desplazamiento.vhd
ghdl -a registro_desplazamiento_tb.vhd
ghdl -e registro_desplazamiento_tb
ghdl -r registro_desplazamiento_tb --wave=registro_desplazamiento_tb.ghw
gtkwave registro_desplazamiento_tb.ghw