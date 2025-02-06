`timescale 1ns / 1ps

module fa_8bit(
    input [7:0] a,
    input [7:0] b,
    input c,
    output [7:0] s,
    output co
    );
wire s1;
fa_4bit u1(
    .a(a[3:0]),
    .b(b[3:0]),
    .ci(c),
    .so(s[3:0]),
    .co(s1)
    );
fa_4bit u2(
    .a(a[7:4]),
    .b(b[7:4]),
    .ci(s1),
    .so(s[7:4]),
    .co(co)
    );
endmodule
