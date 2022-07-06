module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 
    assign out = (~c&~b)| (~d&~a) | (c&d&b) | (d&a&~b);
endmodule
