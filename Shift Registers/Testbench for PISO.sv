timeunit 1ns;
timeprecision 1ps;

module tb_piso;

    logic clk;
    logic rst;
    logic load;
    logic [3:0] parallel_in;
    logic serial_out;

    piso dut (
        .clk(clk),
        .rst(rst),
        .load(load),
        .parallel_in(parallel_in),
        .serial_out(serial_out)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;
        load = 0;
        parallel_in = 4'b0000;

        #15 rst = 0;

        @(negedge clk);
        load = 1;
        parallel_in = 4'b1101;

        @(negedge clk);
        load = 0;

        @(negedge clk);
        @(negedge clk);
        @(negedge clk);
        @(negedge clk);

        @(negedge clk);
        load = 1;
        parallel_in = 4'b0110;

        @(negedge clk);
        load = 0;

        #50 $finish;
    end

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_piso);
    end

endmodule
