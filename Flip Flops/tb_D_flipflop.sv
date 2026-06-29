`timescale 1ns/1ps

module tb_dff;


    logic clk;
    logic rst;
    logic d;
    logic q;


    dff dut (
        .clk (clk),
        .rst (rst),
        .d   (d),
        .q   (q)
    );


    always begin
        #5 clk = ~clk;
    end
    
    initial begin

        clk = 0;
        rst = 1; 
        d   = 0;

 
        #25;
        rst = 0;
        

        #5;  d = 1; 
        #20; d = 0; 
        #20; d = 1; 
        

        #15; rst = 1; 
        #10; rst = 0; 
        
        #20;
        $finish; 
    end

initial begin
        $dumpfile("dump.vcd"); 
        $dumpvars(0, tb_dff);  
    end

endmodule
