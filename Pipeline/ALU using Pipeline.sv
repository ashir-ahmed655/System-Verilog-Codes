module alu(
  input  logic        clk,
  input  logic        rst,
  input  logic [31:0] a,
  input  logic [31:0] b,
  input  logic [2:0]  op_code,
  output logic [63:0] out
);


  logic [31:0] a_reg, b_reg;
  logic [2:0]  op_reg;
  logic [63:0] out_reg;


  logic [63:0] alu_result;


  always_ff @(posedge clk or posedge rst) begin
    if (rst) begin
      a_reg  <= '0;
      b_reg  <= '0;
      op_reg <= '0;
      out    <= '0;
    end else begin
      a_reg <= a;
      b_reg <= b;
      op_reg <= op_code;
      out    <= alu_result;
    end
  end


  always_comb begin
    case (op_reg)
      3'b000: alu_result = a_reg + b_reg;
      3'b001: alu_result = a_reg - b_reg;
      3'b010: alu_result = a_reg & b_reg;
      3'b011: alu_result = a_reg | b_reg;
      3'b100: alu_result = a_reg ^ b_reg;
      3'b101: alu_result = (b_reg != 0) ? (a_reg % b_reg) : '0;
      3'b110: alu_result = ~(a_reg & b_reg);
      3'b111: alu_result = ~(a_reg | b_reg);
      default: alu_result = '0;
    endcase
  end

endmodule
