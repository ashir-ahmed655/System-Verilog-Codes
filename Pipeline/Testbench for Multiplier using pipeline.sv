timeunit 1ns;
timeprecision 1ps;

module tb_pipeline_multiplier;

    logic [31:0] a;
    logic [31:0] b;
    logic clk;
    logic rst;
    logic [63:0] y;

    pipeline_multiplier dut (
        .a(a),
        .b(b),
        .clk(clk),
        .rst(rst),
        .y(y)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;
        a = '0;
        b = '0;

        #15 rst = 0;

        @(negedge clk);
        a = 32'd5; b = 32'd4;

        @(negedge clk);
        a = 32'd10; b = 32'd10;

        @(negedge clk);
        a = 32'hFFFFFFFF; b = 32'd2; 

        @(negedge clk);
        a = 32'd1000; b = 32'd0;

        @(negedge clk);
        a = 32'hFFFFFFFF; b = 32'hFFFFFFFF; 

        #30 $finish;
    end

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_pipeline_multiplier);
    end

endmodule
