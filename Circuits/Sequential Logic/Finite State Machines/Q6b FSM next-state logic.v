module top_module (
    input [3:1] y,
    input w,
    output Y2);

    always @(*) begin
        case(y) 
            3'b000,3'b011 : Y2=0;
            3'b001,3'b101 : Y2=1;
            default: Y2=w;
        endcase
    end
endmodule
