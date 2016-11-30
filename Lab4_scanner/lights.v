module lights(ready_to_transfer_in_0, ready_to_transfer_in_1, state, state2, clk, rst);
	output wire [2:0] state, state2;
	output ready_to_transfer_in_0, ready_to_transfer_in_1;
	input clk, rst;
	wire [7:0] cpu_data_in_0, cpu_data_in_1, cpu_data_out_0, cpu_data_out_1;
	wire ready_to_transfer_in_0, ready_to_transfer_in_1, start_scanning, start_transfer, scanner_rst, scanner_clk_ctrl;
	wire [7:0] data_out1, data_out2;
	
    
	 
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
        .start_transfer_external_connection_export         (start_transfer),          //         start_transfer_external_connection.export
		  .scanner_rst_external_connection_export            (scanner_rst),            //            scanner_rst_external_connection.export
        .scanner_clk_ctrl_external_connection_export       (scanner_clk_ctrl)        //       scanner_clk_ctrl_external_connection.export
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
				.clk															(scanner_clk_ctrl), 
				.rst															(scanner_rst)
	);

	 
	 
endmodule
