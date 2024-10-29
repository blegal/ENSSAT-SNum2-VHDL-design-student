TARGET = testbench

%GHDL_SIM_FLAGS= --stop-time=100ns
%GHDL_SIM_FLAGS=

VHDL_SRC      = morse_encoder.vhd
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
	ghdl -r --std=08 -frelaxed $^ $(GHDL_SIM_FLAGS) --ieee-asserts=disable --max-stack-alloc=0 --stop-time=1000ns

trace: $(TARGET)
	ghdl -r --std=08 -frelaxed $^ $(GHDL_SIM_FLAGS) --ieee-asserts=disable --max-stack-alloc=0 --stop-time=1000ns --vcd=$(WAVEFORMS)

keynote:
	highlight -O rtf $(VHDL_SRC) --style=github | pbcopy

gtkwave: trace
	gtkwave $(WAVEFORMS)

scansion: trace
	/Applications/Scansion.app/Contents/MacOS/Scansion $(WAVEFORMS)

clean:
	rm -rf $(WAVEFORMS) work-obj08.cf

