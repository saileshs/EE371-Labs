module serial_out_ctrl(SR_CLK, char_sent, trans_en, clk, rst);
	output reg SR_CLK, char_sent;
	input trans_en, clk, rst;
	
	reg [20:0] tBase = 21'b0;
	reg [3:0] BSC = 4'b0, BIC = 4'b0;
	
	always@(posedge clk) begin
		if(~rst)
			tBase <= 21'b0;
		else
			tBase <= tBase + 1'b1;
	end
	
	always@(posedge tBase[7]) begin // set tBase[7] for 9600(12207) baudrate
		if(~trans_en || ~rst) begin
			BSC <= 4'b0;
		end else if (trans_en) begin
			BSC <= BSC + 1'b1;
		end
	end
	
	always@(posedge clk) begin
		if(~rst)
			SR_CLK <= 1'b0;
		else if (BSC == 4'b1111)
			SR_CLK <= 1'b1;
		else
			SR_CLK <= 1'b0;
	end
	
	always@(posedge tBase[7]) begin
		if(~trans_en || ~rst)begin
			BIC <= 4'd0;
			char_sent <= 1'b0;
		end else if (BSC == 4'b1111 && BIC < 4'd11)
			BIC <= BIC + 4'd1;
		else if (BIC >= 4'd11) begin
			BIC <= BIC;
			char_sent <= 1'b1;
		end
	end
	
endmodule