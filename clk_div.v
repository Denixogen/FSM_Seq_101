module clk_div(clkOut, clkOut2, clkIn);
    input clkIn;
    // define initial values for clock
    output reg clkOut = 1'b0;
    output reg clkOut2 = 1'b0; // 2nd output for led indicator

    // cpld clock speed is 50Mhz
    parameter integer ticksAt3Sec = 150_000_000;
    reg[27:0] tickCount = 28'b0; // log base 2 (149,999,999)

    always @(posedge clkIn) begin
        // if tick count has reached half of the clock input ticks
        if(tickCount == (ticksAt3Sec - 1)) begin 
            clkOut <= ~clkOut;
            clkOut2 <= ~clkOut;

            tickCount <= 28'b0; // clear tick count
        end 
        else tickCount <= tickCount + 1; // increment by one
    end // always end
endmodule