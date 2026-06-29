timeunit 1ns;
timeprecision 1ps;

module tb_ring_counter;

    logic clk;
    logic rst;
    logic [3:0] q;

    ring_counter dut (
        .clk(clk),
        .rst(rst),
        .q(q)
    );
    always #5 clk = ~clk;
    initial begin
        clk = 0;
        rst = 1;
        
        #15 rst = 0;
        
        #80 rst = 1;
        #15 rst = 0;
        
        #40 $finish;
    end

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_ring_counter);
    end

endmodule
