
stack: regfile.v stack.v stack_tb.v
	iverilog -o test regfile.v stack.v stack_tb.v
	vvp test

regfile: regfile.v rf_tb.v
	iverilog regfile.v -o rf
	iverilog rf_tb.v regfile.v -o rf_tb
	vvp rf_tb

clean: rm rf_tb rf
