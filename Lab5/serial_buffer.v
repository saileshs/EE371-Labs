module serial_buffer (bit_out, parallel_in, load, sr_clk, rst);	
	output reg bit_out;
	input [10:0] parallel_in;
	input load, sr_clk, rst;

	reg [10:0] bitShift = 11'b11111111111;


	always@(posedge sr_clk or posedge load or negedge rst) begin
		if (~rst)
			bitShift <= 11'b11111111111;
		else if (load)
			bitShift <= parallel_in;
		else if (sr_clk)
			bitShift <= {1'b1, bitShift[10:1]};

	end

	always@(posedge sr_clk) begin
		bit_out <= bitShift[0];
	end

endmodule