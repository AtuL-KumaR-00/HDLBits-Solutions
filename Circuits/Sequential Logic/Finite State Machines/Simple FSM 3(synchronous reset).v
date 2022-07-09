module top_module(
    input clk,
    input in,
    input reset,
    output out); //

    parameter A=0,B=1,C=2,D=3;
    reg [1:0] state,next_st;
    // State transition logic
    always @(*) begin
        case (state)
            A: next_st= in?B:A;
            B: next_st= in?B:C;
            C: next_st= in?D:A;
            D: next_st= in?B:C;
        endcase
    end

    // State flip-flops with synchronous reset
	always @(posedge clk ) begin
        if(reset)
            state<=A;
        else state<=next_st;
    end

    // Output logic
    assign out = (state==D);

endmodule
