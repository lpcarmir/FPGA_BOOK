`timescale 1ns / 1ps

module fa_cnt(
    input clk,
    output led
    );

fa_8bit u1(
    .a(s2),
    .b(1),
    .c(0),
    .s(s1),
    .co()
    );
initial begin
	s2=8'h00;
	s3=1'b0;
end

wire [7:0] s1;
reg [7:0] s2;
reg s3;
always @ (posedge clk)begin
	s2<=s1;
	if(s2==99)begin
		s2<=0;
		s3<=~s3;
	end
end
assign led=s3;
endmodule
