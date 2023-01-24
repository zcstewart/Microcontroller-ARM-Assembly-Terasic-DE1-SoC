          .include "address_map_arm.s"

          .text
          .global _start
_start:
	      LDR     R1, =LEDR_BASE  	/* Address of red LEDs. */
          LDR     R2, =KEY_BASE     /* Address of keys. */
LOOP:     LDR     R3, [R2]        	/* Read the state of keys. */
		  CMP	  R3, #0x00	  		/* Compare the value of R3 to 0x00 */
		  BNE	  KON				/* Branch to KON if not equal */
		  BEQ     KOFF			    /* Branch to KOFF if not equal. This
									   is done to turn the LEDs off if they are
									   already  */
          B       LOOP

KON:	  MOV     R3, #0xFF        	/* Move immediate value of binary 11111111
									   (hex: 0xFF) to illuminate first 8 LEDs
									   the first */
		  ADD	  R3, #0x300		/* Add immediate value of binary 011 
									   (hex: 0x300)to illuminate last 2 LEDS */
		  STR     R3, [R1]			/* Store the value of R3 into R1
									   (address of the red LEDs) */            
		  B       LOOP

KOFF:	  MOV	  R3, #0x00			/* Move the value of 0 (hex: 0x00) into R3 */
		  STR     R3, [R1]			/* Store the value of R3 into R1 */



		  B		  LOOP
.end
