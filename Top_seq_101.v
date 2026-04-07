// top-level design for sequence 101

module top_seq_101(clkOut,state,clkOut2,in,clkIn,rst_n);
	//ports
 input 			in;
 input 			clkIn;
 input 			rst_n;
 output 			clkOut;
 output [1:0] 	state;
 output 			clkOut2; 
 
 // nets
 wire clk_w;
 
 // clock divider instance
  clk_div #(.PERIOD_OUT(3)) clk_div_inst(
  .clkOut  (clk_w), 
  .clkOut2 (clkOut2), 
  .clkIn   (clkIn)
  );
 
 // seq_101 instance
 seq_101 seq_101_inst(
	.out (out),
	.state (state),
	.in (in),
	.clk(clk_w),
	.rst_n(rst_n)
	);
	
	
	
	
	
endmodule