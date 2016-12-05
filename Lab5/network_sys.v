module network_sys(ready_to_transfer_in_0, ready_to_transfer_in_1,ser_data_out, state, state2, hex0, hex1, hex2, hex3, hex4, hex5,ser_data_in, clk, rst);
	output wire [2:0] state, state2;
	output ready_to_transfer_in_0, ready_to_transfer_in_1;
	output ser_data_out;
	output reg [6:0] hex0, hex1, hex2, hex3, hex4 = off, hex5 = off;
	input clk, rst, ser_data_in;
	wire [7:0] cpu_data_in_0, cpu_data_in_1, cpu_data_out_0, cpu_data_out_1;
	wire ready_to_transfer_in_0, ready_to_transfer_in_1, start_scanning, start_transfer, scanner_rst, scanner_clk_ctrl;
	wire wr_en1, wr_en2, read_inc1, read_inc2;
	wire [7:0] data_out1, data_out2;
	
   wire [3:0] ones1, ones2, tens1, tens2, hundreds1, hundreds2, ones3, ones4, tens3, tens4, hundreds3, hundreds4;
	wire [7:0] led_data;
	
	
	wire [7:0] parallel_data_out;
	wire char_received;
   wire char_sent;
	wire trans_en, load;
	wire [7:0] parallel_data_in;
	
	parameter zero = 7'b1000000, one = 7'b1111001, two = 7'b0100100, three = 7'b0110000, four = 7'b0011001, five = 7'b0010010, 
		six = 7'b0000010, seven = 7'b1111000, eight = 7'b0000000, nine = 7'b0011000, off = 7'b1111111;
	
	 /*
    nios_system u0 (
        .clk_clk                                           (clk),                                           //                                        clk.clk
        .cpu_data_in_0_external_connection_export          (cpu_data_in_0),          //          cpu_data_in_0_external_connection.export
        .cpu_data_in_1_external_connection_export          (cpu_data_in_1),          //          cpu_data_in_1_external_connection.export
        .cpu_data_out_0_external_connection_export         (cpu_data_out_0),         //         cpu_data_out_0_external_connection.export
        .cpu_data_out_1_external_connection_export         (cpu_data_out_1),         //         cpu_data_out_1_external_connection.export
        .ready_to_transfer_in_0_external_connection_export (ready_to_transfer_in_0), // ready_to_transfer_in_0_external_connection.export
        .ready_to_transfer_in_1_external_connection_export (ready_to_transfer_in_1), // ready_to_transfer_in_1_external_connection.export
        .reset_reset_n                                     (rst),                                     //                                      reset.reset_n
        .scanner_rst_external_connection_export            (scanner_rst),            //            scanner_rst_external_connection.export
        .start_scanning_external_connection_export         (start_scanning),         //         start_scanning_external_connection.export
        .start_transfer_external_connection_export         (start_transfer),         //         start_transfer_external_connection.export
        .wr_en1_external_connection_export                 (wr_en1),                 //                 wr_en1_external_connection.export
        .wr_en2_external_connection_export                 (wr_en2),                 //                 wr_en2_external_connection.export
        .read_inc1_external_connection_export              (read_inc1),              //              read_inc1_external_connection.export
        .read_inc2_external_connection_export              (read_inc2)               //              read_inc2_external_connection.export
    );
	 */
	 
	 nios_system u0 (
        .clk_clk                                           (clk),                                           //                                        clk.clk
        .cpu_data_in_0_external_connection_export          (cpu_data_in_0),          //          cpu_data_in_0_external_connection.export
        .cpu_data_in_1_external_connection_export          (cpu_data_in_1),          //          cpu_data_in_1_external_connection.export
        .cpu_data_out_0_external_connection_export         (cpu_data_out_0),         //         cpu_data_out_0_external_connection.export
        .cpu_data_out_1_external_connection_export         (cpu_data_out_1),         //         cpu_data_out_1_external_connection.export
        .read_inc1_external_connection_export              (read_inc1),              //              read_inc1_external_connection.export
        .read_inc2_external_connection_export              (read_inc2),              //              read_inc2_external_connection.export
        .ready_to_transfer_in_0_external_connection_export (ready_to_transfer_in_0), // ready_to_transfer_in_0_external_connection.export
        .ready_to_transfer_in_1_external_connection_export (ready_to_transfer_in_1), // ready_to_transfer_in_1_external_connection.export
        .reset_reset_n                                     (rst),                                     //                                      reset.reset_n
        .scanner_rst_external_connection_export            (scanner_rst),            //            scanner_rst_external_connection.export
        .start_scanning_external_connection_export         (start_scanning),         //         start_scanning_external_connection.export
        .start_transfer_external_connection_export         (start_transfer),         //         start_transfer_external_connection.export
        .wr_en1_external_connection_export                 (wr_en1),                 //                 wr_en1_external_connection.export
        .wr_en2_external_connection_export                 (wr_en2),                 //                 wr_en2_external_connection.export
        .transmit_enable_external_connection_export        (trans_en),        //        transmit_enable_external_connection.export
        .load_external_connection_export                   (load),                   //                   load_external_connection.export
        .char_sent_external_connection_export              (char_sent),              //              char_sent_external_connection.export
        .char_received_external_connection_export          (char_received),          //          char_received_external_connection.export
        .net_data_out_external_connection_export           (parallel_data_in),           //           net_data_out_external_connection.export
        .net_data_in_external_connection_export            (parallel_data_out),            //            net_data_in_external_connection.export
        .led_data_external_connection_export               (led_data)                //               led_data_external_connection.export
    );



	 
	 top top(
				.data_out1													(data_out1),
				.data_out2													(data_out2),
				.data_out_cpu1												(cpu_data_in_0),
				.data_out_cpu2												(cpu_data_in_1),
				.state														(state),
				.state2														(state2), 
				.ready_to_transfer										(ready_to_transfer_in_0),
				.ready_to_transfer2										(ready_to_transfer_in_1),
				.data_in1													(cpu_data_out_0),
				.data_in2													(cpu_data_out_1),
				.start_scan													(start_scanning),
				.transfer_input											(start_transfer),
				.wr_en1														(wr_en1),
				.read_inc1													(read_inc1),
				.wr_en2														(wr_en2),
				.read_inc2													(read_inc2),
				.clk															(clk), 
				.rst															(scanner_rst)
	);
	
	
	serial_out ser_out (ser_data_out, char_sent, trans_en, load, parallel_data_in, clk, rst);
	serial_in ser_in (parallel_data_out, char_received, ser_data_in, clk, rst);
	
	BCD bcd_data_out1 (data_out1, hundreds1, tens1, ones1);
	BCD bcd_data_out2 (data_out2, hundreds2, tens2, ones2);
	BCD bcd_data_in1 (cpu_data_out_0, hundreds3, tens3, ones3);
	BCD bcd_data_in2 (cpu_data_out_1, hundreds4, tens4, ones4);
	
	always @(posedge clk) begin
		case (ones1)
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
			
		case (ones3)
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
		
		case (ones2)
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
		
		case (ones4)
			4'b0000: hex3 = zero;
			4'b0001: hex3 = one;
			4'b0010: hex3 = two;
			4'b0011: hex3 = three;
			4'b0100: hex3 = four;
			4'b0101: hex3 = five;
			4'b0110: hex3 = six;
			4'b0111: hex3 = seven;
			4'b1000: hex3 = eight;
			4'b1001: hex3 = nine;
			default: hex3 = 7'b1111111;
		endcase
	end

endmodule

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
            shift[11:8] = shift[11:8] + 4'd3;
            
         if (shift[15:12] >= 5)
            shift[15:12] = shift[15:12] + 4'd3;
            
         if (shift[19:16] >= 5)
            shift[19:16] = shift[19:16] + 4'd3;
         
         // Shift entire register left once
         shift = shift << 1;
      end
      
      // Push decimal numbers to output
      hundreds = shift[19:16];
      tens     = shift[15:12];
      ones     = shift[11:8];
   end
 
endmodule
