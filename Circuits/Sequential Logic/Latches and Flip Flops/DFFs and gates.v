module top_module (
    input clk,
    input x,
    output z
); 
    reg [2:0]w;
    //w[0]=0;
    //w[1]=0;
    //w[2]=0;
    always @(posedge clk) begin
        w[0]<=x^w[0];
        w[1] <= x & ~w[1];
        w[2] <= x | ~w[2];
        
    end
    assign z = ~(w[0]|w[1]|w[2]);
endmodule
