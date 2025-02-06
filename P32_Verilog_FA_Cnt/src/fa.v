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
	.s(s1),
	.c(s2)
);
ha u2
(
	.a(s1),
	.b(ci),
	.s(so),
	.c(s3)
);

assign co=s2 | s3;

endmodule
