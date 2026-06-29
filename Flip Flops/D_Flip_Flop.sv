module dff (
    input  logic clk,        
    input  logic rst,     
    input  logic d,          
    output logic q           
);

   
  always_ff @(posedge clk or posedge rst) begin  // have to trigger the flipflop on +ve edge clk or reset
        if (rst) 
            q <= 1'b0;      
    	
    	else 
            q <= d;         
    end

endmodule
