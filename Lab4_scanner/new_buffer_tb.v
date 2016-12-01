`include "buffer_new.v"
module new_buffer_tb();
	
	wire [7:0] data_out;
	wire [3:0] address;
	
	reg [7:0] data_in = 4'd0;
	reg [3:0] read_address = 4'd0;
	reg wr_en, mem_rst, clk; 
	
	buffer_new buff(data_out, data_in, address, read_address, wr_en, clk, mem_rst);
	
	always #1 clk = ~clk;
	parameter delay = 2;
	integer j,k;
	initial begin
		mem_rst = 0; clk = 1;
		#delay;
		mem_rst = 1;
		#delay;
		for(j=0;j<10;j=j+1) begin
			#delay;
			data_in = j+5;
			#delay;
			wr_en = 1'b1;
			#delay;
			wr_en = 1'b0;
		end
		#delay;
		#delay;
		#delay;
		for(k=0; k<10; k=k+1) begin
			read_address = read_address + 1;
			#delay;
		end
		#delay
		$finish;
	end
	
	initial begin
		$dumpfile("new_buffer.vcd");
		$dumpvars(1,buff);
	end
endmodule