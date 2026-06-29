timeunit 1ns;
timeprecision 1ps;

module tb_freq_divider_by_4_tff;

    logic clk_in;
    logic rst;
    logic clk_out;

    freq_divider_by_4_tff dut (
        .clk_in(clk_in),
        .rst(rst),
        .clk_out(clk_out)
    );

    always #5 clk_in = ~clk_in;

    initial begin
        clk_in = 0;
        rst = 1;
        
        #15 rst = 0;
        
        #100 rst = 1;
        #15 rst = 0;
        
        #100 $finish;
    end

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_freq_divider_by_4_tff);
    end

endmodule
