module regfile( input clk,
							input [ADDR_WIDTH-1:0] ra,
							output reg [WIDTH-1:0] rd, 
							input [ADDR_WIDTH-1:0] wa,
							input [WIDTH-1:0] wd, 
							input we);

	parameter WIDTH = 8;
	parameter HEIGHT = 9;
	parameter ADDR_WIDTH = 4;

	reg[WIDTH-1:0] mem [HEIGHT-1:0];
								
	always @(posedge clk) begin
		rd <= mem[ra];
		if(we)
			mem[wa] = wd;
	end
endmodule


