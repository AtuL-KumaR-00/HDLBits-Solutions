module top_module (
    input clk,
    input areset,
    input x,
    output z
); 
parameter a=0,b=1;
    reg state, next;
    always @(*) begin
        case(state)
            0: next = x?b:a;
            1: next = x?b:b;
        endcase
    end
    
    always @(posedge clk or posedge areset)begin
        if(areset) state<=a;
        else state <= next;
    end
    
    always @(posedge clk or posedge areset) begin
        if(areset) z=0;
        else begin
        	if(state==a)
            	 z=x;
        	else  z=~x;
        end
    end
        
endmodule
