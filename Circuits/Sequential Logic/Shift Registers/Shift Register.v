module top_module (
    input clk,
    input resetn,   // synchronous reset
    input in,
    output out);
	
    reg [2:0]q;
    always @(posedge clk) begin
        if(!resetn)	{q,out}<=0;
        else begin
            {q,out} <= {in,q};
        end
    end
endmodule
