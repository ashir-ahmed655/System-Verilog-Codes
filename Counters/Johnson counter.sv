module johnson_counter (
    input  logic clk,
    input  logic rst,
    output logic [3:0] q
);
    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            q <= '0;
        end else begin
            q <= {~q[0], q[3:1]};
        end
    end

endmodule
