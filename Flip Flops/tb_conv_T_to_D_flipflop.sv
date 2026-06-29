timeunit 1ns;
timeprecision 1ps;

module tb_d_ff_from_t_ff;

    logic clk;
    logic rst;
    logic d;
    logic q;

    d_ff_from_t_ff dut (
        .clk(clk),
        .rst(rst),
        .d(d),
        .q(q)
    );

    always #5 clk = ~clk;
    initial begin
        clk = 0;
        rst = 1;
        d = 0;
        
        #15 rst = 0;     
        #10 d = 1;
        #10 d = 0;
        #25 d = 1;
        #15 d = 0;    
        #15 rst = 1;
        #10 rst = 0;
        
        #20 $finish;
    end

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_d_ff_from_t_ff);
    end

endmodule
