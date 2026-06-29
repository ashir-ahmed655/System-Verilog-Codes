module sipo (
    input  logic       clk,
    input  logic       rst,
    input  logic       serial_in,
    output logic [3:0] parallel_out
);
    logic [3:0] shift_reg;
    always_ff @(posedge clk or posedge rst) begin
        if (rst)
            shift_reg <= 4'b0000;
        else
            shift_reg <= {shift_reg[2:0], serial_in};
    end

    assign parallel_out = shift_reg;
endmodule
