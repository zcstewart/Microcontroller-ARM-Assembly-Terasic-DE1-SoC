// The following look-up table specifies the necessary values needed
// to illumintate the seven-segment displays

		.equ ZERO,  0x0000003F		//Illuminates '0' on seven-segment display
		.equ ONE, 	0x00000006		//Illuminates '1' on seven-segment display
		.equ TWO, 	0x0000005B		//Illuminates '2' on seven-segment display
		.equ THREE, 0x0000004F		//Illuminates '3' on seven-segment display
		.equ FOUR, 	0x00000066		//Illuminates '4' on seven-segment display
		.equ FIVE, 	0x0000006D		//Illuminates '5' on seven-segment display
		.equ SIX, 	0x0000007D		//Illuminates '6' on seven-segment display
		.equ SEVEN, 0x00000007		//Illuminates '7' on seven-segment display
		.equ EIGHT, 0x0000007F		//Illuminates '8' on seven-segment display
		.equ NINE, 	0x0000006F		//Illuminates '9' on seven-segment display
		.equ AHEX, 	0x00000077		//Illuminates 'A' on seven-segment display
		.equ BHEX, 	0x0000007C		//Illuminates 'B' on seven-segment display
		.equ CHEX, 	0x00000039		//Illuminates 'C' on seven-segment display
		.equ DHEX, 	0x0000005E		//Illuminates 'D' on seven-segment display
		.equ EHEX, 	0x00000079		//Illuminates 'E' on seven-segment display
		.equ FHEX, 	0x00000071		//Illuminates 'F' on seven-segment display
