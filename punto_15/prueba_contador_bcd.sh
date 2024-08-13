ghdl -a -fsynopsys contador_bcd.vhd
ghdl -a contador_bcd_tb.vhd
ghdl -e -fsynopsys contador_bcd_tb
ghdl -r -fsynopsys contador_bcd_tb --wave=contador_bcd_tb.ghw
gtkwave contador_bcd_tb.ghw