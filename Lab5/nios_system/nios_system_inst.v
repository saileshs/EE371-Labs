	nios_system u0 (
		.clk_clk                                           (<connected-to-clk_clk>),                                           //                                        clk.clk
		.cpu_data_in_0_external_connection_export          (<connected-to-cpu_data_in_0_external_connection_export>),          //          cpu_data_in_0_external_connection.export
		.cpu_data_in_1_external_connection_export          (<connected-to-cpu_data_in_1_external_connection_export>),          //          cpu_data_in_1_external_connection.export
		.cpu_data_out_0_external_connection_export         (<connected-to-cpu_data_out_0_external_connection_export>),         //         cpu_data_out_0_external_connection.export
		.cpu_data_out_1_external_connection_export         (<connected-to-cpu_data_out_1_external_connection_export>),         //         cpu_data_out_1_external_connection.export
		.ready_to_transfer_in_0_external_connection_export (<connected-to-ready_to_transfer_in_0_external_connection_export>), // ready_to_transfer_in_0_external_connection.export
		.ready_to_transfer_in_1_external_connection_export (<connected-to-ready_to_transfer_in_1_external_connection_export>), // ready_to_transfer_in_1_external_connection.export
		.reset_reset_n                                     (<connected-to-reset_reset_n>),                                     //                                      reset.reset_n
		.scanner_rst_external_connection_export            (<connected-to-scanner_rst_external_connection_export>),            //            scanner_rst_external_connection.export
		.start_scanning_external_connection_export         (<connected-to-start_scanning_external_connection_export>),         //         start_scanning_external_connection.export
		.start_transfer_external_connection_export         (<connected-to-start_transfer_external_connection_export>),         //         start_transfer_external_connection.export
		.wr_en1_external_connection_export                 (<connected-to-wr_en1_external_connection_export>),                 //                 wr_en1_external_connection.export
		.wr_en2_external_connection_export                 (<connected-to-wr_en2_external_connection_export>),                 //                 wr_en2_external_connection.export
		.read_inc1_external_connection_export              (<connected-to-read_inc1_external_connection_export>),              //              read_inc1_external_connection.export
		.read_inc2_external_connection_export              (<connected-to-read_inc2_external_connection_export>)               //              read_inc2_external_connection.export
	);

