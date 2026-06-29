module siso (
    input  logic clk,
    input  logic rst,
    input  logic serial_in,
    output logic serial_out
);

    logic [3:0] shift_reg;

    always_ff @(posedge clk or posedge rst) begin
        if (rst)
            shift_reg <= 4'b0000;
        else
            shift_reg <= {shift_reg[2:0], serial_in};
    end

    assign serial_out = shift_reg[3];

endmodule
