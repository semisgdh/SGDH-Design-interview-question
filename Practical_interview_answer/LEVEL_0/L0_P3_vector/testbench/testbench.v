`timescale 1ns / 1ps
module testbench;

reg [3:0] vector_0_in;
reg scala_1_in;
reg [12:0] vector_2_in;
reg [3:0] vector_3_in_0;
reg [3:0] vector_3_in_1;
reg [3:0] vector_3_in_2;
reg [3:0] shift_cnt;
wire scala_0_out_0;
wire scala_0_out_1;
wire scala_0_out_2;
wire scala_0_out_3;
wire [3:0] vector_1_out;
wire [6:0] vector_2_out;
wire [11:0] vector_3_out;

integer file;  // File descriptor for the output file

// Module instantiation
vector u_vector (
    .vector_0_in    ( vector_0_in   ),
    .scala_1_in     ( scala_1_in    ),
    .vector_2_in    ( vector_2_in   ),
    .vector_3_in_0  ( vector_3_in_0 ),
    .vector_3_in_1  ( vector_3_in_1 ),
    .vector_3_in_2  ( vector_3_in_2 ),
    .scala_0_out_0  ( scala_0_out_0 ),
    .scala_0_out_1  ( scala_0_out_1 ),
    .scala_0_out_2  ( scala_0_out_2 ),
    .scala_0_out_3  ( scala_0_out_3 ),
    .vector_1_out   ( vector_1_out  ),
    .vector_2_out   ( vector_2_out  ),
    .vector_3_out   ( vector_3_out  )
);

// Initial block for the Testbench.
initial begin
    // Open a file for CSV output
    file = $fopen("answer.txt", "w");
    
    // Write the header to the CSV file
    $fdisplay(file, "v_0_in,s_1_in,        v_2_in,v_3_in_0,v_3_in_1,v_3_in_2,shift,s_0_out_0,s_0_out_1,s_0_out_2,s_0_out_3,v_1_out, v_2_out,v_3_out");

    // Display header on console
    $display("---------------------------------------------------------------------------------------------------------------------------------");

    // Monitor console output and simultaneously write to file using $fmonitor
    $fmonitor(file, "  %b,     %b, %b,      %d,      %d,      %d,   %d,        %b,        %b,        %b,        %b,   %b, %b,   %d", 
             vector_0_in, 
             scala_1_in, 
             vector_2_in, 
             vector_3_in_0, 
             vector_3_in_1, 
             vector_3_in_2, 
             shift_cnt, 
             scala_0_out_0, 
             scala_0_out_1, 
             scala_0_out_2, 
             scala_0_out_3, 
             vector_1_out, 
             vector_2_out, 
             vector_3_out);

    // Initial signal values
    vector_0_in = 0;
    scala_1_in = 0;
    vector_2_in = 0;
    vector_3_in_0 = 0;
    vector_3_in_1 = 0;
    vector_3_in_2 = 0;
    shift_cnt = 0;
    #10; 
    
    // Update signal values and simulate
    repeat(20) begin
        vector_0_in = vector_0_in + 1;
        scala_1_in = ~scala_1_in;
        vector_2_in = 1 << shift_cnt;
        vector_3_in_0 = shift_cnt;
        vector_3_in_1 = shift_cnt+1;
        vector_3_in_2 = shift_cnt+2;
        if (shift_cnt == 12)
            shift_cnt = 0;
        else
            shift_cnt = shift_cnt + 1;
        #10;
    end

    // Close the file after simulation
    $fclose(file);
    $finish;
end

endmodule


