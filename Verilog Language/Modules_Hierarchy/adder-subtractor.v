module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire [31:0]w1;
    wire x,c;
    assign w1 = {32{sub}} ^ b;
    add16 ins1(a[15:0],w1[15:0],sub,sum[15:0],c);
    add16 ins2(a[31:16],w1[31:16],c,sum[31:16],x);

endmodule