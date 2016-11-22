//`include "scanner.v"

module top (state, state2, ready_to_transfer, ready_to_transfer2, start_scan, transfer_input, clk, rst);
	input start_scan, transfer_input, clk, rst;
	wire start_scan1, start_second_buffer, ready_to_transfer, ready_second_buffer; // For scanner 1
	reg flush_signal = 1'b0, flush_signal2 = 1'b0, transfer = 1'b0, transfer2 = 1'b0;
	wire [7:0] data_count, data_count2;
	wire start_scan2, start_first_buffer, ready_first_buffer, ready_to_transfer2;
	output [2:0] state, state2;
	output ready_to_transfer, ready_to_transfer2;
	
	assign start_scan1 = (~start_scan) ? ~start_scan : start_first_buffer;
	assign start_scan2 = start_second_buffer;

	scanner scan (start_scan1, data_count, ready_second_buffer, start_second_buffer, ready_to_transfer, transfer, flush_signal, ready_first_buffer, state, clk, rst);
	scanner scan2 (start_scan2, data_count2, ready_first_buffer, start_first_buffer, ready_to_transfer2, transfer2, flush_signal2, ready_second_buffer, state2, clk, rst);
	

	always @(posedge clk) begin
		if (~rst) begin
			transfer <= 1'b0;
			transfer2 <= 1'b0;
			flush_signal <= 1'b0;
			flush_signal2 <= 1'b0;
		end

		if (ready_to_transfer && (~transfer_input)) transfer <= 1'b1;
		else if (data_count == 8'b0) transfer <= 1'b0;

		if (ready_to_transfer2 && (~transfer_input)) transfer2 <= 1'b1;
		else if (data_count2 == 8'b0) transfer2 <= 1'b0;

		if ((data_count2 >= 8'd50) && (data_count == 8'd100)) flush_signal <= 1'b1;
		else flush_signal <= 1'b0;

		if ((data_count >= 8'd50) && (data_count2 == 8'd100)) flush_signal2 <= 1'b1;
		else flush_signal2 <= 1'b0;

	end
 
endmodule