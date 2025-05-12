`timescale 1ns / 1ps
module basic_gate
(
    input in_a,
    input in_b,
    output not_gate_out,
    output and_gate_out,
    output nand_gate_out,
    output or_gate_out,
    output nor_gate_out,
    output xor_gate_out,
    output xnor_gate_out
);


assign not_gate_out   = ~in_a;
assign and_gate_out  = in_a & in_b;
assign nand_gate_out = ~(in_a & in_b);
assign or_gate_out   = in_a | in_b;
assign nor_gate_out  = ~(in_a | in_b);
assign xor_gate_out  = in_a^in_b;
assign xnor_gate_out = ~(in_a^in_b);



endmodule
