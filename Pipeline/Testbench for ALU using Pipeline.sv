timeunit 1ns;
timeprecision 1ps;

module tb_alu;

    logic clk;
    logic rst;
    logic [31:0] a;
    logic [31:0] b;
    logic [2:0] op_code;
    logic [63:0] out;

    alu dut (
        .clk(clk),
        .rst(rst),
        .a(a),
        .b(b),
        .op_code(op_code),
        .out(out)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;
        a = '0;
        b = '0;
        op_code = '0;

        #15 rst = 0;

        @(negedge clk);
        a = 32'd15; b = 32'd10; op_code = 3'b000; 

        @(negedge clk);
        a = 32'd20; b = 32'd5;  op_code = 3'b001; 

        @(negedge clk);
        a = 32'hFFFF0000; b = 32'h00FFFF00; op_code = 3'b010; 

        @(negedge clk);
        a = 32'h0F0F0F0F; b = 32'hF0F0F0F0; op_code = 3'b011; 

        @(negedge clk);
        a = 32'hAAAAAAAA; b = 32'h55555555; op_code = 3'b100; 

        @(negedge clk);
        a = 32'd100; b = 32'd33; op_code = 3'b101; 

        @(negedge clk);
        a = 32'h12345678; b = 32'h87654321; op_code = 3'b110; 

        @(negedge clk);
        a = 32'h00000000; b = 32'hFFFFFFFF; op_code = 3'b111; 

        #40 $finish;
    end

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_alu);
    end

endmodule
