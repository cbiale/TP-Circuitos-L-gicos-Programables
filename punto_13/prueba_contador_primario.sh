ghdl -a -fsynopsys contador_binario.vhd
ghdl -a contador_binario_tb.vhd
ghdl -e -fsynopsys contador_binario_tb
ghdl -r -fsynopsys contador_binario_tb --wave=contador_binario_tb.ghw
gtkwave contador_binario_tb.ghw