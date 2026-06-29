timeunit 1ns;
timeprecision 1ps;

module tb_siso;

    logic clk;
    logic rst;
    logic serial_in;
    logic serial_out;

    siso dut (
        .clk(clk),
        .rst(rst),
        .serial_in(serial_in),
        .serial_out(serial_out)
    );

    always #5 clk = ~clk;
    initial begin
        clk = 0;
        rst = 1;
        serial_in = 0;

        #15 rst = 0;

        @(negedge clk) serial_in = 1; 
        @(negedge clk) serial_in = 0; 
        @(negedge clk) serial_in = 1; 
        @(negedge clk) serial_in = 1; 

        @(negedge clk) serial_in = 0; 
        @(negedge clk) serial_in = 0;
        @(negedge clk) serial_in = 0;
        @(negedge clk) serial_in = 0;

        #20 rst = 1;
        #10 rst = 0;

        #30 $finish;
    end

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_siso);
    end

endmodule
