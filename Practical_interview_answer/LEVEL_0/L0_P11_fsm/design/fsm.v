`timescale 1ns / 1ps
module fsm(
    input            clk,
    input            areset,
    input            in,
    output           out_fsm
); 

    reg state,next_state;

    //parameter A=1'b0, B=1'b1; 
    localparam A=1'b0, B=1'b1;


    always @(posedge clk, posedge areset) begin 
        if(areset)
            state <= A;
        else
            state <= next_state;
    end

    always @(*) begin
        case (state)
            A: next_state = in ? B : A;  
            B: next_state = in ? A : B;  
        endcase
    end

    // Output logic
    assign out_fsm = state;


endmodule