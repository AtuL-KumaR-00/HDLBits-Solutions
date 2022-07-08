module top_module (
	input [2:0] SW,      // R
	input [1:0] KEY,     // L and clk
	output [2:0] LEDR);  // Q
    m ins1(KEY[0],KEY[1],SW[0],LEDR[2],LEDR[0]);
    m ins2(KEY[0],KEY[1],SW[1],LEDR[0],LEDR[1]);
    m ins3(KEY[0],KEY[1],SW[2],LEDR[1]^LEDR[2],LEDR[2]);
endmodule

module m (
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