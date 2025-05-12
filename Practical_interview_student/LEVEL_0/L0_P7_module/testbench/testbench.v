`timescale 1ns / 1ps
module testbench;

wire [1:0]     in_add_a;
wire [1:0]     in_add_b;
wire [1:0]     in_add_c;
wire [1:0]     in_add_d;
wire           in_add_sub_sel;
wire [7:0]    final_cal_out;
reg [8:0]     cnt;
integer file;  

  // Half Adder 인스턴스 생성
  module_top u_module_top (
    .in_add_a       ( in_add_a        ),
    .in_add_b       ( in_add_b        ),
    .in_add_c       ( in_add_c        ),
    .in_add_d       ( in_add_d        ),
    .in_add_sub_sel ( in_add_sub_sel  ),
    .final_cal_out  ( final_cal_out   )
  );
  assign in_add_sub_sel = cnt[0];
  assign in_add_a = cnt[2:1];
  assign in_add_b = cnt[4:3];
  assign in_add_c = cnt[6:5];
  assign in_add_d = cnt[8:7];

  initial begin
    file = $fopen("output.txt", "w");
    // 테스트 케이스 출력
    cnt = 0;
    $monitor("in_add_a = %d, in_add_b = %d, in_add_c = %d, in_add_d = %d, in_add_sub_sel = %d, final_cal_out = %h", in_add_a, in_add_b, in_add_c, in_add_d,in_add_sub_sel,final_cal_out);
    $fmonitor(file,"in_add_a = %d, in_add_b = %d, in_add_c = %d, in_add_d = %d, in_add_sub_sel = %d, final_cal_out = %h", in_add_a, in_add_b, in_add_c, in_add_d,in_add_sub_sel,final_cal_out);
    // 테스트 벡터
    repeat(512) begin
      cnt = cnt+1; #10;
    end
    #10;
    $fclose(file);
    $finish;

  end


endmodule

