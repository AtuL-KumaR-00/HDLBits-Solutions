module top_module( 
    input [254:0] in,
    output [7:0] out );
    int i;
    reg [7:0]out_;
    always @(*) begin
        out_=0;
        for(i=0;i<255;i++) begin
            if(in[i]==1'b1)	out_=out_+1;
        end
    end
    assign out=out_;
endmodule
