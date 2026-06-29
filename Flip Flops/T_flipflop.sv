module t_ff (
    input  logic clk,        
    input  logic rst,        
    input  logic t,         
    output logic q          
);

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            q <= 1'b0;       
        end else begin
            if (t) 
                q <= ~q;    
            else 
                q <= q;      
        end
    end

endmodule
