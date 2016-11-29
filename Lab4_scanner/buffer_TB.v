`include "buffer.v"
module buffer_TB();

	reg [7:0] data_in;
	reg rst, clk, scanning, flush, transfer;
	wire [7:0] data_out;
	wire [3:0] address;
	//wire [79:0] mem_out;
	buffer dut(data_in, data_out, address, scanning, flush, transfer, clk, rst);
	
	
	always #1 clk = ~clk;
	parameter delay = 2;
	integer j;
	initial begin
		data_in = 8'd0; rst = 0; clk = 1; scanning = 0; flush = 0; transfer = 0;
		#delay;
		rst = 1;
		#delay;
		scanning = 1;
		data_in = 8'd0;
		for(j=0;j<10;j=j+1) begin
			#delay;
			data_in = j+5;
		end
		#delay;
		#delay;
		#delay;
		#delay;
		#delay;
		#delay;
		#delay;
		scanning = 0;
		#delay;
		transfer = 1;
		for(j=0;j<10;j=j+1) begin
			#delay;
		end
		#delay;
		$finish;
	end
	
	initial begin
		$dumpfile("buffer.vcd");
		$dumpvars(1,dut);

	
	end
	
	
	
	
endmodule