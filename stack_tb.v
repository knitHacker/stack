module test_regfile;

	wire [7:0] data_out;
	reg [7:0] data_in;
	reg push;
	reg pop;
	reg clk;

	stack s1(clk, push, data_in, pop, data_out);

	always
		#1 clk = !clk;

	initial begin
		push = 0;
		pop = 0;
		clk = 0;
		
		# 1 push = 1;
			data_in = 8'd7;
		# 1 push = 0;
		# 1 push = 1;
			data_in = 8'd5;
		# 1 push = 0;
		# 3 pop = 1;
		# 1 pop = 0;
		# 10 $finish;
	end

	initial
		$monitor("%t: Read %d (pop = %d); Write %d (push %d)", 
			$time, data_out , pop,data_in, push);

endmodule	
