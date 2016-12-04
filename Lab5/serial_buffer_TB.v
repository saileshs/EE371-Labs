`include "serial_buffer.v"

module serial_buffer_TB();
	wire bit_out;
	reg [10:0] parallel_in;
	reg load, sr_clk, rst;

	serial_buffer dut (bit_out, parallel_in, load, sr_clk, rst);	

	//always #1 sr_clk = ~sr_clk;

	parameter delay = 5;
	integer i;
	initial begin
		parallel_in = 11'b0;
		sr_clk = 0;
		load = 1'b0;
		rst = 1'b0;
		#delay;

		rst = 1'b1;
		load = 1'b1;
		parallel_in = 11'b11111010100;
		#1;
		load = 1'b0;

		for (i = 0; i < 15; i=i+1) begin
			#1
			sr_clk = 1;
			#1
			sr_clk = 0;
		end

		#delay;#delay;#delay;#delay;
		$finish;
	end

	initial begin
		$dumpfile("serial_buffer.vcd");
		$dumpvars(1, dut);
	end


endmodule