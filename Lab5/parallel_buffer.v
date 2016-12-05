module parallel_buffer (parallel_out, ser_data_in, sr_clk, rst);	
	output wire [10:0] parallel_out;
	input ser_data_in;
	input sr_clk, rst;

	reg [10:0] bitShift = 11'b11111111111;


	always@(posedge sr_clk or negedge rst) begin
		if (~rst) begin
			bitShift <= 11'b11111111111;
		end else begin
			bitShift <= {ser_data_in, bitShift[10:1]};
		end
	end

	assign parallel_out = bitShift;

endmodule