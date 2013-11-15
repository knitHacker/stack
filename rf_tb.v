module test_regfile;

	wire [7:0] data_out;
	reg [7:0] data_in;
	reg [3:0] read_addr;
	reg [3:0] write_addr;
	reg we;
	reg clk;

	regfile rf(clk, read_addr, data_out, write_addr, data_in, we);

	always
		#1 clk = !clk;

	initial begin
		we = 0;
		clk = 0;
		
		# 1 we = 1;
			data_in = 8'd7;
			write_addr = 4'd0;
		# 1 we = 0;
		# 1 read_addr = 4'd0;
		# 2 we = 1;
			data_in = 8'd5;
			write_addr = 4'd2;
		# 1 we = 0;
		# 1 read_addr = 4'd2;
		# 2 read_addr = 4'd0;
		# 10 $finish;
	end

	initial
		$monitor("%t: Read %d@%d; Write %d@%d", 
			$time, data_out, read_addr, data_in, write_addr);

endmodule	
