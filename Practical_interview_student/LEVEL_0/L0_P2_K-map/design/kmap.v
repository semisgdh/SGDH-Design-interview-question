`timescale 1ns / 1ps
module kmap
(
   input A,
   input B,
   input C,
   input D,
   output F_0,
   output F_1,
   output F_2
);

//#1 =====================================
//A B	C D  F_0 
//0 0	0 0   0
//0 0	0 1   1
//0 0	1 0   1
//0 0	1 1   0
//0 1	0 0   1
//0 1	0 1   0
//0 1	1 0   0
//0 1	1 1   1
//1 0	0 0   1
//1 0	0 1   0
//1 0	1 0   0
//1 0	1 1   1
//1 1	0 0   0
//1 1	0 1   1
//1 1	1 0   1
//1 1	1 1   0

//TODO



// #2 ==================================
// A	B	C	D	F_1
// 0	0	0	0	0
// 0	0	0	1	0
// 0	0	1	0	0
// 0	0	1	1	0
// 0	1	0	0	0
// 0	1	0	1	1
// 0	1	1	0	1
// 0	1	1	1	1
// 1	0	0	0	1
// 1	0	0	1	0
// 1	0	1	0	1
// 1	0	1	1	1
// 1	1	0	0	0
// 1	1	0	1	1
// 1	1	1	0	1
// 1	1	1	1	1

//TODO


//#3=========================================
// A	B	C	D	F_2 돈케어 (X)
// 0	0	0	0	0	0
// 0	0	0	1	X	1
// 0	0	1	0	1	0
// 0	0	1	1	1	0
// 0	1	0	0	0	0
// 0	1	0	1	X	1
// 0	1	1	0	1	0
// 0	1	1	1	1	0
// 1	0	0	0	1	0
// 1	0	0	1	X	1
// 1	0	1	0	0	0
// 1	0	1	1	0	0
// 1	1	0	0	1	0
// 1	1	0	1	X	1
// 1	1	1	0	1	0
// 1	1	1	1	1	0


//TODO


endmodule
