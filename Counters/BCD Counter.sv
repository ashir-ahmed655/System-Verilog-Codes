module bcd_counter (
    input  logic clk,
    input  logic rst,
    output logic [3:0] q
);

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            q <= 4'b0000;
        end else if (q == 4'b1001) begin
            q <= 4'b0000;
        end else begin
            q <= q + 1'b1;
        end
    end

endmodule
