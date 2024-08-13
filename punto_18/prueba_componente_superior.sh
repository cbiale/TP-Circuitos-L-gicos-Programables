ghdl -a -fsynopsys contador_bcd.vhd
ghdl -a -fsynopsys ffd.vhd
ghdl -a -fsynopsys componente_superior.vhd
ghdl -a componente_superior_tb.vhd
ghdl -e -fsynopsys componente_superior_tb
ghdl -r -fsynopsys componente_superior_tb --wave=componente_superior_tb.ghw
gtkwave componente_superior_tb.ghw