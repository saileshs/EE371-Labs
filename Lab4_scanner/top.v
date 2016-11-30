//`include "scanner.v"

module top (data_out1, data_out2, data_out_cpu1, data_out_cpu2, state, state2, ready_to_transfer, ready_to_transfer2, data_in1, data_in2, start_scan, transfer_input, clk, rst);
	output [2:0] state, state2;
	output ready_to_transfer, ready_to_transfer2;
	output wire [7:0] data_out1, data_out2;
	output wire [7:0] data_out_cpu1, data_out_cpu2; 
	input [7:0] data_in1, data_in2;
	input start_scan, transfer_input, clk, rst;

	wire start_scan1, start_second_buffer, ready_to_transfer, ready_second_buffer; // For scanner 1
	wire start_scan2, start_first_buffer, ready_first_buffer, ready_to_transfer2;
	wire [3:0] address1, address2;
	
	reg flush_signal = 1'b0, flush_signal2 = 1'b0, transfer = 1'b0, transfer2 = 1'b0;
	
	assign data_out_cpu1 = data_out1;
	assign data_out_cpu2 = data_out2;

	assign start_scan1 = (~start_scan) ? ~start_scan : start_first_buffer;
	assign start_scan2 = start_second_buffer;
	
	scanner scan (address1, data_out1, start_scan1, data_in1, ready_second_buffer, start_second_buffer, ready_to_transfer, transfer, flush_signal, ready_first_buffer, state, clk, rst);
	scanner scan2 (address2, data_out2, start_scan2, data_in2, ready_first_buffer, start_first_buffer, ready_to_transfer2, transfer2, flush_signal2, ready_second_buffer, state2, clk, rst);
	
	always @(posedge clk) begin
		if (~rst) begin
			transfer <= 1'b0;
			transfer2 <= 1'b0;
			flush_signal <= 1'b0;
			flush_signal2 <= 1'b0;
		end

		if (ready_to_transfer && (~transfer_input)) transfer <= 1'b1;
		else if (address1 == 4'b0) transfer <= 1'b0;

		if (ready_to_transfer2 && (~transfer_input)) transfer2 <= 1'b1;
		else if (address2 == 4'b0) transfer2 <= 1'b0;

		if ((address2 >= 4'd4) && (address1 >= 4'd9)) flush_signal <= 1'b1;
		else flush_signal <= 1'b0;

		if ((address1 >= 4'd4) && (address2 >= 4'd9)) flush_signal2 <= 1'b1;
		else flush_signal2 <= 1'b0;

	end
 
endmodule
