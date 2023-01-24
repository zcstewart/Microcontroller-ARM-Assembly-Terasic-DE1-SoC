		  .type LEDON, %function
LEDON:
		  MOV     R10, #0xFF        	/* Illuminate first 8 LEDs */
		  ADD	  R10, #0x300		/* Illuminate last 3 LEDSs */
		  STR     R10, [R1]			/* Store the value of R3 into R1 */
		  MOV     R9, LR
		  BL	  MHZ800DELAY
		  MOV	  LR, R9
		  BX	  LR
