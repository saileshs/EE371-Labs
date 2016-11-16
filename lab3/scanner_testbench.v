`include "scanner.v"
module scanner_testbench();
	wire [7:0] data_count;
	wire [2:0] state;
	wire ready_second_buffer, start_second_buffer, ready_to_transfer;

	reg start_scan, transfer, go_to_standby, flush_signal, clk, rst;

	always #1 clk = ~clk;
	
	scanner dut (start_scan, data_count, ready_second_buffer, start_second_buffer, ready_to_transfer, transfer, flush_signal, go_to_standby, state, clk, rst);

	parameter stimdelay = 5000;
	
	initial begin
		rst = 1'b0;clk = 1;
		#1;
		rst = 1'b1;
		#1;
		start_scan = 1'b0;
		#1;
		start_scan = 1'b1;
		transfer = 1'b0;
		#4;
		start_scan = 1'b1;
		#10;
		transfer = 1'b1;
		#stimdelay;
		$finish;
	end

	initial begin
		$dumpfile("scanner.vcd");
		$dumpvars(1, dut);
	end


endmodule