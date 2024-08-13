ghdl -a -fsynopsys ffd.vhd
ghdl -a ffd_tb.vhd
ghdl -e -fsynopsys ffd_tb
ghdl -r -fsynopsys ffd_tb --wave=ffd_tb.ghw
gtkwave ffd_tb.ghw