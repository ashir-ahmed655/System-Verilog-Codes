module t_ff (
    input  logic clk,
    input  logic rst,
    output logic q,
    output logic q_bar
);
    
    assign q_bar = ~q;

    always_ff @(negedge clk or posedge rst) begin
        if (rst) begin
            q <= 1'b0;
        end else begin
            q <= ~q;
        end
    end
    
endmodule


module updown_counter_async (
    input  logic clk,
    input  logic rst,
    input  logic up_down,
    output logic [3:0] q
);

    logic [3:0] q_bar;
    logic clk1, clk2, clk3;

    t_ff tff0 (
        .clk(clk), 
        .rst(rst), 
        .q(q[0]), 
        .q_bar(q_bar[0])
    );
    
    assign clk1 = up_down ? q[0] : q_bar[0];
    
    t_ff tff1 (
        .clk(clk1), 
        .rst(rst), 
        .q(q[1]), 
        .q_bar(q_bar[1])
    );
    
    assign clk2 = up_down ? q[1] : q_bar[1];
    
    t_ff tff2 (
        .clk(clk2), 
        .rst(rst), 
        .q(q[2]), 
        .q_bar(q_bar[2])
    );
    
    assign clk3 = up_down ? q[2] : q_bar[2];
    
    t_ff tff3 (
        .clk(clk3), 
        .rst(rst), 
        .q(q[3]), 
        .q_bar(q_bar[3])
    );

endmodule
