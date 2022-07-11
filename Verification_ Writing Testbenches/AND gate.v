module top_module();
	reg A, B;
    wire out;
    andgate ins({A,B},out);
                
    initial begin
        A=0;
        B=0;
        #10;
        B=1;
        #10;
        B=0;
        A=1;
        #10;
        B=1;
    end
endmodule
