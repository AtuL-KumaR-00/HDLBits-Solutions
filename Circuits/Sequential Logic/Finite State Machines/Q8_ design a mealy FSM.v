module top_module (
    input clk,
    input aresetn,    // Asynchronous active-low reset
    input x,
    output z ); 

    parameter a=0,b=1,c=2,d=3;
    reg [1:0] state,next;
    always @(*) begin
        case(state)
            a: next = x?b:a;
            b: next = x?b:c;
            c: next = x?d:a;
            d: next = x?b:c;
        endcase
    end
    
    always @(posedge clk or negedge aresetn) begin
        if(!aresetn) state<=a;
        else state<=next;
    end
    
    assign z = (state==c)&& x;
    
endmodule
