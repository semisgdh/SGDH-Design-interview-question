`timescale 1ns / 1ps
module testbench;

wire  A;
wire  B;
wire  C;
wire  D;
wire  F_0;
wire  F_1;
wire  F_2;
reg [3:0]     cnt;

  // Half Adder 인스턴스 생성
  kmap u_kmap (
    .A       ( A        ),
    .B       ( B        ),
    .C       ( C        ),
    .D       ( D        ),
    .F_0     ( F_0      ),
    .F_1     ( F_1      ),
    .F_2     ( F_2      )
  );
  assign A = cnt[3];
  assign B = cnt[2];
  assign C = cnt[1];
  assign D = cnt[0];
//A B	C D  F_0  F_1  F_2
//0 0	0 1   1   0    X
//0 0	1 0   1   0    1
//0 0	1 1   0   0    1
//0 1	0 0   1   0    0
//0 1	0 1   0   1    X
//0 1	1 0   0   1    1
//0 1	1 1   1   1    1
//1 0	0 0   1   1    1
//1 0	0 1   0   0    X
//1 0	1 0   0   1    0
//1 0	1 1   1   1    0
//1 1	0 0   0   0    1
//1 1	0 1   1   1    X
//1 1	1 0   1   1    1
//1 1	1 1   0   1    1
//0 0	0 0   0   0    0
integer file_handle;
  initial begin
    // 테스트 케이스 출력
    file_handle = $fopen("answer.txt", "w");
    cnt = 0;
    $monitor("A = %d, B = %d, C = %d, D = %d, F_0 = %d, F_1 = %d, F_2 = %d", A,B,C,D,F_0,F_1,F_2);
    $fmonitor(file_handle,"A = %d, B = %d, C = %d, D = %d, F_0 = %d, F_1 = %d, F_2 = %d", A,B,C,D,F_0,F_1,F_2);
    // 테스트 벡터
    repeat(16) begin
      cnt = cnt+1; #10;
    end
    #10;
    // Close the file
    $fclose(file_handle);
    
    $finish;
  end



endmodule
