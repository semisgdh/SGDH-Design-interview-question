`timescale 1ns / 1ps
module add_sub
(
input [2:0]     in_add_a,
input [2:0]     in_add_b,
input           in_add_sub_sel,
output [3:0]    cal_out

);

assign cal_out = in_add_sub_sel ? in_add_a - in_add_b : in_add_a + in_add_b;

endmodule
