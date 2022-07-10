module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input [3:1] r,   // request
    output [3:1] g   // grant
); 
	parameter A=0,B=1,C=2,D=3;
    reg [2:0] state,next;
    always @(*) begin
        case(state)
            A: begin
                casex(r)
                    3'bxx1:next=B;
                    3'bx10:next=C;
                    3'b100:next=D;
                    default: next=A;
                endcase
            end
            B: next = r[1] ? B:A;
            C: next = r[2] ? C:A;
            D: next = r[3] ? D:A;
        endcase
    end
    
    always @(posedge clk)
        begin
            if(!resetn) state<=A;
            else state<=next;
        end
    
    assign g = {state==D,state==C,state==B}; 
    
endmodule
