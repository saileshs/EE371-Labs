`include "buffer.v"

module scanner (state, data_count, flush_buffer, start_second_buffer, ready_to_transfer, start_scan, transfer, go_to_standby, clk, rst);
	output reg [2:0] state;
	output wire [6:0] data_count;
	output reg flush_buffer, start_second_buffer, ready_to_transfer;
	input start_scan, transfer, go_to_standby, clk, rst;

	reg [2:0] next;

	buffer buff (data_count, start_scan, flush_buffer, transfer, clk, rst);

	parameter lowPower = 3'b000, active = 3'b001, standby = 3'b010, idle = 3'b011, flush = 3'b100;

	always @(posedge clk or negedge rst) begin
		if (~rst) begin
			state <= lowPower;
		end else begin
			state <= next;
		end
	end

	always @(posedge clk) begin
		case (state)
			lowPower: 	begin if (start_scan) next <= active;
							else if (go_to_standby) next <= standby;
							else next <= lowPower;
						end
			active:		begin
							if (data_count >= 7'd80) ready_to_transfer <= 1'b1;
							if (data_count >= 7'd90) start_second_buffer <= 1'b1;
							if (transfer && data_count >= 7'd100) next <= lowPower;
							else if (~transfer && data_count >= 7'd100) next <= idle;
							else next <= active;
						end
			standby: 	begin if (start_scan) next <= active;
							else next <= standby;
						end
			idle: 		begin if (transfer) next <= lowPower;
							else next <= flush;
						end
			flush: 		begin
							flush_buffer <= 1'b1;
							next <= lowPower;
						end
		endcase
	end
endmodule