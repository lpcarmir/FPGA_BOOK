`timescale 1ns / 1ps

module counter(
    output led,
    input clk
    );
reg [25:0] cnt;
reg sled;

initial begin
	sled=0;
	cnt=0;
end

always @ (posedge clk) begin
	cnt<=cnt+1;
	if(cnt==50000000)begin
		cnt<=0;
		sled<=~ sled;
	end
end
assign led=sled;
endmodule
