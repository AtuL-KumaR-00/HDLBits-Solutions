module top_module( 
    input [99:0] in,
    output [99:0] out
);
    reg [99:0]out_;
    integer i;
    always @(*)	begin
        for(i=0;i<100;i=i+1)
            out_[99-i]=in[i];
    end
    assign out=out_;
endmodule