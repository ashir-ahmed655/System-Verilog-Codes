module up_down_counter_sync (
    input  logic clk,      
    input  logic rst,      
    input  logic up_down,  
    output logic [3:0] q    
);

    
    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
          
            q <= 4'b0000;
        end else begin
           
            if (up_down) begin
                q <= q + 1'b1; 
            end else begin
                q <= q - 1'b1; 
            end
        end
    end

endmodule
