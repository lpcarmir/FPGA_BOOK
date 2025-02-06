`timescale 1ns / 1ps

module uart_tx(
    input clk,
    input [7:0] data,
    input en,
    output tx,
    output busy
    );
localparam idle = 0;
localparam start = 1;
localparam dat = 2;
localparam stop = 3;
reg [1:0] state;
reg [7:0] temp;
reg [12:0] cnt;//5208
reg [2:0] i;
reg stx;
reg flag;
reg sbusy;
initial begin
	state=idle;
end
always @ (posedge clk)begin
	case (state)
		idle: begin
			stx<=1;
			if(en==1)begin
				sbusy<=1;
				temp<=data;
				state<=start;
				cnt<=0;
			end
		end
		start: begin
			stx<=0;
			cnt<=cnt+1;
			if(cnt==5207)begin
				state<=dat;
				cnt<=0;
				i<=0;
			end
		end
		dat: begin
			cnt<=cnt+1;
			stx<=temp[0];
			if(cnt==5207)begin
				i<=i+1;
				cnt<=0;
				temp<={0,temp[7:1]};
				
				if(i==7)begin
					i<=0;
					state<=stop;
					flag<=0;
				end
			end
		end
		stop: begin
			stx<=1;
			if(flag==0)sbusy<=0;
			if(en==1)begin
				flag<=1;
				temp<=data;
				sbusy<=1;
			end
			cnt<=cnt+1;
			if(cnt==5207)begin
				cnt<=0;
				if(flag==0) state<=idle;
				else        state<=start;
			end
		end
	endcase
end
assign tx=stx;
assign busy=sbusy;
endmodule
