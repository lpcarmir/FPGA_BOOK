`timescale 1ns / 1ps



module fa_cnt_tf;

	// Inputs
	reg clk;

	// Outputs
	wire led;

	// Instantiate the Unit Under Test (UUT)
	fa_cnt uut (
		.clk(clk), 
		.led(led)
	);

	initial begin
		// Initialize Inputs
		clk = 0;

		//forever #10 clk=~clk;

	end
	
	always begin
		clk<=0;
		#10;
		clk<=1;
		#10;
	end
      
endmodule

