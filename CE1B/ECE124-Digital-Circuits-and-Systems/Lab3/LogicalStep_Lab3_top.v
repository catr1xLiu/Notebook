module LogicalStep_Lab3_top (
	input 			clkin_50,
	input 	[3:0] pb_n,
 	input 	[7:0]	sw, 	
   output	[7:0] leds,
		
   output 	[6:0]	seg7_data, // 7-bit outputs to a 7-segment
	output 			seg7_char1,// seg7 digit1 selector
	output			seg7_char2 // seg7 digit2 selector
); 

// INTERNAL SIGNALS USED IN THE DESIGN

// declarations associated with the global clock,  push-buttons and switches
wire 			clk_in;
wire [3:0]	pb, hex_A, hex_B;

// declarations associated with the seg7 signals
wire [6:0]	seg7_A, seg7_B;


//------------------------------------------------------------------- 
// Here the circuit begins

// hookup up the clock and switches
assign clk_in = clkin_50;
assign hex_A = sw[3:0];
assign hex_B = sw[7:4];

// hookup to hex signals to the 7seg decoders (you may use your decoders from Lab2)
SevenSegment  U0 (
.hex (hex_A), .sevenseg (seg7_A)
); 
SevenSegment U1 (
.hex (hex_B), .sevenseg (seg7_B)
); 

// hookup to seven_segmnent_mux function
segment7_mux U2 (
.clk (clk_in), .din2 (seg7_A), .din1 (seg7_B), .dout (seg7_data), .dig2 (seg7_char2), .dig1 (seg7_char1)
);			 

//--------------------------------------------------------------------
// PART A build

//--------------------------------------------------------------------
// Part B build

//--------------------------------------------------------------------
// Part C build

//--------------------------------------------------------------------
// Part D build


endmodule
