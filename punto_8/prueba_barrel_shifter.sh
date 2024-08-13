ghdl -a -fsynopsys barrel_shifter.vhd
ghdl -a barrel_shifter_tb.vhd
ghdl -e -fsynopsys barrel_shifter_tb
ghdl -r -fsynopsys barrel_shifter_tb --wave=barrel_shifter_tb.ghw
gtkwave barrel_shifter_tb.ghw