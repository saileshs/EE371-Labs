`include "buffer.v"
module bufferTB();
	//wire [7:0] data_count, data_count2;
	wire [7:0] data_count;
	reg scanning, flush, transfer, clk, rst;
	always #1 clk = ~clk;
	
	
	buffer dutt (data_count, scanning, flush, transfer, clk ,rst);
	parameter stimdelay = 2000;
	
	initial begin
		rst = 0; scanning = 0; flush = 0; transfer = 0;clk = 1;
		#4
		rst = 1; scanning = 1;
		#stimdelay;
		scanning = 0;
		#4
		transfer = 1;
		#1500;
		transfer = 0;
		#4;
		scanning = 1;
		#stimdelay;
		scanning = 0;
		flush = 1;
		#16
		flush = 0;
		#stimdelay;
		$finish;
	end

	initial begin
		$dumpfile("buf.vcd");
		$dumpvars(1, dutt);
	end

endmodule
