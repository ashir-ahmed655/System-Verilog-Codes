module mod_n_counter #(
    parameter N = 10
) (
    input  logic clk,
    input  logic rst,
    output logic [$clog2(N)-1:0] q
);

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            q <= '0;
        end else if (q == N - 1) begin
            q <= '0;
        end else begin
            q <= q + 1'b1;
        end
    end

endmodule
