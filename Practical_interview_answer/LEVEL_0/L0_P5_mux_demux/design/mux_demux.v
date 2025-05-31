`timescale 1ns / 1ps
module mux_demux(
    input mux_2to1_sel, 
    output mux_2to1_out,

    input  [1:0] mux_4to1_sel,  
    output [1:0] mux_4to1_out,  
    
    input            demux_1to2_sel,  
    input            demux_1to2_in,
    output reg [1:0] demux_1to2_out
);

//mux_2to1
assign mux_2to1_out = mux_2to1_sel ? 1'b0 : 1'b1;  


//mux_4to1
wire [1:0] mux_4to1_out_sel[3:0];

assign mux_4to1_out_sel[0] = 2'd3;
assign mux_4to1_out_sel[1] = 2'd2;
assign mux_4to1_out_sel[2] = 2'd1;
assign mux_4to1_out_sel[3] = 2'd0;
assign mux_4to1_out = mux_4to1_out_sel[mux_4to1_sel];

//demux_1to2
always @(*) begin
    demux_1to2_out = 2'd0;            
    case (demux_1to2_sel)
        1'b0: demux_1to2_out[0] = demux_1to2_in; 
        1'b1: demux_1to2_out[1] = demux_1to2_in; 
        default : demux_1to2_out = 2'd0;
    endcase
end

endmodule