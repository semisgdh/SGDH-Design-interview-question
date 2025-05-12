`timescale 1ns / 1ps
module counter(
    input       clk,
    input       areset,
    input       count_down_start,
    output reg [3:0] out_count_up,
    output reg [3:0] out_count_down
); 

    
    always @(posedge clk or posedge areset) begin
        if(areset) 
            out_count_up <= 4'h0;
        else if(out_count_up[3:0] == 9'd15) 
            out_count_up <= 4'h0;
        else 
            out_count_up <= out_count_up + 4'd1; 
    end
    
    always @(posedge clk or posedge areset) begin
        if(areset) 
            out_count_down <= 4'h0;
        else if(count_down_start) 
            out_count_down <= 4'd10;
        else if (out_count_down > 4'd0) 
            out_count_down <= out_count_down - 4'd1; 
    end


endmodule