module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);

    always @(*) begin
        ena[1] <= {q[3:0]==4'd9};
        ena[2] <= {q[7:4]==4'd9 && q[3:0] == 4'd9};
        ena[3] <= {q[11:8]==4'd9 && q[7:4] == 4'd9 && q[3:0] == 4'd9};
    end
    
    always @(posedge clk ) begin
        if(reset) begin
            q[15:0] <= 15'd0;
        end
        else begin
            if(q[3:0]<9) q[3:0]<=q[3:0]+1;
            else q[3:0]<=0;
            if(ena[1]) begin
                if(q[7:4]<9) q[7:4]<=q[7:4]+1;
                else q[7:0] <= 0;
            end
            if(ena[2]) begin
                if(q[11:8]<9) q[11:8]<=q[11:8]+1;
                else q[11:8] <= 0;
            end
            if(ena[3]) begin
                if(q[15:12]<9) q[15:12]<=q[15:12]+1;
                else q[15:12] <= 0;
            end
        end
    end
endmodule
