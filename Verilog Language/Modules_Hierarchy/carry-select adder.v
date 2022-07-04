module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire sel,x;
    wire [15:0]w1,w2;
    //wire [15:0]w2;
    add16 ins1(a[15:0],b[15:0],0,sum[15:0],sel);
    add16 ins2(a[31:16],b[31:16],0,w1,x);
    add16 ins3(a[31:16],b[31:16],1,w2,x);
    
    always @(*)	begin
        case(sel)
            1'b0:sum[31:16]=w1;
            1'b1: sum[31:16] = w2;
        endcase
    end
endmodule
