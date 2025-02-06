`timescale 1ns / 1ps

module fa_4bit(
    input [3:0] a,
    input [3:0] b,
    input ci,
    output [3:0] so,
    output co
    );
wire s1,s2,s3;

fa u1
(
    .ai(a[0]),
    .bi(b[0]),
    .ci(ci),
    .so(so[0]),
    .co(s1)
);

fa u2
(
    .ai(a[1]),
    .bi(b[1]),
    .ci(s1),
    .so(so[1]),
    .co(s2)
);

fa u3
(
    .ai(a[2]),
    .bi(b[2]),
    .ci(s2),
    .so(so[2]),
    .co(s3)
);

fa u4
(
    .ai(a[3]),
    .bi(b[3]),
    .ci(s3),
    .so(so[3]),
    .co(co)
);

endmodule
