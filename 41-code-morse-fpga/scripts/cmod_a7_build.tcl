# You can then run your build script in the same shell:
# 
# > vivado -mode batch -source build.tcl
# 
# If you’d rather Vivado not generate a journal and log files:
# 
# > vivado -mode batch -nolog -nojournal -source build.tcl
# 
# 
# build settings
# 
set design_name "top_module"
set arch "xc7"
set board_name "arty"
set fpga_part "xc7a35tcpg236-1"

# set reference directories for source files
set lib_dir [file normalize "./../../../../lib"]
set origin_dir [file normalize "./../../"]

# read design sources
read_vhdl -vhdl2008 ../src/chip_enable.vhd
read_vhdl -vhdl2008 ../src/dec_2_uart.vhd
read_vhdl -vhdl2008 ../src/morse_decoder.vhd
read_vhdl -vhdl2008 ../src/morse_encoder.vhd
read_vhdl -vhdl2008 ../src/top_module.vhd
read_vhdl -vhdl2008 ../src/uart_2_enc.vhd
read_vhdl -vhdl2008 ../src/uart_recv.vhd
read_vhdl -vhdl2008 ../src/uart_send.vhd

set_part ${fpga_part} 

# read constraints
read_xdc "../xdc/Cmod-A7-Master.xdc"

# synth
synth_design -top "${design_name}" -part ${fpga_part}

# place and route
opt_design
place_design
route_design

# write bitstream
write_bitstream -force "${design_name}.bit"
