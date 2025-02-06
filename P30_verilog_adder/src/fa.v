`timescale 1ns / 1ps

module fa(
    input ai,
    input bi,
    input ci,
    output so,
    output co
    );
wire s1,s2,s3;

ha u1
(
	.a(ai),
	.b(bi),
	.c(s2),
	.s(s1)
);

ha u2
(
	.a(s1),
	.b(ci),
	.c(s3),
	.s(so)
);

assign co=s2 | s3;

endmodule
