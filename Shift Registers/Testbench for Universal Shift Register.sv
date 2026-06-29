timeunit 1ns;
timeprecision 1ps;

module tb_universal_shift_reg;

    parameter WIDTH = 4;

    logic clk;
    logic rst;
    logic [1:0] mode;
    logic s_in_right;
    logic s_in_left;
    logic [WIDTH-1:0] p_in;
    logic [WIDTH-1:0] q_out;


    universal_shift_reg #(.WIDTH(WIDTH)) dut (
        .clk(clk),
        .rst(rst),
        .mode(mode),
        .s_in_right(s_in_right),
        .s_in_left(s_in_left),
        .p_in(p_in),
        .q_out(q_out)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;
        mode = 2'b00;
        s_in_right = 0;
        s_in_left = 0;
        p_in = 4'b0000;

        #15 rst = 0;

        @(negedge clk);
        mode = 2'b11;
        p_in = 4'b1011;

        @(negedge clk);
        mode = 2'b00;

        @(negedge clk);
        mode = 2'b10;
        s_in_left = 1; 

        @(negedge clk);
        s_in_left = 0; 

        @(negedge clk);
        mode = 2'b00;

        @(negedge clk);
        mode = 2'b01;
        s_in_right = 1; 

        @(negedge clk);
        s_in_right = 1; 

        @(negedge clk);
        mode = 2'b11;
        p_in = 4'b0110; 

        #30 $finish;
    end

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_universal_shift_reg);
    end

endmodule
