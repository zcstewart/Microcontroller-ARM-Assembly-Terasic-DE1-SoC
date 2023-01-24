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
KON:	           
		  B       LOOP
KOFF:	  MOV	  R3, #0x00			/* Move the value of 0 (hex: 0x00) into R3 */
		  STR     R3, [R1]			/* Store the value of R3 into R1 */
		  B		  LOOP
.end
