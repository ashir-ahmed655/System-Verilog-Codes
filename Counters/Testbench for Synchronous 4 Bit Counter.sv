timeunit 1ns;
timeprecision 1ps;

module tb_up_down_counter_sync;

    logic clk;
    logic rst;
    logic up_down;
    logic [3:0] q;

    up_down_counter_sync dut (
        .clk(clk),
        .rst(rst),
        .up_down(up_down),
        .q(q)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;
        up_down = 1;
        
        #15 rst = 0;
        
        #80 up_down = 0;
        
        #80 rst = 1;
        #10 rst = 0;
        
        #50 $finish;
    end

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_up_down_counter_sync);
    end

endmodule
