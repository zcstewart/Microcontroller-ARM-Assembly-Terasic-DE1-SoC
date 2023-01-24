		  .type LEDOFF, %function
LEDOFF:
		  MOV     R11, #0x0        	/* Illuminate first 8 LEDs */
		  STR     R11, [R1]			/* Store the value of R3 into R1 */
		  MOV     R9, LR
		  BL	  MHZ800DELAY
		  MOV	  LR, R9
		  BX	  LR
