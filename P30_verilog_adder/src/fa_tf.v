`timescale 1ns / 1ps

module fa_tf;

	// Inputs
	reg ai;
	reg bi;
	reg ci;

	// Outputs
	wire so;
	wire co;

	// Instantiate the Unit Under Test (UUT)
	fa uut (
		.ai(ai), 
		.bi(bi), 
		.ci(ci), 
		.so(so), 
		.co(co)
	);

	initial begin
		// Initialize Inputs
		ai = 0;
		bi = 0;
		ci = 0;

		// Wait 100 ns for global reset to finish
		#100;
	end
	
	always begin
		ai<=1'b0;
		bi<=1'b1;
		ci<=1;
		#20;
		
		ai<=1'h1;
		bi<=1'h1;
		ci<=1;
		forever #20;
	end
      
endmodule

