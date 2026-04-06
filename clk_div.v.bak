module clk_div(clkOut, clkOut2, clkIn);
    input clkIn;
    // define initial values for clock
    output reg clkOut = 1'b0;
    output reg clkOut2 = 1'b0; // 2nd output for led indicator

    // cpld clock speed is 50Mhz
    parameter integer ticksAtHalfSec = 25_000_000;
    reg[24:0] tickCount = 25'b0; // log base 2 (25,000,000) = 24.58 or 25 

    always @(posedge clkIn) begin
        // if tick count has reached half of the clock input ticks
        if(tickCount == (ticksAtHalfSec - 1)) begin 
            clkOut <= ~clkOut;
            clkOut2 <= ~clkOut;

            tickCount <= 25'b0; // clear tick count
        end 
        else tickCount <= tickCount + 1; // increment by one
    end // always end
endmodule