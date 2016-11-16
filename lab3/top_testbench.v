`include "top.v"
module top_testbench();
	wire [7:0] data_count, data_count2;
	wire [6:0] hex0, hex1, hex2;
	reg start_scan, transfer_input, clk, rst;

	always #1 clk = ~clk;
	
	top dutt (hex0, hex1, hex2, data_count, data_count2, start_scan, transfer_input, clk, rst);

	parameter stimdelay = 5000;
	
	initial begin
		rst = 0;clk = 1; transfer_input = 1;
		#1;
		rst = 1;
		#1;
		start_scan = 1;
		#4;
		start_scan = 0;
		#4;
		start_scan =1;
		#4
		transfer_input = 0;
		
		
		#stimdelay;
		$finish;
	end

	initial begin
		$dumpfile("top.vcd");
		$dumpvars(1, dutt);
	end

endmodule
