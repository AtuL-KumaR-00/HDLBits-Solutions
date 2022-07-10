module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging ); 
//parameter
    parameter left = 0, fall_left = 1, dig_left = 2, right = 3, fall_right = 4, dig_right = 5;
    reg [2:0] current, next;
    
    //state transition
    //priority if more than one input asserted
    //fall->dig->switching direction
    always@(*)begin
        case(current)
            left: if(!ground)
                  	next = fall_left;
            	  else if(dig)
                    next = dig_left;
                  else if(bump_left)
                    next = right;
            	  else 
                    next = left;
            right: if(!ground)
                  	next = fall_right;
            	   else if(dig)
                    next = dig_right;
            	   else if(bump_right)
                    next = left;
            	   else 
                    next = right;

            dig_left: if(!ground)
                		next = fall_left;
                      else 
                        next = dig_left;
            
            dig_right: if(!ground)
                		next = fall_right;
                      else 
                        next = dig_right;
            
            fall_left: if(!ground)
                	   	next = fall_left; 
            	       else 
                        next = left;       
            
            fall_right:if(!ground)
                	   	next = fall_right;
            	       else 
                        next = right;      
         default: next = left;
        endcase  
    end
    //state flip flop
    always@(posedge clk, posedge areset)begin 
        if(areset)
            current <= left; 
        else
            current <= next;
    end
    
    assign walk_left = (current == left);
    assign walk_right = (current == right);
    assign aaah = (current == fall_left || current == fall_right);
    assign digging = (current == dig_left || current == dig_right);
endmodule
