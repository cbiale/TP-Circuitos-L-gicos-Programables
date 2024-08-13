ghdl -a -fsynopsys flip_flop.vhd
ghdl -a flip_flop_tb.vhd
ghdl -e -fsynopsys flip_flop_tb
ghdl -r -fsynopsys flip_flop_tb --wave=flip_flop_tb.ghw
gtkwave flip_flop_tb.ghw