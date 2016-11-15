module buffer(data_count, scanning, flush, transfer, clk ,rst);

	output reg [7:0] data_count = 8'd0;
	input rst, clk, scanning, flush, transfer;
	reg [24:0] tBase = 25'b0;
	reg [1:0] semaphore = 2'b00;
	
	parameter
	increase = 2'b10, decrease = 2'b01, hold = 2'b00, dump = 2'b11;
	
	always@(posedge clk)
		tBase <= tBase + 1'b1;
	
	always@(posedge tBase[20]) begin
		case(semaphore)
			hold: data_count <= data_count;
			increase: 	if(data_count < 8'd100)
							data_count <= data_count + 8'd1;
			decrease: 	if (data_count = 8'd1) 
							data_count <= 8'd0;
						else if(data_count > 8'd0)
							data_count <= data_count - 8'd2;
			dump: 	
			default: 	data_count <= data_count;
		endcase
	end
	
	always@(posedge clk or negedge rst) begin
		if(~rst)
			semaphore <= dump;
			data_count <= 8'd0;
		else if (flush)
			semaphore <= dump;
			data_count <= 8'd0;
		else if (scanning)
			semaphore <= increase;
		else if (transfer)
			semaphore <= decrease;
	end
endmodule
			
			