`include "scanner.v"

module top (hex0, hex1, hex2, data_count, data_count2, start_scan, transfer_input, clk, rst);
	input start_scan, transfer_input, clk, rst;
	wire start_scan1, start_second_buffer, ready_to_transfer, ready_second_buffer; // For scanner 1
	reg go_to_standby1 = 1'b0, go_to_standby2 = 1'b0, flush_signal = 1'b0, flush_signal2 = 1'b0, transfer = 1'b0, transfer2 = 1'b0;
	output reg [6:0] hex0, hex1, hex2;
	output wire [7:0] data_count, data_count2;
	wire start_scan2, start_first_buffer, ready_first_buffer, ready_to_transfer2;
	wire [3:0] hundreds, tens, ones;

	wire [2:0] state, state2;

	parameter zero = 7'b1000000, one = 7'b1111001, two = 7'b0100100, three = 7'b0110000, four = 7'b0011001, five = 7'b0010010, 
		six = 7'b0000010, seven = 7'b1111000, eight = 7'b0000000, nine = 7'b0011000;
	
	assign start_scan1 = (~start_scan) ? ~start_scan : start_first_buffer;
	assign start_scan2 = start_second_buffer;

	scanner scan (start_scan1, data_count, ready_second_buffer, start_second_buffer, ready_to_transfer, transfer, flush_signal, ready_first_buffer, state, clk, rst);
	scanner scan2 (start_scan2, data_count2, ready_first_buffer, start_first_buffer, ready_to_transfer2, transfer2, flush_signal2, ready_second_buffer, state2, clk, rst);
	
	BCD hex_display (data_count, hundreds, tens, ones);


	/*
		Buffer 1: 80% THEN ready_to_transfer == 1. go_to_standby == 1. Scanner 2 enters STANDBY state. DONE
		Buffer 1: 90%, THEN start_second_buffer == 1. Scanner 2 enters ACTIVE state. DONE
		Buffer 1: 100%, ready_to_trasfer == 1, transfer == 0 THEN Buffer 1 enters IDLE state DONE

		Buffer 1: 100%, ready_to_trasfer == 1, transfer == 1, Buffer 2: < 50% THEN transfer Buffer 1 data 
																		and Scanner 1 enters LOW POWER state
		Buffer 1: 100%, ready_to_trasfer == 1, transfer == 1, Buffer 2: >= 50% THEN flush Buffer 1 data
	*/

	always @(posedge clk) begin
		if (~rst) begin
			transfer <= 1'b0;
			transfer2 <= 1'b0;
			flush_signal <= 1'b0;
			flush_signal2 <= 1'b0;
		end

		if (ready_to_transfer && (~transfer_input)) transfer <= 1'b1;
		else if (data_count == 8'b0) transfer <= 1'b0;

		if (ready_to_transfer2 && (~transfer_input)) transfer2 <= 1'b1;
		else if (data_count2 == 8'b0) transfer2 <= 1'b0;

		if ((data_count2 >= 8'd50) && (data_count == 8'd100)) flush_signal <= 1'b1;
		else flush_signal <= 1'b0;

		if ((data_count >= 8'd50) && (data_count2 == 8'd100)) flush_signal2 <= 1'b1;
		else flush_signal2 <= 1'b0;

	end

	always @(posedge clk) begin
		case (ones)
			4'b0000: hex0 = zero;
			4'b0001: hex0 = one;
			4'b0010: hex0 = two;
			4'b0011: hex0 = three;
			4'b0100: hex0 = four;
			4'b0101: hex0 = five;
			4'b0110: hex0 = six;
			4'b0111: hex0 = seven;
			4'b1000: hex0 = eight;
			4'b1001: hex0 = nine;
			default: hex0 = 7'b1111111;
		endcase
			
		case (tens)
			4'b0000: hex1 = zero;
			4'b0001: hex1 = one;
			4'b0010: hex1 = two;
			4'b0011: hex1 = three;
			4'b0100: hex1 = four;
			4'b0101: hex1 = five;
			4'b0110: hex1 = six;
			4'b0111: hex1 = seven;
			4'b1000: hex1 = eight;
			4'b1001: hex1 = nine;
			default: hex1 = 7'b1111111;
		endcase
		
		case (hundreds)
			4'b0000: hex2 = zero;
			4'b0001: hex2 = one;
			4'b0010: hex2 = two;
			4'b0011: hex2 = three;
			4'b0100: hex2 = four;
			4'b0101: hex2 = five;
			4'b0110: hex2 = six;
			4'b0111: hex2 = seven;
			4'b1000: hex2 = eight;
			4'b1001: hex2 = nine;
			default: hex2 = 7'b1111111;
		endcase

	end
	
endmodule // top

module BCD(number, hundreds, tens, ones);
   // I/O Signal Definitions
   input  [7:0] number;
   output reg [3:0] hundreds;
   output reg [3:0] tens;
   output reg [3:0] ones;
   
   // Internal variable for storing bits
   reg [19:0] shift;
   integer i;
   
   always @(number)
   begin
      // Clear previous number and store new number in shift register
      shift[19:8] = 0;
      shift[7:0] = number;
      
      // Loop eight times
      for (i=0; i<8; i=i+1) begin
         if (shift[11:8] >= 5)
            shift[11:8] = shift[11:8] + 3;
            
         if (shift[15:12] >= 5)
            shift[15:12] = shift[15:12] + 3;
            
         if (shift[19:16] >= 5)
            shift[19:16] = shift[19:16] + 3;
         
         // Shift entire register left once
         shift = shift << 1;
      end
      
      // Push decimal numbers to output
      hundreds = shift[19:16];
      tens     = shift[15:12];
      ones     = shift[11:8];
   end
 
endmodule