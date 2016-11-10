module scanner (scan, transfer, goToStandby, clk, rst);
	input scan, transfer, goToStandby, clk, rst;
	output reg [2:0] state;
	reg [2:0] next;
	reg [24:0] tBase = 25'b0;
	reg [6:0] current_count = 7'b0;
	reg counter_reset, count_enable;

	parameter lowPower = 3'b000, active = 3'b001, standby = 3'b010, idle = 3'b011, flush = 3'b100;

	always@(posedge clk)
		tBase <= tBase + 1'b1;
	
	always@(posedge tBase[1])begin
		if(!counter_reset)
			current_count <= 7'b0;
		else if (count_enable)
			current_count <= current_count + 1'b1;
	end

	always @(posedge clk or negedge rst) begin
		if (~rst) begin
			counter_reset <= 1'b0;
			current_count <= 7'b0;
			count_enable <= 1'b0;
			state <= lowPower;
		end else begin
			state <= next;
		end
	end

	always @(posedge clk) begin
		case (state)
			lowPower: 	begin if (scan) next <= active;
							else if (goToStandby) next <= standby;
							else next <= lowPower;
						end
			active:		begin if (transfer) next <= lowPower;
							else if (~transfer) next <= idle;
							else next <= active;


		endcase
	end



endmodule