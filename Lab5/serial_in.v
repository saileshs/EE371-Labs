//`include "parallel_buffer.v"
//`include "serial_in_ctrl.v"
module serial_in(data_out, char_received, ser_data_in, clk, rst);
	output [7:0] data_out;
	output char_received;
	input ser_data_in, clk, rst;
	wire sr_clk;
	wire [10:0] parallel_out;
	assign data_out = parallel_out[8:1];
	
	
	
	parallel_buffer SR(parallel_out, ser_data_in, sr_clk, rst);
	serial_in_ctrl SR_ctrl(sr_clk, char_received, ser_data_in, clk, rst);
endmodule