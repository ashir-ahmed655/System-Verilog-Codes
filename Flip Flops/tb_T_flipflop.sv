`timescale 1ns/1ps

module tb_t_ff;


    logic clk;
    logic rst;
    logic t;
    logic q;

    t_ff dut (
        .clk (clk),
        .rst (rst),
        .t   (t),
        .q   (q)
    );

    always begin
        #5 clk = ~clk;
    end

    initial begin
        $dumpfile("dump_t.vcd"); 
        $dumpvars(0, tb_t_ff);  
    end
    initial begin

        clk = 0;
        rst = 1; 
        t   = 0;

        #15;
        rst = 0; 
        
        #10; t = 0; 
        
        #10; t = 1;       

        #10; t = 1; 
        
        #10; t = 0; 
        
        #5;  t = 1; 
        #5;  rst = 1; 
        #10; rst = 0; 
        
        #20;
        $finish; 
    end
endmodule
