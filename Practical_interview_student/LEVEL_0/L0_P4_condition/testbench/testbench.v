`timescale 1ns / 1ps
module testbench;

 reg [1:0] sel;
 wire [1:0] normal_if;   
 wire [1:0] normal_case;   
 wire [1:0] normal_ternary;   
 wire [1:0] latch_if;   
 wire [1:0] latch_case;  
integer file;  // File descriptor for the output file

  condition u_condition (
    .sel            ( sel            ),
    .normal_if      ( normal_if      ),
    .normal_case    ( normal_case    ),
    .normal_ternary ( normal_ternary ),
    .latch_if       ( latch_if       ),
    .latch_case     ( latch_case     )
  );

  initial begin
    // Open a file for CSV output
    file = $fopen("output.txt", "w");
    // 테스트 케이스 출력
    sel= 0;
    $fmonitor(file,"sel = %d, normal_if = %d, normal_case = %d, normal_termary = %d, latch_if = %d, latch_case = %d", sel, normal_if, normal_case, normal_ternary, latch_if, latch_case);
    $monitor("sel = %d, normal_if = %d, normal_case = %d, normal_termary = %d, latch_if = %d, latch_case = %d", sel, normal_if, normal_case, normal_ternary, latch_if, latch_case);
    repeat(8) begin
      sel = sel+1; #10;
    end
    #10;
    // Close the file after simulation
    $fclose(file);
    $finish;
  end



endmodule
