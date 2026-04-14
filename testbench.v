// testbench for seq_101
module testbench;
 // tb signals
 reg in;
 reg clk;
 reg rst_n;
 wire out;
 wire [1:0] state; 
 
 // instantiate seq_101
 seq_101 dut (
	.out	(out),
	.state  (state),
	.in	(in),
	.clk	(clk),
	.rst_n(rst_n)
 );
 
 // apply stimuli
 initial clk = 0;
 always #1 clk = ~clk;
 
 initial begin
	rst_n = 0;
	repeat(3) @(negedge clk);
	rst_n = 1;
	
	in=1; @(negedge clk); 
	in=0; @(negedge clk);
	in=1; @(negedge clk);
	in=0; @(negedge clk);
	in=1; @(negedge clk);
	in=1; @(negedge clk);
	in=0; @(negedge clk);
	in=0; @(negedge clk);



	
	
 end
endmodule