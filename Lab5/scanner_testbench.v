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

	parameter stimdelay = 5000, delay = 10;
	integer i;
	initial begin
		rst = 1'b1;clk = 1;transfer = 1'b0;flush_signal = 0; read_inc = 0;start_scan = 1'b0;wr_en = 0;go_to_standby = 0;
		#delay;
		rst= 1'b0;
		#delay;
		rst = 1'b1;
		#delay;
		go_to_standby = 1;
		#delay;
		go_to_standby = 0;
		#delay;
		start_scan = 1'b1;
		#delay;
		start_scan = 1'b0;
		data_in = 8'd5;
		for (i = 0; i < 10; i=i+1) begin
			#delay;
			wr_en = 1'b1;
			#delay;
			wr_en = 1'b0;
			#delay;
			data_in = data_in + 1;
		end
		#delay
		transfer = 1'b1;
		#delay
		transfer = 1'b0;
		for (i = 0; i <10; i=i+1) begin
			#delay;
			read_inc = 1;
			#delay;
			read_inc = 0;
		end
		#delay
		start_scan = 1'b1;
		#delay;
		start_scan = 1'b0;
		for (i = 0; i < 10; i=i+1) begin
			#delay;
			wr_en = 1'b1;
			#delay;
			wr_en = 1'b0;
			#delay;
			data_in = data_in + 1;
		end
		#delay
		flush_signal = 1;
		#delay
		flush_signal = 0;
			
		#stimdelay;
		$finish;
	end

	initial begin
		$dumpfile("scanner.vcd");
		$dumpvars(1, dut);
	end


endmodule