timeunit 1ns;
timeprecision 1ps;

module tb_pipo;

    logic clk;
    logic rst;
    logic load;
    logic [3:0] parallel_in;
    logic [3:0] parallel_out;

    pipo dut (
        .clk(clk),
        .rst(rst),
        .load(load),
        .parallel_in(parallel_in),
        .parallel_out(parallel_out)
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
        parallel_in = 4'b1010;

        @(negedge clk);
        load = 0;
        parallel_in = 4'b1111; 

        @(negedge clk);
        load = 1;
        parallel_in = 4'b0101; 

        @(negedge clk);
        load = 0;
        
        #15 rst = 1;
        #10 rst = 0;

        #20 $finish;
    end

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_pipo);
    end

endmodule
