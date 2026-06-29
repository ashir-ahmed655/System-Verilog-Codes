timeunit 1ns;
timeprecision 1ps;

module tb_sipo;

    logic clk;
    logic rst;
    logic serial_in;
    logic [3:0] parallel_out;

    sipo dut (
        .clk(clk),
        .rst(rst),
        .serial_in(serial_in),
        .parallel_out(parallel_out)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;
        serial_in = 0;

        #15 rst = 0;

        @(negedge clk);
        serial_in = 1;

        @(negedge clk);
        serial_in = 0;

        @(negedge clk);
        serial_in = 1;

        @(negedge clk);
        serial_in = 1;

        @(negedge clk);
        serial_in = 0;

        #30 $finish;
    end

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_sipo);
    end

endmodule
