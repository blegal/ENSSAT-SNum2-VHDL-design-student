TARGET = testbench

%GHDL_SIM_FLAGS= --stop-time=100ns
%GHDL_SIM_FLAGS=

VHDL_SRC      = top_module.vhd chip_enable.vhd chenillard.vhd
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
	ghdl -r --std=08 -frelaxed $^ $(GHDL_SIM_FLAGS) --ieee-asserts=disable --max-stack-alloc=0 --stop-time=4000ns

trace: $(TARGET)
	ghdl -r --std=08 -frelaxed $^ $(GHDL_SIM_FLAGS) --ieee-asserts=disable --max-stack-alloc=0 --stop-time=4000ns --vcd=$(WAVEFORMS)

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
./verilog/chenillard.v: chenillard.vhd
#	generation du fichier verilog
	ghdl -a chenillard.vhd
	yosys -m ghdl -p 'ghdl chenillard;  write_verilog ./verilog/chenillard.v'
	rm work-obj93.cf

./verilog/chip_enable.v: chip_enable.vhd
#	generation du fichier verilog
	ghdl -a chip_enable.vhd
	yosys -m ghdl -p 'ghdl chip_enable; write_verilog ./verilog/chip_enable.v'
	rm work-obj93.cf

./verilog/top_module.v: top_module.vhd
#	generation du fichier verilog
	ghdl -a top_module.vhd
	yosys -m ghdl -p 'ghdl top_module;  write_verilog ./verilog/top_module.v'
	rm work-obj93.cf

./bitstream/top.json: ./verilog/chenillard.v ./verilog/chip_enable.v ./verilog/top_module.v
#	synthese logique du design
	yosys -p "read_verilog ./verilog/chenillard.v ./verilog/chip_enable.v ./verilog/top_module.v; synth_gowin -json ./bitstream/top.json"

./bitstream/pnr.json: ./bitstream/top.json
#	placement et routage du design
	nextpnr-himbaechel 	--json  ./bitstream/top.json \
                   		--write ./bitstream/pnr.json \
                   		--device GW2AR-LV18QN88C8/I7 \
                   		--vopt   family=GW2A-18C     \
                   		--vopt   cst=./xdc/tangnano20k.cst

./bitstream/top.bit: ./bitstream/pnr.json
#	generation du bitstream
	gowin_pack -d GW2A-18C -o ./bitstream/pack.fs ./bitstream/pnr.json

fpga: ./bitstream/top.bit

fpga-load: ./bitstream/top.bit
#	chargement du circuit
	openFPGALoader -b tangnano20k ./bitstream/pack.fs

#
#
#######################################################################################################################
#
#

clean:
	@echo "Cleaning the project"
	@find ./verilog -name "*.v" -delete
	@find ./bitstream -name "*.json" -delete
	@find ./bitstream -name "*.fs"   -delete
	rm -rf $(WAVEFORMS) work-obj08.cf

