`include "buffer_new.v"

module scanner (address, data_out, start_scan, data_in, ready_second_buffer, start_second_buffer, 
				ready_to_transfer, transfer, flush_signal, go_to_standby, state, wr_en, read_inc, clk, rst);
	output reg [2:0] state;
	output wire [7:0] data_out;
	output wire [3:0] address;
	output reg ready_second_buffer = 1'b0, start_second_buffer = 1'b0, ready_to_transfer;
	
	input [7:0] data_in;
	input start_scan, transfer, go_to_standby, flush_signal, clk, rst;
	input wr_en, read_inc;
	reg [3:0] read_address = 4'b0;
	reg mem_rst, read_inc_delayed, read_inc_edge;

	reg [2:0] next;
	
	buffer_new buff (data_out, data_in, address, read_address, wr_en, clk, mem_rst);

	parameter lowPower = 3'b000, active = 3'b001, standby = 3'b010, idle = 3'b011, flush = 3'b100, transtage = 3'b101;

	always @(posedge clk or negedge rst) begin
		if (~rst) begin
			state <= lowPower;
			read_address <= 4'b0;
		end else begin
			state <= next;
		end
	end

	always @(posedge clk) begin
		read_inc_delayed <= read_inc;
		read_inc_edge <= read_inc ^ read_inc_delayed;
	end

	always @(posedge clk) begin
		case (state)
			lowPower: 	begin
							ready_to_transfer <= 1'b0;
							ready_second_buffer <= 1'b0;
							start_second_buffer <= 1'b0;
							mem_rst <= 1'b0;
							read_address <= 4'b0;
							if (start_scan && transfer == 1'b0)
								next <= active;
							else if (go_to_standby) 
								next <= standby;
							else
								next <= lowPower;
							end
			active:		begin
							mem_rst <= 1'b1;
							if(transfer) begin
								next <= transtage;
							end else if (address == 4'd9) begin
								next <= idle;
							end else 
								next <= active;

							if (address >= 4'd7) begin
								ready_to_transfer <= 1'b1;
								ready_second_buffer <= 1'b1;
								
							end
							if (address >= 4'd8) 
								start_second_buffer <= 1'b1;

						end
			standby: 	begin
							mem_rst <= 1'b1;
							if (start_scan) 
								next <= active;
							else 
								next <= standby;
						end
			idle: 		begin
							mem_rst <= 1'b1;
							ready_second_buffer <= 1'b0;
							start_second_buffer <= 1'b0;
							ready_to_transfer <= 1'b1;
							if (transfer) begin
								next <= transtage;
							end
							else if (flush_signal)
								next <= flush;
							else begin
								next <= idle;
							end
						end
			flush: 		begin
							mem_rst <= 1'b0;
							if(address == 4'd0)
								next <= lowPower;
							else
								next <= flush;
						end
			transtage : begin
							mem_rst <= 1'b1;
							if(address > 4'd9)
								next <= lowPower;
							else if (read_inc_edge && read_inc) begin
								read_address <= read_address + 1'b1;
								next <= transtage;
							end else 
								next <= transtage;
						end
								
		endcase
	end
endmodule