module top_module (
    input [7:0] a,
    input [7:0] b,
    output [7:0] s,
    output overflow
); //   If both numbers are +ve and result is-ve or vise versa, overflow occurs
    assign s = a+b;
    assign overflow = a[7]&&b[7]&&(~s[7]) || (~a[7])&&(~b[7])&&(s[7]);

endmodule
