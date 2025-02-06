`timescale 1ns / 1ps



module fa_4bit_tf;

	// Inputs
	reg [3:0] a;
	reg [3:0] b;
	reg ci;

	// Outputs
	wire [3:0] so;
	wire co;

	// Instantiate the Unit Under Test (UUT)
	fa_4bit uut (
		.a(a), 
		.b(b), 
		.ci(ci), 
		.so(so), 
		.co(co)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;
		ci = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		a=2;
		b=5;
		#30;
		
		a=20;
		b=3;
		#30;

	end
      
endmodule

