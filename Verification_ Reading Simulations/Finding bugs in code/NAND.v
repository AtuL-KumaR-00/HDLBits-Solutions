module top_module (input a, input b, input c, output out);//

    wire w;
    andgate inst1 (w,a,b,c,1,1 );
	assign out = ~w;
    
endmodule
