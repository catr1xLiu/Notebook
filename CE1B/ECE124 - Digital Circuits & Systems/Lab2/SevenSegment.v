module SevenSegment (
   
   input [3:0] hex,   		// The 4 bit data to be displayed
   
   output[6:0] sevenseg   // 7-bit outputs to a 7-segment
); 


// The following statements convert a 4-bit input, called dataIn to a pattern of 7 bits
// Each segment turns on when it is '1' otherwise '0'
// here is the seven segment display map:
//
//	        +---- a -----+
//         |            |
//		     |            |
//         f            b
//         |            |
//         |            |
//         +---- g -----+
//         |            |
//         |            |
//         e            c
//         |            |
//         |            |
//         +---- d -----+

//	  		                      hex bits      sevenseg
//	                                3210		 GFEDCBA
		assign sevenseg = (hex == 4'b0000) ? 7'b0111111 : // 0
								(hex == 4'b0001) ? 7'b0000110 : // 1
								(hex == 4'b0010) ? 7'b1011011 : // 2
								(hex == 4'b0011) ? 7'b1001111 : // 3
								(hex == 4'b0100) ? 7'b1100110 : // 4
								(hex == 4'b0101) ? 7'b1101101 : // 5
								(hex == 4'b0110) ? 7'b1111101 : // 6
								(hex == 4'b0111) ? 7'b0000111 : // 7
								(hex == 4'b1000) ? 7'b1111111 : // 8
								(hex == 4'b1001) ? 7'b1101111 : // 9
								(hex == 4'b1010) ? 7'b1110111 : // A
								(hex == 4'b1011) ? 7'b1111100 : // b
								(hex == 4'b1100) ? 7'b1011000 : // c
								(hex == 4'b1101) ? 7'b1011110 : // d
								(hex == 4'b1110) ? 7'b1111001 : // E
								(hex == 4'b1111) ? 7'b1110001 : // F
														 7'b0000000 ; //for other values
	
endmodule 
