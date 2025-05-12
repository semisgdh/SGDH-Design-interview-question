`timescale 1ns / 1ps
module module_top
(
input [1:0]     in_add_a,
input [1:0]     in_add_b,
input [1:0]     in_add_c,
input [1:0]     in_add_d,
input           in_add_sub_sel,
output [7:0]    final_cal_out

);

wire [2:0] adder_name_out;
wire [2:0] adder_position_out;

 adder_name u_add_name (
    .add_in_a(in_add_a),
    .add_in_b(in_add_b),
    .add_out_sum(adder_name_out)
);

 adder_position u_add_position ( in_add_c, in_add_d, adder_position_out);


 add_sub u_add_sub_0(
    .in_add_a(adder_name_out),
    .in_add_b(adder_position_out),
    .in_add_sub_sel(in_add_sub_sel),
    .cal_out(final_cal_out[3:0])
 );

 add_sub u_add_sub_1(
    .in_add_a(adder_name_out),
    .in_add_b(adder_position_out),
    .in_add_sub_sel(~in_add_sub_sel),
    .cal_out(final_cal_out[7:4])
 );

endmodule
