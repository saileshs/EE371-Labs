module parallel_buffer (parallel_out, serial_in, sr_clk, rst);	
	output wire [10:0] parallel_out;
	input serial_in;
	input sr_clk, rst;

	reg [10:0] bitShift = 11'b11111111111;


	always@(posedge sr_clk or negedge rst) begin
		if (~rst) begin
			bitShift <= 11'b11111111111;
		end else begin
			bitShift <= {bitShift[9:0], serial_in};
		end

	end

	assign parallel_out = bitShift;

endmodule