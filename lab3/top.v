module top (start_scan, data_count, flush_buffer, start_second_buffer, ready_to_transfer, transfer, go_to_standby, clk, rst);
	input start_scan, go_to_standby, flush_buffer, start_second_buffer, ready_to_transfer, transfer, clk, rst;
	output reg [6:0] hex0, hex1, hex2;
	output wire [6:0] data_count;
	wire data_count;
	
	parameter zero = 7'b1000000, one = 7'b1111001, two = 7'b0100100, three = 7'b0110000, four = 7'b0011001, five = 7'b0010010, 
		six = 7'b0000010, seven = 7'b1111000, eight = 7'b0000000, nine = 7'b0011000;
	
	scanner (start_scan, data_count, flush_buffer, start_second_buffer, ready_to_transfer, transfer, go_to_standby, clk, rst);
	
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
	
end module

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