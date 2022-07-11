module top_module (
    input clk,
    input reset,      // Synchronous reset
    output shift_ena);

    reg [2:0] count;
    always@(posedge clk)begin
        if(reset) begin
            shift_ena <= 1;
            count <= 0; end
        else if(count<3) begin
            count = count+1;
                shift_ena <=1; end
        else shift_ena <= 0;
    end
endmodule
