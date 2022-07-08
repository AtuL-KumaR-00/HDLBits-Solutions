module top_module (
    input clk,
    input slowena,
    input reset,
    output [3:0] q);
    always @(posedge clk) begin
        if(reset)	q<=0;
        else begin
            if(q<9) begin
            	if(slowena==1)
                    q<=q+1;
                else q<=q;
            end
            else 
                if(slowena==1) q<=0;
        end
    end
                
endmodule
