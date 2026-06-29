module piso (
    input  logic       clk,
    input  logic       rst,
    input  logic       load,
    input  logic [3:0] parallel_in,
    output logic       serial_out
);

    logic [3:0] shift_reg;

    always_ff @(posedge clk or posedge rst) begin
        if (rst)
            shift_reg <= 4'b0000;
        else if (load)
            shift_reg <= parallel_in;
        else
            shift_reg <= {shift_reg[2:0], 1'b0};
    end

    assign serial_out = shift_reg[3];

endmodule
