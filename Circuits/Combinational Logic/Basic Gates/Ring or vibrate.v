module top_module (
    input ring,
    input vibrate_mode,
    output ringer,       // Make sound
    output motor         // Vibrate
);
    always @(*) begin
        if(ring==1'b1 && vibrate_mode==1'b1) begin
            motor=1;
            ringer=0;
        end
        else if(ring==1'b1 && vibrate_mode==1'b0)begin
            ringer=1;
            motor=0;
        end
        else begin
            motor=0;
            ringer=0;
        end
    end
endmodule
