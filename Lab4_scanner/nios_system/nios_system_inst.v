	nios_system u0 (
		.clk_clk                                           (<connected-to-clk_clk>),                                           //                                        clk.clk
		.cpu_data_in_0_external_connection_export          (<connected-to-cpu_data_in_0_external_connection_export>),          //          cpu_data_in_0_external_connection.export
		.cpu_data_in_1_external_connection_export          (<connected-to-cpu_data_in_1_external_connection_export>),          //          cpu_data_in_1_external_connection.export
		.cpu_data_out_0_external_connection_export         (<connected-to-cpu_data_out_0_external_connection_export>),         //         cpu_data_out_0_external_connection.export
		.cpu_data_out_1_external_connection_export         (<connected-to-cpu_data_out_1_external_connection_export>),         //         cpu_data_out_1_external_connection.export
		.ready_to_transfer_in_0_external_connection_export (<connected-to-ready_to_transfer_in_0_external_connection_export>), // ready_to_transfer_in_0_external_connection.export
		.ready_to_transfer_in_1_external_connection_export (<connected-to-ready_to_transfer_in_1_external_connection_export>), // ready_to_transfer_in_1_external_connection.export
		.reset_reset_n                                     (<connected-to-reset_reset_n>),                                     //                                      reset.reset_n
		.start_scanning_external_connection_export         (<connected-to-start_scanning_external_connection_export>),         //         start_scanning_external_connection.export
		.start_transfer_external_connection_export         (<connected-to-start_transfer_external_connection_export>)          //         start_transfer_external_connection.export
	);

