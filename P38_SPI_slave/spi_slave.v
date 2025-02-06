`timescale 1ns / 1ps

module spi_slave(
    output 			miso,
    input 			mosi,
    input 			sck,
    input 			ss,
    input 	[7:0] din,
    input 			en,
    output reg	[7:0] dout,
    output reg		valid,
    output reg		busy,
    input 			clk
    );

`define idle 1'b0
`define wait_select 1'b1
`define data1 2'b10
`define data2 2'b11
`define end_state 3'b100

reg [2:0] state;
reg [7:0] buf_in;
reg [7:0] buf_out;
reg [3:0] i;
reg clk1,clk2,clk3,last_clk;
wire sclk;

initial begin
	state=0;
end

assign sclk=clk1 & clk2 & clk3;

always @ (posedge clk)begin
	valid<=0;
	
	clk1<=sck;
	clk2<=clk1;
	clk3<=clk2;
	
	last_clk<=sclk;
	
	case (state)
		`idle:begin
			if(en==1)begin
				state<=`wait_select;
				busy<=1;
				buf_in<=din;
			end
		end
		
		`wait_select:begin
			if(ss==0)begin
				state<=`data1;
				i<=0;
			end
		end
		
		`data1:begin
			if(last_clk==0 && sclk==1)begin
				buf_out<={buf_out[6:0],mosi};
				state<=`data2;
			end
		end
		
		`data2:begin
			if(last_clk==1 && sclk==0)begin
				buf_in<={buf_in[6:0],1'b0};
				state<=`data1;
				i<=i+1;
				if(i==7)state<=`end_state;
			end
		end
		
		`end_state:begin
			dout<=buf_out;
			valid<=1;
			state<=`idle;
		end
		
	endcase
end

assign miso=buf_in[7];

endmodule
