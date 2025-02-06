`timescale 1ns / 1ps

module spi_master(
    input 				clk,
    input 				MISO,
    output 				MOSI,
    output reg			SCK,
    output reg			SS,
    input 		[7:0] din,
    input 				en,
    output reg			busy,
    output reg	[7:0] dout,
    output reg			valid
    );

localparam idle=3'h0;
localparam start=3'h1;
localparam data1=3'h2;
localparam data2=3'h3;
localparam end_state=3'h4;

reg [2:0] state;
reg [2:0] i;
reg [5:0] cnt_1us;
reg [7:0] buf_in;
reg [7:0] buf_out;

initial begin
	state=0;
end

always @ (posedge clk) begin
	valid<=0;
	case (state)
		idle:begin
			SS<=1;
			SCK<=0;
			busy<=0;
			if(en==1)begin
				state<=1;
				buf_in<=din;
				cnt_1us<=0;
				busy<=1;
			end
		end
		
		start:begin
			SS<=0;
			SCK<=0;
			cnt_1us<=cnt_1us+1;
			if(cnt_1us==49)begin
				cnt_1us<=0;
				i<=0;
				state<=data1;
			end
		end
		
		data1:begin
			SS<=0;
			SCK<=1;
			if(cnt_1us==1)begin
				buf_out<={buf_out[6:0],MISO};
			end
			cnt_1us<=cnt_1us+1;
			if(cnt_1us==49)begin
				cnt_1us<=0;
				buf_in<={buf_in[6:0],1'b0};
				state<=data2;
				i<=i+1;
				if(i==7)state<=end_state;
			end
		end
		
		data2:begin
			SS<=0;
			SCK<=0;
			cnt_1us<=cnt_1us+1;
			if(cnt_1us==49)begin
				cnt_1us<=0;
				state<=data1;
			end
		end
		
		end_state:begin
			SS<=1;
			SCK<=0;
			dout<=buf_out;
			valid<=1;
			state<=idle;
		end
		
	endcase
end

assign MOSI=buf_in[7];

endmodule
