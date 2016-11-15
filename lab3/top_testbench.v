`include "top.v"
module top_testbench();
	wire hex0, hex1, hex2, data_count, data_count2;
	reg start_scan, transfer_input, clk, rst;

	always #1 clk = ~clk;
	
	top dut (hex0, hex1, hex2, data_count, data_count2, start_scan, transfer_input, clk, rst);

	parameter stimdelay = 500;
	
	initial begin
		rst = 1'b0;
		#1;
		rst = 1'b1;
		#1;
		start_scan = 1'b0;
		#1;
		start_scan = 1'b1;
		#stimdelay;
		$finish;
	end

	initial begin

	end

endmodule
