module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output done); //
// State transition logic (combinational)
    parameter BYTE1=2'b00,BYTE2=2'B01, BYTE3=2'b10, DONE=2'b11;
    reg [1:0] state;
    reg [1:0] next_state;

    // State flip-flops (sequential)
    always @(*)
        begin
        next_state=state;
            case(state)
                BYTE1: if(in[3]) 
                         next_state=BYTE2;
                      else
                          next_state=BYTE1;
                BYTE2:  next_state=BYTE3;
                BYTE3: next_state=DONE;
                DONE: if(in[3]) 
             next_state=BYTE2;
                 else
              next_state=BYTE1;  
             
             endcase   
       end//always
            always @(posedge clk)
                begin
                    if (reset)
                         state=BYTE1;
                      else
                         state=next_state;
                end//always   
    
    // Output logic
            assign done =(state==DONE)?1'b1:1'b0;

endmodule
