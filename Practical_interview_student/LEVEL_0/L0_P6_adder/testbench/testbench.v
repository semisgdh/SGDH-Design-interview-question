`timescale 1ns / 1ps
module testbench;

// 입력 레지스터 선언
reg [3:0] a;
reg [3:0] b;
reg cin;
integer file;  

// 출력 와이어 선언
wire [3:0] sum;
wire cout;
integer i;
adder uut (
    .a(a),
    .b(b),
    .cin(cin),
    .sum(sum),
    .cout(cout)
);


// 테스트 벡터를 저장할 배열
reg [8:0] test_vectors[15:0];
  initial begin
    file = $fopen("output.txt", "w");
    forever begin
      @(a, b, cin, sum, cout);
        $display("a=%d, b=%d, cin=%d, sum=%d, cout=%d", a, b, cin, sum, cout);
        $fdisplay(file,"a=%d, b=%d, cin=%d, sum=%d, cout=%d", a, b, cin, sum, cout);
    end
  end

  initial begin test_vectors[0] = 9'b000000000;  // a=0, b=0, cin=0
    test_vectors[1] = 9'b000100001;  // a=1, b=0, cin=0
    test_vectors[2] = 9'b001000010;  // a=2, b=0, cin=0
    test_vectors[3] = 9'b010100101;  // a=5, b=4, cin=0
    test_vectors[4] = 9'b011101110;  // a=6, b=7, cin=0
    test_vectors[5] = 9'b100011111;  // a=15, b=1, cin=1
    test_vectors[6] = 9'b101110101;  // a=5, b=14, cin=1
    test_vectors[7] = 9'b110011001;  // a=9, b=3, cin=1
    test_vectors[8] = 9'b111111111;  // a=15, b=15, cin=1
    test_vectors[9] = 9'b000001111;  // a=15, b=0, cin=0
    test_vectors[10] = 9'b001110000; // a=0, b=14, cin=0
    test_vectors[11] = 9'b010101010; // a=10, b=5, cin=0
    test_vectors[12] = 9'b011010101; // a=5, b=10, cin=1
    test_vectors[13] = 9'b100111100; // a=12, b=7, cin=0
    test_vectors[14] = 9'b101000111; // a=7, b=8, cin=1
    test_vectors[15] = 9'b110110011; // a=3, b=13, cin=1

    for (i = 0; i < 16; i = i + 1) begin
      {a, b, cin} = test_vectors[i];
      #1; 
    end
    #10;
    $fclose(file);
    $finish;
  end



endmodule

