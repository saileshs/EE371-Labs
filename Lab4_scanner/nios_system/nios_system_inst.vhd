	component nios_system is
		port (
			clk_clk                                           : in  std_logic                    := 'X';             -- clk
			cpu_data_in_0_external_connection_export          : in  std_logic_vector(7 downto 0) := (others => 'X'); -- export
			cpu_data_in_1_external_connection_export          : in  std_logic_vector(7 downto 0) := (others => 'X'); -- export
			cpu_data_out_0_external_connection_export         : out std_logic_vector(7 downto 0);                    -- export
			cpu_data_out_1_external_connection_export         : out std_logic_vector(7 downto 0);                    -- export
			ready_to_transfer_in_0_external_connection_export : in  std_logic                    := 'X';             -- export
			ready_to_transfer_in_1_external_connection_export : in  std_logic                    := 'X';             -- export
			reset_reset_n                                     : in  std_logic                    := 'X';             -- reset_n
			start_scanning_external_connection_export         : out std_logic_vector(7 downto 0);                    -- export
			start_transfer_external_connection_export         : out std_logic_vector(7 downto 0);                    -- export
			scanner_rst_external_connection_export            : out std_logic;                                       -- export
			scanner_clk_ctrl_external_connection_export       : out std_logic                                        -- export
		);
	end component nios_system;

	u0 : component nios_system
		port map (
			clk_clk                                           => CONNECTED_TO_clk_clk,                                           --                                        clk.clk
			cpu_data_in_0_external_connection_export          => CONNECTED_TO_cpu_data_in_0_external_connection_export,          --          cpu_data_in_0_external_connection.export
			cpu_data_in_1_external_connection_export          => CONNECTED_TO_cpu_data_in_1_external_connection_export,          --          cpu_data_in_1_external_connection.export
			cpu_data_out_0_external_connection_export         => CONNECTED_TO_cpu_data_out_0_external_connection_export,         --         cpu_data_out_0_external_connection.export
			cpu_data_out_1_external_connection_export         => CONNECTED_TO_cpu_data_out_1_external_connection_export,         --         cpu_data_out_1_external_connection.export
			ready_to_transfer_in_0_external_connection_export => CONNECTED_TO_ready_to_transfer_in_0_external_connection_export, -- ready_to_transfer_in_0_external_connection.export
			ready_to_transfer_in_1_external_connection_export => CONNECTED_TO_ready_to_transfer_in_1_external_connection_export, -- ready_to_transfer_in_1_external_connection.export
			reset_reset_n                                     => CONNECTED_TO_reset_reset_n,                                     --                                      reset.reset_n
			start_scanning_external_connection_export         => CONNECTED_TO_start_scanning_external_connection_export,         --         start_scanning_external_connection.export
			start_transfer_external_connection_export         => CONNECTED_TO_start_transfer_external_connection_export,         --         start_transfer_external_connection.export
			scanner_rst_external_connection_export            => CONNECTED_TO_scanner_rst_external_connection_export,            --            scanner_rst_external_connection.export
			scanner_clk_ctrl_external_connection_export       => CONNECTED_TO_scanner_clk_ctrl_external_connection_export        --       scanner_clk_ctrl_external_connection.export
		);

