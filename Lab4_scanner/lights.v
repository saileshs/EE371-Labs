module lights(leds, sw, clk, rst);
	output [7:0] leds;
	input [7:0] sw;
	input clk, rst;
	wire [7:0] cpu_data_in_0, cpu_data_in_1, cpu_data_out_0, cpu_data_out_1;
	wire ready_to_transfer_in_0, ready_to_transfer_in_1, start_scanning, start_transfer;

    nios_system u0 (
        .clk_clk                                           (clk),                                           //                                        clk.clk
        .cpu_data_in_0_external_connection_export          (cpu_data_in_0),          //          cpu_data_in_0_external_connection.export
        .cpu_data_in_1_external_connection_export          (cpu_data_in_1),          //          cpu_data_in_1_external_connection.export
        .cpu_data_out_0_external_connection_export         (cpu_data_out_0),         //         cpu_data_out_0_external_connection.export
        .cpu_data_out_1_external_connection_export         (cpu_data_out_1),         //         cpu_data_out_1_external_connection.export
        .ready_to_transfer_in_0_external_connection_export (ready_to_transfer_in_0), // ready_to_transfer_in_0_external_connection.export
        .ready_to_transfer_in_1_external_connection_export (ready_to_transfer_in_1), // ready_to_transfer_in_1_external_connection.export
        .reset_reset_n                                     (rst),                                     //                                      reset.reset_n
        .start_scanning_external_connection_export         (start_scanning),         //         start_scanning_external_connection.export
        .start_transfer_external_connection_export         (start_transfer)          //         start_transfer_external_connection.export
    );

	 
	 
endmodule
