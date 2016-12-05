`include "serial_in.v"
module serial_inTB();
	reg ser_data_in, clk, rst;
	wire [7:0] data_out;
	wire char_received;
	
	reg [10:0] data = 11'b11010111010;
	serial_in dut (data_out, char_received, ser_data_in, clk, rst);
	
	always #1 clk=~clk;
	parameter delay = 10, bitdelay = 64;
	integer i;
	initial begin
		rst = 0;
		clk = 1;
		ser_data_in = 1'b1;
		#delay;
		rst = 1;
		#delay;
		for(i = 0; i < 11; i=i+1) begin
			ser_data_in = data[i];
			#bitdelay;
		end
		#500;
		
		$finish;		
	
	end
	
	initial begin
		$dumpfile("serial_in.vcd");
		$dumpvars(1, dut);
	end
endmodule