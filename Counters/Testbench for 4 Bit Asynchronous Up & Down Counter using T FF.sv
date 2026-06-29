timeunit 1ns;
timeprecision 1ps;

module tb_updown_counter_async;

    logic clk;
    logic rst;
    logic up_down;
    logic [3:0] q;

    updown_counter_async dut (
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
        
        #180 up_down = 0;
        
        #180 rst = 1;
        #15 rst = 0;
        
        #50 $finish;
    end

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_updown_counter_async);
    end

endmodule
