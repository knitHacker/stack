module stack(input clk, 
						input push, 
						input [WIDTH-1:0] data_in, 
						input pop, 
						output [WIDTH-1:0] data_out);

	parameter WIDTH = 8;
	parameter HEIGHT = 9;
	parameter ADDR_WIDTH = 4;

	reg [ADDR_WIDTH-1:0] next ;
	wire [ADDR_WIDTH-1:0] top ;
	
	initial begin
		next = 0;
	end
		
	assign top = next -1;

	regfile r1(clk, 
		top, 
		data_out, 
		next, 
		data_in, 
		push);
	defparam r1.HEIGHT = HEIGHT;
	defparam r1.ADDR_WIDTH = ADDR_WIDTH;
	defparam r1.WIDTH = WIDTH;

	always @(posedge clk) begin
		if(push)begin
			next <= next + 1;
		end
		if(pop) begin
			next <= next -1;
		end
	end

endmodule
