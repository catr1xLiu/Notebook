module compx4(
	input  [3:0]A, 
	input  [3:0]B,
	output agtb,
	output aeqb, 
	output altb
	
);

wire A3GTB3, A3EQB3, A3LTB3,
		A2GTB2, A2EQB2, A2LTB2,
		A1GTB31, A1EQB1, A1LTB1,
		A0GTB0, A0EQB0, A0LTB0;
		
compx1 A3(
	.A(A[3]), 
	.B(B[3]),
	.A_gt_B(A3GTB3),
	.A_eq_B(A3EQB3), 
	.A_lt_B(A3LTB3)
);

compx1 A2(
	.A(A[2]), 
	.B(B[2]),
	.A_gt_B(A2GTB2),
	.A_eq_B(A2EQB2), 
	.A_lt_B(A2LTB2)
);

compx1 A1(
	.A(A[1]), 
	.B(B[1]),
	.A_gt_B(A1GTB1),
	.A_eq_B(A1EQB1), 
	.A_lt_B(A1LTB1)
);

compx1 A0(
	.A(A[0]), 
	.B(B[0]),
	.A_gt_B(A0GTB0),
	.A_eq_B(A0EQB0), 
	.A_lt_B(A0LTB0)
);

assign agtb = A3GTB3 == 1'b1 ? 1'b1 
				: A2GTB2 == 1'b1 ? 1'b1
				: A1GTB1 == 1'b1 ? 1'b1
				: A0GTB0 == 1'b1 ? 1'b1 : 1'b0;
assign aeqb = A3EQB3 & A2EQB2 & A1EQB1 & A0EQB0;
assign gltb = ^(agtb | aeqb);
endmodule