timeunit 1ns;
timeprecision 1ps;

module tb_mod_n_counter;

    parameter N = 10;

    logic clk;
    logic rst;
    logic [$clog2(N)-1:0] q;

    mod_n_counter #(.N(N)) dut (
        .clk(clk),
        .rst(rst),
        .q(q)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;
        
        #15 rst = 0;
        
        #150 rst = 1;
        #15 rst = 0;
        
        #30 $finish;
    end

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_mod_n_counter);
    end

endmodule
