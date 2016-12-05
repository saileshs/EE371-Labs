`include "serial_out.v"

module serial_out_TB();

	wire bit_out, char_sent;
	reg trans_en, load, clk, rst;
	reg [7:0] data_in;

	serial_out dut (bit_out, char_sent, trans_en, load, data_in, clk, rst);

	always #1 clk = ~clk;

	parameter delay = 5, bitdelay = 64; 
	

	initial begin
		$dumpfile("serial_out.vcd");
		$dumpvars(1, dut);
	end

	initial begin
		clk = 1;
		rst = 0;
		load = 0;
		trans_en = 0;
		#delay;
		rst = 1;
		#delay;

		data_in = 8'b11001010;
		#delay;
		load = 1;
		#1;
		load = 0;
		#delay;
        
		trans_en = 1;
		#5000;

		$finish;
	end


endmodule