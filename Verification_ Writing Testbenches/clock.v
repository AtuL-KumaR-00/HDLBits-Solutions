module top_module ( );

    reg clk;
    dut ins1(clk);
    initial begin 
        clk=0;
    end
    
    always begin
        #5 clk=~clk;
    end
endmodule
