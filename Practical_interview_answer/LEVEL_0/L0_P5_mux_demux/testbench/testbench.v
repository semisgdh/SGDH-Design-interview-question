`timescale 1ns / 1ps
module testbench;
    wire       mux_2to1_out;   
    reg  [1:0] sel;   
    wire [1:0] mux_4to1_out;   
    wire       demux_1to2_in;   
    wire [1:0] demux_1to2_out;   
    wire       mux_2to1_sel;   
    wire [1:0] mux_4to1_sel;   
    wire       demux_1to2_sel;   
    integer file;  

  assign mux_2to1_sel   = sel[0];
  assign mux_4to1_sel   = sel;
  assign demux_1to2_sel = sel[0];
  assign demux_1to2_in = 2'd1;
  mux_demux u_mux_demux (
    .mux_2to1_sel     ( mux_2to1_sel  ),
    .mux_2to1_out     ( mux_2to1_out  ),
    .mux_4to1_sel     ( mux_4to1_sel  ),
    .mux_4to1_out     ( mux_4to1_out  ),
    .demux_1to2_in    ( demux_1to2_in  ),
    .demux_1to2_sel   ( demux_1to2_sel ),
    .demux_1to2_out   ( demux_1to2_out )
  );
  initial begin
    file = $fopen("answer.txt", "w");
    forever begin
      @(sel);
        #1;
        $display("mux_2to1   : sel = %d, out = %d",sel[0],mux_2to1_out);
        $fdisplay(file,"mux_2to1   : sel = %d, out = %d",sel[0],mux_2to1_out);
        $display("mux_4to1   : sel = %d, out = %d ",sel,mux_4to1_out);
        $fdisplay(file,"mux_4to1   : sel = %d, out = %d ",sel,mux_4to1_out);
        $display("demux_1to2 : sel = %d, in = %d, out_0 = %d, out_1 = %d",sel[0],demux_1to2_in, demux_1to2_out[0],demux_1to2_out[1]);
        $fdisplay(file,"demux_1to2 : sel = %d, in = %d, out_0 = %d out_1 = %d",sel[0],demux_1to2_in, demux_1to2_out[0],demux_1to2_out[1]);
        $display("---------------------------------------------------");
        $fdisplay(file,"---------------------------------------------------");
    end
  end

  initial begin
    sel = 0;
    #5;
    sel = 1;
    #5;
    sel = 2;
    #5;
    sel = 3;
    #5;
    $fclose(file);
    $finish;
  end



endmodule

