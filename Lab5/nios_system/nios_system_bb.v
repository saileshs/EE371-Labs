
module nios_system (
	char_received_external_connection_export,
	char_sent_external_connection_export,
	clk_clk,
	cpu_data_in_0_external_connection_export,
	cpu_data_in_1_external_connection_export,
	cpu_data_out_0_external_connection_export,
	cpu_data_out_1_external_connection_export,
	led_data_external_connection_export,
	load_external_connection_export,
	net_data_in_external_connection_export,
	net_data_out_external_connection_export,
	read_inc1_external_connection_export,
	read_inc2_external_connection_export,
	ready_to_transfer_in_0_external_connection_export,
	ready_to_transfer_in_1_external_connection_export,
	reset_reset_n,
	scanner_rst_external_connection_export,
	start_scanning_external_connection_export,
	start_transfer_external_connection_export,
	transmit_enable_external_connection_export,
	wr_en1_external_connection_export,
	wr_en2_external_connection_export,
	start_scan_receive_external_connection_export,
	start_scan_send_external_connection_export,
	ready_transfer_send_external_connection_export,
	ready_transfer_receive_external_connection_export,
	transfer_receive_external_connection_export,
	transfer_send_external_connection_export);	

	input		char_received_external_connection_export;
	input		char_sent_external_connection_export;
	input		clk_clk;
	input	[7:0]	cpu_data_in_0_external_connection_export;
	input	[7:0]	cpu_data_in_1_external_connection_export;
	output	[7:0]	cpu_data_out_0_external_connection_export;
	output	[7:0]	cpu_data_out_1_external_connection_export;
	output	[7:0]	led_data_external_connection_export;
	output		load_external_connection_export;
	input	[7:0]	net_data_in_external_connection_export;
	output	[7:0]	net_data_out_external_connection_export;
	output		read_inc1_external_connection_export;
	output		read_inc2_external_connection_export;
	input		ready_to_transfer_in_0_external_connection_export;
	input		ready_to_transfer_in_1_external_connection_export;
	input		reset_reset_n;
	output		scanner_rst_external_connection_export;
	output	[7:0]	start_scanning_external_connection_export;
	output	[7:0]	start_transfer_external_connection_export;
	output		transmit_enable_external_connection_export;
	output		wr_en1_external_connection_export;
	output		wr_en2_external_connection_export;
	input		start_scan_receive_external_connection_export;
	output		start_scan_send_external_connection_export;
	output		ready_transfer_send_external_connection_export;
	input		ready_transfer_receive_external_connection_export;
	input		transfer_receive_external_connection_export;
	output		transfer_send_external_connection_export;
endmodule
