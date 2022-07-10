module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah ); 

    //parameter
    parameter left = 0, fall_left = 1, right = 2, fall_right = 3;
    reg [1:0] current, next;
    
    always @(*) begin
        case(current)
            left: if(!ground) next<= fall_left;
            	else if(bump_left) next<=right;
            	else next<=left;
            right: if(!ground) next<=fall_right;
            	else if(bump_right) next<=left;
            	else next<= right;
            fall_left: if(!ground)	next<=fall_left;
            	else next<=left;
            fall_right: if(!ground) next<=fall_right;
            	else next<= right;
        endcase
    end
    
    always @ (posedge clk or posedge areset) begin
        if(areset) current<=left;
        else current<=next;
    end
    
    assign walk_left = (current==left);
    assign walk_right = (current==right);
    assign aaah = (current== fall_left | current==fall_right);
            
endmodule
