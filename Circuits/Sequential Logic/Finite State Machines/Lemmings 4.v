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
    parameter left = 0, fall_left = 1, dig_left = 2, right = 3, fall_right = 4, dig_right = 5, splat = 6;
    reg [2:0] current, next;
    int count;
  
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
            
            fall_left: if(ground) begin
                			if(count > 5'd19)
                                next = splat;
                            else next = left;
            		   end	
            	       else next = fall_left;     
            
            fall_right:if(ground) begin
                			if(count > 5'd19)
                                next = splat;
                            else next = right;
            		   end	
            	       else next = fall_right;   
            
            splat: next = splat; //dead
     
        endcase  
    end
    
    //state flip flop and counter
    always@(posedge clk, posedge areset)begin 
        if(areset)
            current <= left; 
        else begin
            current <= next;
        end
    end

    always@(posedge clk, posedge areset)begin 
        if(areset)
            count <= 0;
            
        else if(current == fall_left || current == fall_right) 
            count <= count + 1;
        
        else
            count <= 0;
    end
            
    assign walk_left  = (current == left)  ;
    assign walk_right = (current == right) ;
    assign aaah       = (current == fall_left || current == fall_right);
    assign digging    = (current == dig_left  || current == dig_right);
endmodule
