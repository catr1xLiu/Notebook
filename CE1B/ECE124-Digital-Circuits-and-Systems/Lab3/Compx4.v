module compx4(
	input  [3:0]A, 
	input  [3:0]B,
	output agtb,
	output aeqb, 
	output altb
	
);

wire[3:0] AXGTBX, AXEQBX, AXLTBX;
		
compx1 A3(
	.A(A[3]), 
	.B(B[3]),
	.A_gt_B(AXGTBX[3]),
	.A_eq_B(AXEQBX[3]), 
	.A_lt_B(AXLTBX[3])
);

compx1 A2(
	.A(A[2]), 
	.B(B[2]),
	.A_gt_B(AXGTBX[2]),
	.A_eq_B(AXEQBX[2]), 
	.A_lt_B(AXLTBX[2])
);

compx1 A1(
	.A(A[1]), 
	.B(B[1]),
	.A_gt_B(AXGTBX[1]),
	.A_eq_B(AXEQBX[1]), 
	.A_lt_B(AXLTBX[1])
);

compx1 A0(
	.A(A[0]), 
	.B(B[0]),
	.A_gt_B(AXGTBX[0]),
	.A_eq_B(AXEQBX[0]), 
	.A_lt_B(AXLTBX[0])
);

assign {agtb, aeqb, altb} = AXGTBX[3] ? 3'b100
									:AXLTBX[3] ? 3'b001
									:AXGTBX[2] ? 3'b100
									:AXLTBX[2] ? 3'b001
									:AXGTBX[1] ? 3'b100
									:AXLTBX[1] ? 3'b001
									:AXGTBX[0] ? 3'b100
									:AXLTBX[0] ? 3'b001
									: 3'b010;
endmodule