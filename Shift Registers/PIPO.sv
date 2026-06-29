module pipo (
    input  logic       clk,
    input  logic       rst,
    input  logic       load,
    input  logic [3:0] parallel_in,
    output logic [3:0] parallel_out
);

    always_ff @(posedge clk or posedge rst) begin
        if (rst)
            parallel_out <= 4'b0000;
        else if (load)
            parallel_out <= parallel_in;
    end

endmodule

