module buffer(data_in, data_out, address, scanning, flush, transfer, clk, rst);
	reg [79:0] mem_out;
	input [7:0] data_in;
	output reg [7:0] data_out = 8'b0;

	output reg [3:0] address ;
	input rst, clk, scanning, flush, transfer;
	reg [7:0] m [0:9];
	reg WE = 1'b0;
	

	reg [1:0] state = 2'b00;
	reg [1:0] next = 2'b00;
	
	parameter
	writing = 2'b10, reading = 2'b01, hold = 2'b00, dump = 2'b11;
	
	integer i;
	genvar k;
	generate for (k=0; k < 10; k = k+1) begin: memout
		assign mem_out[8*(k+1)-1 : 8*k] = m[k];
	end endgenerate
	
	always@(*) begin
		if(WE)
			m[address] = data_in;
		
		data_out = m[address];
	end
	
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
			WE <= 1'b1;
			next <= writing;
			if(state!= writing)
				address <= 4'd0;
		end else if (transfer) begin
			next <= reading;
			if(state!= reading)
				address <= 4'd0;
		end else
			next <= hold;
	
	
	
		case(state)
			writing: if(address <= 4'd9 && next == writing) begin
							WE <= 1'b1;
							address <= address + 4'd1;
					end else 
							WE <= 1'b0;
			reading: if(address <= 4'd9 && next == reading) begin
							address = address + 1'd1;
					end else if(address >= 4'd10) begin
							for(i=0; i<10; i=i+1) 
							m[i] <= 8'b0;
					end		
			hold: begin
						address <= address;
					end
			dump: begin

					for(i=0; i<10; i=i+1) 
						m[i] <= 8'b0;			

					address <= 4'd0;
					end
		endcase
	end
	
	always@(negedge clk)
		WE <= 1'b0;

	
	
	
endmodule
			
			