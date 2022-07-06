module top_module( 
    input [2:0] a, b,
    input cin,
    output [2:0] cout,
    output [2:0] sum );
	
    
    fa ins1(a[0],b[0],cin,cout[0],sum[0]);
    fa ins2(a[1],b[1],cout[0],cout[1],sum[1]);
    fa ins3(a[2],b[2],cout[1],cout[2],sum[2]);
endmodule

module fa(input a,b,c,
          output co,s);
    assign s=a^b^c;
    assign co=a&b|b&c|c&a;
endmodule