module serial_in_ctrl(SR_CLK, char_received, ser_data_in, clk, rst);
	output reg SR_CLK, char_received;
	input ser_data_in, clk, rst;
	reg [20:0] tBase = 21'b0;
	reg en;
	reg [3:0] BSC,BIC;
	
	always@(posedge clk) begin
		if(~rst)
			tBase <= 21'b0;
		else
			tBase <= tBase + 1'b1;
	end
	
	always@(posedge clk or negedge rst or posedge char_received) begin
		if(~rst)
			en <= 1'b0;
		else if (char_received)
			en <= 1'b0;
		else if (~ser_data_in)
			en <= 1'b1;
	end
	
	always@(posedge tBase[7]) begin // set tBase[7] for 9600(12207) baudrate
		if(~en || ~rst) begin
			BSC <= 4'b0;
		end else if (en) begin
			BSC <= BSC + 1'b1;
		end
	end
	
	always@(posedge clk) begin
		if(~rst)
			SR_CLK <= 1'b0;
		else if (BSC == 4'b0111)
			SR_CLK <= 1'b1;
		else
			SR_CLK <= 1'b0;
	end
	
	always@(posedge tBase[7]) begin
		if(~en || ~rst)begin
			BIC <= 4'd0;
			char_received <= 1'b0;
		end else if (BSC == 4'b1111 && BIC < 4'd11)
			BIC <= BIC + 4'd1;
		else if (BIC >= 4'd11) begin
			BIC <= BIC;
			char_received <= 1'b1;
		end
	end
endmodule

	