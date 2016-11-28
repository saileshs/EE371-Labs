module buffer(mem_out, data_in, data_out, data_count, scanning, flush, transfer, clk, rst);
	output [79:0] mem_out;
	input [7:0] data_in;
	output reg [7:0] data_out = 8'b0;

	output reg [3:0] data_count ;
	input rst, clk, scanning, flush, transfer;
	reg [7:0] m [0:9];
	
	

	reg [1:0] state = 2'b00;
	reg [1:0] next = 2'b00;
	
	parameter
	writing = 2'b10, reading = 2'b01, hold = 2'b00, dump = 2'b11;
	
	integer i;
	genvar k;
	generate for (k=0; k < 10; k = k+1) begin: memout
		assign mem_out[8*(k+1)-1 : 8*k] = m[k];
	end endgenerate
	
	always@(posedge clk or negedge rst) begin
		if(~rst) begin
			state <= dump;
		end else begin
			state <= next;
		end
	end
	

	always@(posedge clk) begin
	
		if(flush) begin
			next <= dump;
		end else if (scanning) begin
			next <= writing;
			if(state != writing)
				data_count <= 4'd0;
		end else if (transfer) begin
			next <= reading;
			if(state != reading)
				data_count <= 4'd0;
		end
	
	
	
		case(state)
			writing: if(data_count <= 4'd9 && next == writing) begin
							m[data_count] = data_in;
							data_count = data_count + 1'd1;
						end
			reading: if(data_count <= 4'd9 && next == reading) begin
							data_out = m[data_count];
							data_count = data_count + 1'd1;
						end
			hold: begin
						data_count <= data_count;
					end
			dump: begin

					for(i=0; i<10; i=i+1) 
						m[i] <= 8'b0;			

					data_count <= 4'd0;
					end
		endcase
	end

	
	
	
endmodule
			
			