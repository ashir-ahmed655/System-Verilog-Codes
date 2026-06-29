module bidir_shift_reg #(
    parameter WIDTH = 4
) (
    input  logic clk,
    input  logic rst,
    input  logic dir,
    input  logic d_in,
    output logic [WIDTH-1:0] q_out
);

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            q_out <= '0;
        end else if (dir) begin
            q_out <= {d_in, q_out[WIDTH-1:1]};
        end else begin
            q_out <= {q_out[WIDTH-2:0], d_in};
        end
    end

endmodule
