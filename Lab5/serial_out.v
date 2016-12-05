//`include "serial_out_ctrl.v"
//`include "serial_buffer.v"

module serial_out(bit_out, char_sent, trans_en, load, data_in, clk, rst);
	output wire bit_out, char_sent;
	input trans_en, load, clk, rst;
	input [7:0] data_in;

	wire [10:0] data_in_full;

	wire parity, SR_CLK;

	assign parity =  	(data_in[0] ^ data_in[1]) ^  
                        (data_in[2] ^ data_in[3]) ^ 
                        (data_in[4] ^ data_in[5]) ^  
                        (data_in[6] ^ data_in[7]);

	assign data_in_full = {1'b1, parity, data_in, 1'b0};

	serial_buffer parallel_to_serial (bit_out, data_in_full, load, SR_CLK, rst);
	serial_out_ctrl serial_ctrl (SR_CLK, char_sent, trans_en, clk, rst);

endmodule