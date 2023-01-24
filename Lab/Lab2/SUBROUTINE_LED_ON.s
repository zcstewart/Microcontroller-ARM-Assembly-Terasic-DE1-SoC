		.type LEDFLASH, %function

LEDFLASH:
		  LDR	R0, =0x0BEBC200		/* Load 0x0800 into R8 */
		  MOV     R3, #0xFF        	/* Illuminate first 8 LEDs */
		  ADD	  R3, #0x300		/* Illuminate last 3 LEDSs */
		  STR     R3, [R1]			/* Store the value of R3 into R1 */			   
.end