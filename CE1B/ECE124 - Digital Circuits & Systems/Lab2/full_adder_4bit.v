module full_adder_4bit (
	input  [3:0] input_A,
	input  [3:0] input_B,
	output carry_out,
	output [3:0] sum_out
	);
	assign {carry_out, sum_out} = input_A + input_B;

endmodule