module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);

    wire [2:0]cout;
    fa ins1(x[0],y[0],0,cout[0],sum[0]);
    fa ins2(x[1],y[1],cout[0],cout[1],sum[1]);
    fa ins3(x[2],y[2],cout[1],cout[2],sum[2]);
    fa ins4(x[3],y[3],cout[2],sum[4],sum[3]);
endmodule

module fa(input a,b,c,
          output co,s);
    assign s=a^b^c;
    assign co=a&b|b&c|c&a;
endmodule