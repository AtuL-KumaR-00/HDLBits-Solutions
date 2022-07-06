module top_module( 
    input a, b, cin,
    output cout, sum );
	assign sum=a^b^c;
    assign cout = a&b | b&cin | cin&a;
endmodule
