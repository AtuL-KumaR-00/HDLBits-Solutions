module top_module (
    input clk,
    input reset,
    input [3:1] s,
    output fr3,
    output fr2,
    output fr1,
    output dfr
); 
    reg [2:0] current, next; 
    
	//parameter
    parameter below_s1 = 0, s2s1_nom = 1, s3s2_nom = 2, above_s3 = 3, s3s2_sup = 4, s2s1_sup = 5;

    //state transition
    always@(*)begin
       case(current)
           below_s1: if(s[3]==0 && s[2] == 0 && s[1] == 1)
               				next <= s2s1_nom;
           			 else 
                         	next <= below_s1;
           s2s1_nom: if(s[3]==0 && s[2] == 1 && s[1] == 1)
               				next <= s3s2_nom;
          			 else if(s[3]==0 && s[2] == 0 && s[1] == 0)
               				next <= below_s1;
           			 else 
                         	next <= s2s1_nom;
           s3s2_nom: if(s[3]==1 && s[2] == 1 && s[1] == 1)
               				next <= above_s3;
           			 else if(s[3]==0 && s[2] == 0 && s[1] == 1)
                            next <= s2s1_sup;
           			 else 
                         	next <= s3s2_nom;
           above_s3: if(s[3]==0 && s[2] == 1 && s[1] == 1)
               				next <= s3s2_sup;
           			 else
                         	next<= above_s3;
           s3s2_sup: if(s[3]==0 && s[2] == 0 && s[1] == 1)
               				next <= s2s1_sup;
           			 else if(s[3]==1 && s[2] == 1 && s[1] == 1)
               				next <= above_s3;
           			 else
                         	next<= s3s2_sup;
           s2s1_sup: if(s[3]==0 && s[2] == 0 && s[1] == 0)
               				next <= below_s1;
           			 else if(s[3]==0 && s[2] == 1 && s[1] == 1)
               				next <= s3s2_nom;
           			 else
                         	next<= s2s1_sup;
           default: next <= below_s1;
       endcase      
    end
    //state flip flop
    always@(posedge clk)begin
        if(reset) begin
       		current <= below_s1;
        end
        else 
            current <= next;
    end
        
    //output
    assign dfr = (current == below_s1 || current == s2s1_sup || current == s3s2_sup);
    assign fr1 = (current != above_s3);
    assign fr2 = (current == below_s1 || current == s2s1_nom || current == s2s1_sup);
    assign fr3 = (current == below_s1);
endmodule
