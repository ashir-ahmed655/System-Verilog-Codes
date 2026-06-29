`timescale 1ns/1ps

module tb_sr_ff;


    logic clk;
    logic rst;
    logic s;
    logic r;
    logic q;


    sr_ff dut (
        .clk (clk),
        .rst (rst),
        .s   (s),
        .r   (r),
        .q   (q)
    );


    always begin
        #5 clk = ~clk;
    end

    initial begin
        $dumpfile("dump_sr.vcd"); 
        $dumpvars(0, tb_sr_ff);  
    end

    initial begin

        clk = 0;
        rst = 1; 
        s   = 0;
        r   = 0;

        #15;
        rst = 0; 
        
        #10; s = 1; r = 0; 
        

        #10; s = 0; r = 0; 
        

        #10; s = 0; r = 1; 
        

        #10; s = 0; r = 0; 
        

        #10; s = 1; r = 1; 
        
        #20;
        $finish; 
    end
endmodule
