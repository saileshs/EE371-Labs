module CPU_Simp(led, rst, clk);
	input rst, clk;
	output [7:0] led;
	
	cpu u0 (
        .clk_clk                            (clk),                            //                         clk.clk
        .reset_reset_n                      (rst),                      //                       reset.reset_n
        .led_pio_external_connection_export (led)  // led_pio_external_connection.export
    );
	 
	 
endmodule
