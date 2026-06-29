module universal_shift_reg #(
    parameter WIDTH = 4
) (
    input  logic clk,
    input  logic rst,
    input  logic [1:0] mode,
    input  logic s_in_right,
    input  logic s_in_left,
    input  logic [WIDTH-1:0] p_in,
    output logic [WIDTH-1:0] q_out
);

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            q_out <= '0;
        end else begin
            case (mode)
                2'b00: q_out <= q_out;
                2'b01: q_out <= {s_in_right, q_out[WIDTH-1:1]};
                2'b10: q_out <= {q_out[WIDTH-2:0], s_in_left};
                2'b11: q_out <= p_in;
                default: q_out <= q_out;
            endcase
        end
    end

endmodule
