module pipeline_multiplier(
  input logic [31:0] a,
  input logic [31:0] b,
  input logic clk,
  input logic rst,
  output logic [63:0]y
);
  
  logic [31:0]a_reg;
  logic [31:0]b_reg;
  logic [63:0]out_reg;
  
  always_ff @(posedge clk or posedge rst)begin
    
    if(rst)begin
      a_reg <= 32'b0;
      b_reg <= 32'b0;
      out_reg <= 64'b0;
    end
    
    else begin 
      a_reg <= a; 
      b_reg <= b; 
      out_reg <= a_reg * b_reg;
    end
    
  end 
  
  assign y = out_reg; 
    
  
endmodule
