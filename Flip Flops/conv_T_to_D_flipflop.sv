module t_ff (
    input  logic clk,
    input  logic rst,
    input  logic t,
    output logic q
);

    always_ff @(posedge clk or posedge rst) begin
        if (rst)   q <= 1'b0;
        else if(t) q <= ~q;
    end

endmodule


module d_ff_from_t_ff (
    input  logic clk,
    input  logic rst,
    input  logic d,
    output logic q
);

    logic t_input;

    assign t_input = d ^ q;

    t_ff t1 (
        .clk(clk),
        .rst(rst),
        .t(t_input),
        .q(q)
    );

endmodule
module t_ff (
    input  logic clk,
    input  logic rst,
    input  logic t,
    output logic q
);

    always_ff @(posedge clk or posedge rst) begin
        if (rst)   q <= 1'b0;
        else if(t) q <= ~q;
    end

endmodule


module d_ff_from_t_ff (
    input  logic clk,
    input  logic rst,
    input  logic d,
    output logic q
);

    logic t_input;

    assign t_input = d ^ q;

    t_ff t1 (
        .clk(clk),
        .rst(rst),
        .t(t_input),
        .q(q)
    );

endmodule
