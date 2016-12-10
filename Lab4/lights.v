module lights(leds, sw, clk, rst);
	output [7:0] leds;
	input [7:0] sw;
	input clk, rst;


    nios_system u0 (
        .clk_clk         (clk),         //      clk.clk
        .reset_reset_n   (rst),   //    reset.reset_n
        .switches_export (sw), // switches.export
        .leds_export     (leds)      //     leds.export
    );
	 
	 
endmodule
