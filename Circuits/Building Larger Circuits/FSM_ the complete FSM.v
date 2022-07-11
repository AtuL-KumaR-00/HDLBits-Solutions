module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output shift_ena,
    output counting,
    input done_counting,
    output done,
    input ack );

    parameter s=0,s1=1,s11=2,s110=3,b0=4,b1=5,b2=6,b3=7,count=8,waits=9;
    reg [3:0] state, next;
    always@(*)begin
        case(state)
        	s   : next = data ? s1 : s;
       	 	s1  : next = data ? s11 : s;
        	s11 : next = data ? s11 : s110;
        	s110: next = data ? b0 : s;
        	b0  : next = b1;
        	b1  : next = b2;
        	b2  : next = b3;
            b3  : next = count;
            count: next = done_counting ? waits : count ;
            waits: next = ack ? s : waits;
        endcase end
    
    always@(posedge clk)begin
        if(reset) state<=s;
        else state<=next;end
    
    assign shift_ena = (state==b0)| (state==b1)| (state==b2)| (state==b3);  
    assign counting = (state==count);
    assign done = (state==waits);
endmodule
