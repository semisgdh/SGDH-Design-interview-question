`timescale 1ns / 1ps
module condition(
    input [1:0] sel,
    output reg [1:0] normal_if,   
    output reg [1:0] normal_case,   
    output     [1:0] normal_ternary,   
    output reg [1:0] latch_if,   
    output reg [1:0] latch_case   
); 

// Normal If condition
    always @(*)begin
        if (sel == 2'd0) 
    		normal_if = 2'd1;
        else if(sel == 2'd1)
    		normal_if = 2'd2;
        else if(sel == 2'd2)
    		normal_if = 2'd3;
        else 
    		normal_if = 2'd0;
    end

// Normal Case
    always@(*) begin  
        case(sel)
            2'b00: normal_case = 2'd3;
            2'b01: normal_case = 2'd0;
            2'b10: normal_case = 2'd1;
            default: normal_case = 2'd2;  //If no default, can make latch
        endcase
    end

// Normal Ternary
    assign normal_ternary = sel == 2'd0 ? 2'd2 :
                            sel == 2'd1 ? 2'd3 :
                            sel == 2'd2 ? 2'd0 : 2'd1;
// Latch condition
    always @(*) begin
        if (sel == 2'd2)
           latch_if = 1;
    end
    always@(*) begin  
        case(sel)
            2'b00: latch_case = 2'd0;
            2'b01: latch_case = 2'd1;
            2'b10: latch_case = 2'd2;
        endcase
    end




endmodule