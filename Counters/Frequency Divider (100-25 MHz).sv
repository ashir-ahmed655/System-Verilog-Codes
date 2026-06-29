module t_ff (
    input  logic clk,
    input  logic rst,
    output logic q
);

    always_ff @(posedge clk or posedge rst) begin
        if (rst) q <= 1'b0;
        else     q <= ~q;
    end

endmodule

module freq_divider_by_4_tff (
    input  logic clk_in,
    input  logic rst,
    output logic clk_out
);

    logic q_tff_1;

    t_ff t1 (
        .clk(clk_in),
        .rst(rst),
        .q(q_tff_1)
    );

    t_ff t2 (
        .clk(q_tff_1),
        .rst(rst),
        .q(clk_out)
    );

endmodule
