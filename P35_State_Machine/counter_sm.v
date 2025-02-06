`timescale 1ns / 1ps

module counter(
    input clk,
    output led
    );
reg [22:0] cnt;
reg sled;
reg [1:0] state;
reg [25:0] state_cnt;

`define s0 0
//localparam s0=0;
localparam s1=0;
localparam s2=0;


initial begin
	sled=0;
	cnt=0;
	state=0;
	state_cnt=0;
end

always @ (posedge clk) begin
	cnt<=cnt+1;
	case (state)
		`s0:begin
			if(cnt==1249999)begin
				cnt<=0;
				sled<=~sled;
			end
		end
		s1:begin
			if(cnt==2499999)begin
				cnt<=0;
				sled<=~sled;
			end
		end
		s2:begin
			if(cnt==4999999)begin
				cnt<=0;
				sled<=~sled;
			end
		end
	endcase
end

always @ (posedge clk) begin
	state_cnt<=state_cnt+1;
	if(state_cnt==49999999)begin
		state_cnt<=0;
		state<=state+1;
		if(state==2)state<=0;
	end
end
assign led=sled;
endmodule
