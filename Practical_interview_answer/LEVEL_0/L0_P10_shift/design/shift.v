`timescale 1ns / 1ps
module shift(
    input clk,      
    input [3:0] d,  
    input load,  
    output reg [3:0] q 
);

always @(posedge clk) begin
    if(load)
        q <= d;
    else 
        q <= {1'b0, q[3:1]};
end

endmodule