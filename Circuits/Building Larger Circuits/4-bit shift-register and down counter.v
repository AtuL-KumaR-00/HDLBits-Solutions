module top_module (
    input clk,
    input shift_ena,
    input count_ena,
    input data,
    output [3:0] q);

    wire [3:0]w;
    assign w=q-1;
    always @(posedge clk) begin
        if(shift_ena)begin
            q[3]<=q[2];
            q[2]<=q[1];
            q[1]<=q[0];
            q[0]<=data;
        end
        else if(count_ena) begin
            q<=w;
        end
    end
endmodule
