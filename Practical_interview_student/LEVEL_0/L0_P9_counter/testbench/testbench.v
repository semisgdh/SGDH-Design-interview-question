`timescale 1ns / 1ps
module testbench;

    reg           clk;
    reg           areset;
    reg           count_down_start;
    wire [3:0] out_count_up;   
    wire [3:0] out_count_down;   
    integer file;  


  counter u_counter (
    .clk              (  clk              ),
    .areset           (  areset           ),
    .count_down_start (  count_down_start ),
    .out_count_up     (  out_count_up     ),
    .out_count_down   (  out_count_down   )
  );

  initial begin
    clk = 0;
    forever clk = #5 ~clk;
  end

  initial begin
    areset = 0;
    #6
    areset = 1;
    #6
    areset = 0;
  end

  
  initial begin
    file = $fopen("output.txt", "w");
    forever begin
      @(posedge clk);
        $display("start = %d, count_up = %d count_down = %d", count_down_start, out_count_up, out_count_down);
        $fdisplay(file,"start = %d, count_up = %d count_down = %d", count_down_start, out_count_up, out_count_down);
    end
  end

  initial begin
    count_down_start <= 0;
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    count_down_start <= 0;
    @(posedge clk);
    count_down_start <= 1;
    @(posedge clk);
    count_down_start <= 0;
    @(posedge clk);
    wait(out_count_down == 4'd0);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    #5;
    $fclose(file);
    $finish;
  end



endmodule

