`include "scanner.v"
module scanner_testbench();
	wire [7:0] data_out;
	wire [2:0] state;
	wire ready_second_buffer, start_second_buffer, ready_to_transfer;
	wire [3:0] address;

	reg start_scan, transfer, go_to_standby, flush_signal, read_inc, wr_en, clk, rst;
	reg [7:0] data_in;

	always #1 clk = ~clk;
	

	scanner dut (address, data_out, start_scan, data_in, ready_second_buffer, start_second_buffer, 
				ready_to_transfer, transfer, flush_signal, go_to_standby, state, wr_en, read_inc, clk, rst);

	parameter stimdelay = 5000;
	integer i;
	initial begin
		rst = 1'b0;clk = 1;transfer = 1'b1;
		#10;
		rst = 1'b1;
		#10;
		start_scan = 1'b0;
		#10;
		start_scan = 1'b1;
		#10;
		data_in = 8'd5;
		for (i = 0; i < 9; i=i+1) begin
			#10;
			wr_en = 1'b1;
			#10;
			data_in = data_in + 1;
			#10;
			wr_en = 1'b0;
		end
		#stimdelay;
		$finish;
	end

	initial begin
		$dumpfile("scanner.vcd");
		$dumpvars(1, dut);
	end


endmodule