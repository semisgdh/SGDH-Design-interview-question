`timescale 1ns / 1ps
module flipflop (
    input clk,      
    input reset,   
    input d,       
    output reg q  
);

always @(posedge clk or posedge reset) begin
    if (reset)
        q <= 0;
    else
        q <= d;
end

endmodule