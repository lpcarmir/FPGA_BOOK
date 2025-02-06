`timescale 1ns / 1ps


module spi_master_tf;

	// Inputs
	reg clk;
	wire MISO;
	reg [7:0] din;
	reg en;

	// Outputs
	wire MOSI;
	wire SCK;
	wire SS;
	wire busy;
	wire [7:0] dout;
	reg [7:0] sdin;
	wire [7:0] sdout;
	wire valid;
	wire svalid;
	reg sen;

	// Instantiate the Unit Under Test (UUT)
	spi_master uut (
		.clk(clk), 
		.MISO(MISO), 
		.MOSI(MOSI), 
		.SCK(SCK), 
		.SS(SS), 
		.din(din), 
		.en(en), 
		.busy(busy), 
		.dout(dout), 
		.valid(valid)
	);
	
	spi_slave u1
	(
		.miso(MISO),
		.mosi(MOSI),
		.sck(SCK),
	   .ss(SS),
	   .din(sdin),
	   .en(sen),
	   .dout(sdout),
	   .valid(svalid),
	   .busy(),
	   .clk(clk)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		din = 0;
		en = 0;

		forever #10 clk=~clk;

	end
   
		always begin
			sdin<=8'b10101010;
			#20;
			sen<=1;
			#20;
			sen<=0;
			din<=8'b01010101;
			
			en<=1'b1;
			#20;
			en<=1'b0;
			
			forever #20;
		end
		
endmodule

