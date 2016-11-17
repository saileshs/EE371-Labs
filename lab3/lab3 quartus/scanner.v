//`include "buffer.v"

module scanner (start_scan, data_count, ready_second_buffer, start_second_buffer, ready_to_transfer, transfer, flush_signal, go_to_standby, state, clk, rst);
	output reg [2:0] state;
	output wire [7:0] data_count;
	output reg ready_second_buffer = 1'b0, start_second_buffer = 1'b0, ready_to_transfer;
	input start_scan, transfer, go_to_standby, flush_signal, clk, rst;
	reg scanning, transferring;

	reg [2:0] next;
	reg flush_buffer = 1'b0;
	buffer buff (data_count, scanning, flush_buffer, transferring, clk, rst);

	parameter lowPower = 3'b000, active = 3'b001, standby = 3'b010, idle = 3'b011, flush = 3'b100, transtage = 3'b101;

	always @(posedge clk or negedge rst) begin
		if (~rst) begin
			state <= lowPower;
		end else begin
			state <= next;
		end
	end

	always @(posedge clk) begin
		
		//ready_second_buffer <= 1'b0;
		//ready_to_transfer <= 1'b0;
		//start_second_buffer <= 1'b0;
		flush_buffer <= 1'b0;
		
		case (state)
			lowPower: 	begin
							transferring <= 1'b0;
							scanning <= 1'b0;
							ready_to_transfer <= 1'b0;
							ready_second_buffer <= 1'b0;
							start_second_buffer <= 1'b0;
							if (start_scan && transfer == 1'b0)
								next <= active;
							else if (go_to_standby) 
								next <= standby;
							else
								next <= lowPower;
							end
			active:		begin
							scanning <= 1'b1;
							//transferring <= 1'b0;
							if(transfer) begin
								next <= transtage;
							end else if (data_count == 8'd100) begin
								next <= idle;
							end else 
								next <= active;
								
							if (data_count >= 8'd80) begin
								ready_to_transfer <= 1'b1;
								ready_second_buffer <= 1'b1;
								
							end
							if (data_count >= 8'd90) 
								start_second_buffer <= 1'b1;

						end
			standby: 	begin
							transferring <= 1'b0;
							scanning <= 1'b0;
							if (start_scan) 
								next <= active;
							else 
								next <= standby;
						end
			idle: 		begin
							scanning <= 1'b0;
							ready_second_buffer <= 1'b0;
							start_second_buffer <= 1'b0;
							ready_to_transfer <= 1'b1;
							if (transfer)begin
								transferring <= 1'b1;
								next <= lowPower;
							end
							else if (flush_signal)
								next <= flush;
							else begin
								transferring <= 1'b0;
								next <= idle;
							end
						end
			flush: 		begin
							scanning <= 1'b0;
							transferring <= 1'b0;
							flush_buffer <= 1'b1;
							if(data_count == 8'd0)
								next <= lowPower;
							else
								next <= flush;
							end
			transtage : begin
								scanning <= 1'b0;
								transferring <= 1'b1;
								if(data_count == 8'd0)
									next <= lowPower;
								else
									next <= transtage;
							end
								
		endcase
	end
endmodule