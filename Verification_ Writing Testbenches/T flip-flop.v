module top_module ();

    reg clk, reset, t;
    wire q;
    
    tff tff_DUT(.clk(clk),.reset(reset),.t(t),.q(q));
    
    initial begin
       clk = 0; 
       reset = 1;
       t = 0;
       //#10; 
       //reset = 1;
       #10;
       reset = 0;
       //#10;
       t = 1; 
    end
	always begin
       #5;
       clk = ~clk;
    end
endmodule
