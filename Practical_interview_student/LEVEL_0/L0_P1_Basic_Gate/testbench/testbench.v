`timescale 1ns / 1ps
module testbench;

reg in_a;
reg in_b;
wire not_gate_out;
wire and_gate_out;
wire nand_gate_out;
wire or_gate_out;
wire nor_gate_out;
wire xor_gate_out;
wire xnor_gate_out;
    
// Instantiation of the basic_gate module
basic_gate u_basic_gate (
    .in_a           (in_a         ),
    .in_b           (in_b         ),
    .not_gate_out   (not_gate_out ),
    .and_gate_out   (and_gate_out ),
    .nand_gate_out  (nand_gate_out),
    .or_gate_out    (or_gate_out  ),
    .nor_gate_out   (nor_gate_out ),
    .xor_gate_out   (xor_gate_out ),
    .xnor_gate_out  (xnor_gate_out)
);

integer file_handle;
// Initial block for the Testbench.
initial begin

    file_handle = $fopen("output.txt", "w");
    // Adjust the display format for better alignment using tab spacing
    $display("in_a\tin_b\tnot\tand\tnand\tor\tnor\txor\txnor");
    $fdisplay(file_handle, "in_a\tin_b\tnot\tand\tnand\tor\tnor\txor\txnor");
    $monitor("   %b\t   %b\t  %b\t  %b\t   %b\t %b\t  %b\t  %b\t   %b", in_a, in_b, 
             not_gate_out, and_gate_out, nand_gate_out, or_gate_out, 
             nor_gate_out, xor_gate_out, xnor_gate_out);
    
    $fmonitor(file_handle, "   %b\t   %b\t  %b\t  %b\t   %b\t %b\t  %b\t  %b\t   %b", in_a, in_b, 
              not_gate_out, and_gate_out, nand_gate_out, or_gate_out, 
              nor_gate_out, xor_gate_out, xnor_gate_out);
    in_a = 0;
    in_b = 0;
    #20; 
    
    in_a = 1;
    in_b = 0;
    #20; 
    
    in_a = 0;
    in_b = 1;
    #20; 
    
    in_a = 1;
    in_b = 1;
    #20; 
    
    // Close the file
    $fclose(file_handle);
    
    $finish;
end

endmodule