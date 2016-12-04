`include "parallel_buffer.v"

module parallel_buffer_TB();
	wire [10:0] parallel_out;
	reg serial_in, sr_clk, rst;

	parallel_buffer dut (parallel_out, serial_in, sr_clk, rst);	

	parameter delay = 5;
	integer i;
	initial begin
		sr_clk = 0;
		rst = 1'b0;
		
		#delay;

		rst = 1'b1;
		#1;

		for (i = 0; i < 11; i=i+1) begin
			#1
			serial_in = i % 2;
			#1
			sr_clk = 1;
			#1
			sr_clk = 0;
		end

		#delay;#delay;#delay;#delay;
		$finish;
	end

	initial begin
		$dumpfile("parallel_buffer.vcd");
		$dumpvars(1, dut);
	end


endmodule