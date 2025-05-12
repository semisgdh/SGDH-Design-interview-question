`timescale 1ns / 1ps
module vector
(
input [3:0] vector_0_in,
input scala_1_in,
input [12:0] vector_2_in,
input [3:0] vector_3_in_0,
input [3:0] vector_3_in_1,
input [3:0] vector_3_in_2,
output scala_0_out_0,
output scala_0_out_1,
output scala_0_out_2,
output scala_0_out_3,
output [3:0] vector_1_out,
output [6:0] vector_2_out,
output [11:0] vector_3_out
);

assign scala_0_out_0 = vector_0_in[0];
assign scala_0_out_1 = vector_0_in[1];
assign scala_0_out_2 = vector_0_in[2];
assign scala_0_out_3 = vector_0_in[3];

assign vector_1_out    = {4{scala_1_in}};

assign vector_2_out[0] = ~vector_2_in[0];
assign vector_2_out[1] =  vector_2_in[1] & vector_2_in[2];
assign vector_2_out[2] = ~(vector_2_in[3]  & vector_2_in[4]);
assign vector_2_out[3] =   vector_2_in[5]  | vector_2_in[6];
assign vector_2_out[4] = ~(vector_2_in[7]  | vector_2_in[8]);
assign vector_2_out[5] =   vector_2_in[9]  ^ vector_2_in[10];
assign vector_2_out[6] = ~(vector_2_in[11] ^ vector_2_in[12]);


assign vector_3_out = {vector_3_in_2,
                       vector_3_in_1,
                       vector_3_in_0};

endmodule

