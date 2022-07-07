module top_module (
    input clk,
    input [7:0] in,
    output [7:0] pedge
);
    reg [7:0] temp1, temp2;
	 always @(posedge clk) begin
		temp1 <= in;
		temp2 <= temp1;
	 end
	 assign pedge = ~temp2 & temp1;

endmodule
