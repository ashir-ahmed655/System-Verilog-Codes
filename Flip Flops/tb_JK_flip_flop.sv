timescale 1ns/1ps

module tb_jk_ff;


    logic clk;
    logic rst;
    logic j;
    logic k;
    logic q;

    jk_ff dut (
        .clk (clk),
        .rst (rst),
        .j   (j),
        .k   (k),
        .q   (q)
    );

    always begin
        #5 clk = ~clk;
    end
    initial begin
        $dumpfile("dump_jk.vcd"); 
        $dumpvars(0, tb_jk_ff);  
    end

    initial begin

        clk = 0;
        rst = 1; 
        j   = 0;
        k   = 0;

        #15;
        rst = 0;
        
        #10; j = 1; k = 0;
        
        #10; j = 0; k = 0;    

        #10; j = 0; k = 1; 
        
        #10; j = 0; k = 0; 
        
        #10; j = 1; k = 1; 
        
        #10; j = 1; k = 1; 
        
        #20;
        $finish; 
    end
endmodule
