module top_module (
    input clk,
    input [7:0] in,
    output [7:0] anyedge
);
    reg [7:0]temp1,temp2;
    always @(posedge clk)	begin
        temp1<=in;
        temp2<=temp1;
    end
    assign anyedge = temp1 ^ temp2;
endmodule
