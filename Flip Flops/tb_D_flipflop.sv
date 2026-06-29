`timescale 1ns/1ps

module tb_dff;


    logic clk;
    logic rst;
    logic d;
    logic q;


    dff dut (
        .clk (clk),
        .rst (rst),
        .d   (d),
        .q   (q)
    );


    always begin
        #5 clk = ~clk;
    end
