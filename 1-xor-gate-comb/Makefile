TARGET = testbench

%GHDL_SIM_FLAGS= --stop-time=100ns
%GHDL_SIM_FLAGS=

VHDL_SRC      = xor_gate_comb.vhd
TESTBENCH_SRC = $(TARGET).vhd
WAVEFORMS     = $(TARGET).vcd
GTKWAVE_CFG   = $(TARGET).gtkw

all: trace

.PHONY: analysis clean waves

default: notrace

analysis: $(VHDL_SRC) $(TESTBENCH_SRC)
	ghdl -a  --std=08 -fsynopsys -Wno-hide -Wno-shared -frelaxed $^

$(TARGET): analysis
	ghdl -e --std=08 -frelaxed $@

notrace: $(TARGET)
	ghdl -r --std=08 -frelaxed $^ $(GHDL_SIM_FLAGS) --ieee-asserts=disable --max-stack-alloc=0 --stop-time=100ns

trace: $(TARGET)
	ghdl -r --std=08 -frelaxed $^ $(GHDL_SIM_FLAGS) --ieee-asserts=disable --max-stack-alloc=0 --stop-time=100ns --vcd=$(WAVEFORMS)

keynote:
	highlight -O rtf $(VHDL_SRC) --style=github | pbcopy

gtkwave: trace
	gtkwave $(WAVEFORMS)

scansion: trace
	/Applications/Scansion.app/Contents/MacOS/Scansion $(WAVEFORMS)

#
#
#######################################################################################################################
#
#

yosys-rtl:
	yosys -m ghdl -p 'ghdl xor_gate_comb.vhd -e xor_gate_comb; proc; opt; techmap; opt; write_verilog synth.v; show -format pdf -viewer open'

yosys-asic:
	yosys -m ghdl -p 'ghdl xor_gate_comb.vhd -e xor_gate_comb; proc; opt; techmap; dfflibmap -liberty ../lib/NangateOpenCellLibrary_typical.lib; abc -liberty ../lib/NangateOpenCellLibrary_typical.lib; opt; clean; write_verilog synth.v; show -format pdf -viewer open'

ice40:yosys-rtl
	nextpnr-ice40 --package hx1k --pcf leds.pcf --asc leds.asc --json leds.json --gui

dc-rtl:
    $(shell cd ../design_compiler; design_vision -f dc-1-xor-gate-rtl.tcl)

dc-synthesis:
    $(shell cd ../design_compiler; design_vision -f dc-1-xor-gate-synthesis.tcl)

#
#
#######################################################################################################################
#
#

clean:
	@echo "Cleaning 1-xor-gate-comb project"
	@rm -rf $(WAVEFORMS) work-obj08.cf