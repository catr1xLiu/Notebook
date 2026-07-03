module LogicalStep_Lab2_top
(
	input				rst_n,		//reset in
	input          clkin_50,	//clock in
	input		[7:0]	sw,
	input		[3:0]	pb_n,

	output	[7:0]	leds,
	output	[6:0]	seg7_data,
	output			seg7_char1,
	output			seg7_char2
);

//these are used as intermediate signals
	wire 	[3:0] hex_A, hex_B;
	wire	[6:0] seg7_A, seg7_B;

	
// wire assignments
	assign hex_A = sw[3:0];
	assign hex_B = sw[7:4];

	
//module instantiations are here
	wire [3:0] sum, digit1, digit2;
	wire c_out;
	
	wire  [3:0] pb;
	pb_inverters inverter(
		.pbin  (pb_n),
		.pbout (pb)
	);

	full_adder_4bit u_adder (
		.input_A   (hex_A),
		.input_B   (hex_B),
		.carry_out (c_out),
		.sum_out   (sum)
		);
	
	mux_4bit_2_to_1 mux1 (
		.din_A    (hex_A),
		.din_B    (sum),
		.selector (pb[2]),
		.dout     (digit1)
		);
	
	mux_4bit_2_to_1 mux2 (
		.din_A    (hex_B),
		.din_B    ({3'b000, c_out}),
		.selector (pb[2]),
		.dout     (digit2)
		);

	SevenSegment u1 (
		.hex      (digit1), 
		.sevenseg (seg7_A)
	);

	SevenSegment u2 (
		.hex      (digit2), 
		.sevenseg (seg7_B)
	);
	
	segment7_mux u3 (
		.clk  (clkin_50),
		.din2 (seg7_A), 
		.din1 (seg7_B),
		.dout (seg7_data),
		.dig2 (seg7_char2), 
		.dig1 (seg7_char1)
	);
	
	four_logic_processor(
		.logic_in0 (hex_A),
		.logic_in1 (hex_B),
		.select    (pb[1:0]),
		.logic_out (leds[3:0])
	);	
 
 
endmodule

	