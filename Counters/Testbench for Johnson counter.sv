timeunit 1ns;
timeprecision 1ps;

module tb_johnson_counter;

    logic clk;
    logic rst;
    logic [3:0] q;

    johnson_counter dut (
        .clk(clk),
        .rst(rst),
        .q(q)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;
        
        #15 rst = 0;
        
        #100 rst = 1;
        #15 rst = 0;
        
        #50 $finish;
    end

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_johnson_counter);
    end

endmodule
