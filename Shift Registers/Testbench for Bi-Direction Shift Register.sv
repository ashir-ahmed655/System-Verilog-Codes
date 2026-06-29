timeunit 1ns;
timeprecision 1ps;

module tb_bidir_shift_reg;

    parameter WIDTH = 4;

    logic clk;
    logic rst;
    logic dir;
    logic d_in;
    logic [WIDTH-1:0] q_out;

    bidir_shift_reg #(.WIDTH(WIDTH)) dut (
        .clk(clk),
        .rst(rst),
        .dir(dir),
        .d_in(d_in),
        .q_out(q_out)
    );

    always #5 clk = ~clk;

    

    initial begin
        clk = 0;
        rst = 1;
        dir = 0;
        d_in = 0;

        #15 rst = 0;

        @(negedge clk);
        dir = 1; 
        d_in = 1;

        @(negedge clk);
        d_in = 0;

        @(negedge clk);
        d_in = 1;

        @(negedge clk);
        d_in = 1;

        @(negedge clk);
        dir = 0; 
        d_in = 0;

        @(negedge clk);
        d_in = 1;

        @(negedge clk);
        d_in = 0;

        #30 $finish;
    end

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_bidir_shift_reg);
    end

endmodule
