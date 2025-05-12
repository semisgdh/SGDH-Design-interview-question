`timescale 1ns / 1ps
module adder_name
(
input [1:0]     add_in_a,
input [1:0]     add_in_b,
output [2:0]    add_out_sum

);

assign add_out_sum = add_in_a + add_in_b;

endmodule
