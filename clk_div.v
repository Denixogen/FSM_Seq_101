/*==============================================================
									CLOCK DIVIDER
================================================================
Description:
	This module takes high-frequency input clock (clk_in) and
	divides it down to a lower frequency. By default, it divides 
	a 50MHz input clock down to 1s clock period toggling the 
	outputs every 25,000,000 ticks.

Design Engineer:
		Mark Denzen Caro
		
Date:
	7 APR 2026
	
--------------------------------------------------------------*/
module clk_div(clkOut, clkOut2, clkIn);
    input clkIn;
    // define initial values for clock
    output reg clkOut = 1'b0;
    output reg clkOut2 = 1'b0; // 2nd output for led indicator

	// Division Factor
	 parameter integer FREQ_IN    = 50_000_000;         //  50MHz
	 parameter integer PERIOD_OUT =1;                   //  1S
    localparam integer TICKS = (FREQ_IN*PERIOD_OUT)/2;  //  Number of ticks every-
	 
	//Clock Generation
	 integer tick_cnt = 0; 

    always @(posedge clkIn) begin
        if(tick_cnt == TICKS-1) begin 
            clkOut <= ~clkOut;			//
            clkOut2 <= ~clkOut;			//
            tick_cnt <= 0;					//
        end 
        else tick_cnt <= tick_cnt + 1; // increment tick counter
    end 
endmodule