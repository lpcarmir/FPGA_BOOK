`timescale 1ns / 1ps

module uart_t_tf;

	// Inputs
	reg clk;
	reg [7:0] data;
	reg en;

	// Outputs
	wire tx;
	wire busy;

	// Instantiate the Unit Under Test (UUT)
	uart_t uut (
		.clk(clk), 
		.data(data), 
		.en(en), 
		.tx(tx), 
		.busy(busy)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		data = 0;
		en = 0;

		// Wait 100 ns for global reset to finish
		#100; 
		// Add stimulus here
	end
	
	always begin
		clk=#10 ~clk;
	end
	
	always begin
		data<=126;
		en<=1;
		#40;
		en<=0;
		
		forever #10;
	end
      
endmodule

