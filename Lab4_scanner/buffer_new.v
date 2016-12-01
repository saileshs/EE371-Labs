module buffer_new(data_out, data_in, address, read_address, wr_en, clk, mem_rst);

	output [7:0] data_out;
	output reg [3:0] address;
	input [3:0] read_address;
	input [7:0] data_in;
	input wr_en, clk, mem_rst;
	
	reg [7:0] m [0:9];
	
	assign data_out = m[read_address];
	integer i;
	always@(wr_en or ~mem_rst) begin
		if(~mem_rst) begin
			for(i=0; i<10; i=i+1)
				m[i] <= 8'b0;
			
			address <= 4'd0;
		end else if (wr_en)
			m[address] <= data_in;
		else if (~wr_en)
			address <= address + 1'd1;
	end
	
	
endmodule
	