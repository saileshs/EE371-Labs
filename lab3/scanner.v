`include "buffer.v"

module scanner (start_scan, data_count, ready_second_buffer, start_second_buffer, ready_to_transfer, transfer, flush_signal, go_to_standby, state, clk, rst);
	output reg [2:0] state;
	output wire [7:0] data_count;
	output reg ready_second_buffer, start_second_buffer, ready_to_transfer;
	input start_scan, transfer, go_to_standby, flush_signal, clk, rst;

	reg [2:0] next;
	reg flush_buffer;

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
		
		ready_second_buffer <= 1'b0;
		// ready_to_transfer <= 1'b0;
		start_second_buffer <= 1'b0;
		flush_buffer <= 1'b0;
		
		case (state)
			lowPower: 	begin 
							ready_to_transfer <= 1'b0;
							if (start_scan) next <= active;
							else if (go_to_standby) next <= standby;
							else next <= lowPower;
						end
			active:		begin
							if (data_count >= 8'd80) begin
								ready_to_transfer <= 1'b1;
								ready_second_buffer <= 1'b1;
							end
							if (data_count >= 8'd90) start_second_buffer <= 1'b1;
							if (transfer && data_count >= 8'd100) next <= lowPower;
							else if (~transfer && data_count >= 8'd100) next <= idle;
							else next <= active;
						end
			standby: 	begin if (start_scan) next <= active;
							else next <= standby;
						end
			idle: 		begin 
							ready_to_transfer <= 1'b1;
							if (transfer) next <= lowPower;
							else if (flush_signal) next <= flush;
							else next <= idle;
						end
			flush: 		begin
							flush_buffer <= 1'b1;
							next <= lowPower;
						end
		endcase
	end
endmodule