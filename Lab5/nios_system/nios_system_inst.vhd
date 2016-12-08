	component nios_system is
		port (
			char_received_external_connection_export          : in  std_logic                    := 'X';             -- export
			char_sent_external_connection_export              : in  std_logic                    := 'X';             -- export
			clk_clk                                           : in  std_logic                    := 'X';             -- clk
			cpu_data_in_0_external_connection_export          : in  std_logic_vector(7 downto 0) := (others => 'X'); -- export
			cpu_data_in_1_external_connection_export          : in  std_logic_vector(7 downto 0) := (others => 'X'); -- export
			cpu_data_out_0_external_connection_export         : out std_logic_vector(7 downto 0);                    -- export
			cpu_data_out_1_external_connection_export         : out std_logic_vector(7 downto 0);                    -- export
			led_data_external_connection_export               : out std_logic_vector(7 downto 0);                    -- export
			load_external_connection_export                   : out std_logic;                                       -- export
			net_data_in_external_connection_export            : in  std_logic_vector(7 downto 0) := (others => 'X'); -- export
			net_data_out_external_connection_export           : out std_logic_vector(7 downto 0);                    -- export
			read_inc1_external_connection_export              : out std_logic;                                       -- export
			read_inc2_external_connection_export              : out std_logic;                                       -- export
			ready_to_transfer_in_0_external_connection_export : in  std_logic                    := 'X';             -- export
			ready_to_transfer_in_1_external_connection_export : in  std_logic                    := 'X';             -- export
			reset_reset_n                                     : in  std_logic                    := 'X';             -- reset_n
			scanner_rst_external_connection_export            : out std_logic;                                       -- export
			start_scanning_external_connection_export         : out std_logic_vector(7 downto 0);                    -- export
			start_transfer_external_connection_export         : out std_logic_vector(7 downto 0);                    -- export
			transmit_enable_external_connection_export        : out std_logic;                                       -- export
			wr_en1_external_connection_export                 : out std_logic;                                       -- export
			wr_en2_external_connection_export                 : out std_logic;                                       -- export
			start_scan_receive_external_connection_export     : in  std_logic                    := 'X';             -- export
			start_scan_send_external_connection_export        : out std_logic;                                       -- export
			ready_transfer_send_external_connection_export    : out std_logic;                                       -- export
			ready_transfer_receive_external_connection_export : in  std_logic                    := 'X';             -- export
			transfer_receive_external_connection_export       : in  std_logic                    := 'X';             -- export
			transfer_send_external_connection_export          : out std_logic                                        -- export
		);
	end component nios_system;

	u0 : component nios_system
		port map (
			char_received_external_connection_export          => CONNECTED_TO_char_received_external_connection_export,          --          char_received_external_connection.export
			char_sent_external_connection_export              => CONNECTED_TO_char_sent_external_connection_export,              --              char_sent_external_connection.export
			clk_clk                                           => CONNECTED_TO_clk_clk,                                           --                                        clk.clk
			cpu_data_in_0_external_connection_export          => CONNECTED_TO_cpu_data_in_0_external_connection_export,          --          cpu_data_in_0_external_connection.export
			cpu_data_in_1_external_connection_export          => CONNECTED_TO_cpu_data_in_1_external_connection_export,          --          cpu_data_in_1_external_connection.export
			cpu_data_out_0_external_connection_export         => CONNECTED_TO_cpu_data_out_0_external_connection_export,         --         cpu_data_out_0_external_connection.export
			cpu_data_out_1_external_connection_export         => CONNECTED_TO_cpu_data_out_1_external_connection_export,         --         cpu_data_out_1_external_connection.export
			led_data_external_connection_export               => CONNECTED_TO_led_data_external_connection_export,               --               led_data_external_connection.export
			load_external_connection_export                   => CONNECTED_TO_load_external_connection_export,                   --                   load_external_connection.export
			net_data_in_external_connection_export            => CONNECTED_TO_net_data_in_external_connection_export,            --            net_data_in_external_connection.export
			net_data_out_external_connection_export           => CONNECTED_TO_net_data_out_external_connection_export,           --           net_data_out_external_connection.export
			read_inc1_external_connection_export              => CONNECTED_TO_read_inc1_external_connection_export,              --              read_inc1_external_connection.export
			read_inc2_external_connection_export              => CONNECTED_TO_read_inc2_external_connection_export,              --              read_inc2_external_connection.export
			ready_to_transfer_in_0_external_connection_export => CONNECTED_TO_ready_to_transfer_in_0_external_connection_export, -- ready_to_transfer_in_0_external_connection.export
			ready_to_transfer_in_1_external_connection_export => CONNECTED_TO_ready_to_transfer_in_1_external_connection_export, -- ready_to_transfer_in_1_external_connection.export
			reset_reset_n                                     => CONNECTED_TO_reset_reset_n,                                     --                                      reset.reset_n
			scanner_rst_external_connection_export            => CONNECTED_TO_scanner_rst_external_connection_export,            --            scanner_rst_external_connection.export
			start_scanning_external_connection_export         => CONNECTED_TO_start_scanning_external_connection_export,         --         start_scanning_external_connection.export
			start_transfer_external_connection_export         => CONNECTED_TO_start_transfer_external_connection_export,         --         start_transfer_external_connection.export
			transmit_enable_external_connection_export        => CONNECTED_TO_transmit_enable_external_connection_export,        --        transmit_enable_external_connection.export
			wr_en1_external_connection_export                 => CONNECTED_TO_wr_en1_external_connection_export,                 --                 wr_en1_external_connection.export
			wr_en2_external_connection_export                 => CONNECTED_TO_wr_en2_external_connection_export,                 --                 wr_en2_external_connection.export
			start_scan_receive_external_connection_export     => CONNECTED_TO_start_scan_receive_external_connection_export,     --     start_scan_receive_external_connection.export
			start_scan_send_external_connection_export        => CONNECTED_TO_start_scan_send_external_connection_export,        --        start_scan_send_external_connection.export
			ready_transfer_send_external_connection_export    => CONNECTED_TO_ready_transfer_send_external_connection_export,    --    ready_transfer_send_external_connection.export
			ready_transfer_receive_external_connection_export => CONNECTED_TO_ready_transfer_receive_external_connection_export, -- ready_transfer_receive_external_connection.export
			transfer_receive_external_connection_export       => CONNECTED_TO_transfer_receive_external_connection_export,       --       transfer_receive_external_connection.export
			transfer_send_external_connection_export          => CONNECTED_TO_transfer_send_external_connection_export           --          transfer_send_external_connection.export
		);

