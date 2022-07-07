module top_module (
    input clk,
    input d,
    output q
);
    reg r1,r2;
    always @(posedge clk)
        r1<=d;
    always @(negedge clk)
        r2<=d;
    always @(clk) begin
		if(clk)
			q = r1;
		else
			q = r2;
	 end 
endmodule
