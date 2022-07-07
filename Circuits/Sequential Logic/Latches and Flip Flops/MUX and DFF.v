module top_module (
	input clk,
	input L,
	input r_in,
	input q_in,
	output reg Q);
    always @(posedge clk) begin
        if(L) begin
            Q<=r_in;
        end
        else Q<=q_in;
    end
endmodule
