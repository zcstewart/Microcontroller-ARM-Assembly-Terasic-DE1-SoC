/*
	The purpose of this program is to have an alternating sequence of all
    LEDs illumated followed by no LEDs illuminated. This sequence will 
	continue as long as any key or combination of keys is pressed.
	This is accomplished using a subroutine named LEDON.
*/

          .include "address_map_arm.s"
		  .include "Lab6_PRELAB.s"

//Subroutine: LEDON
		      .type LEDON, %function
LEDON:
		      MOV     R10, #0xFF        /* Illuminate first 8 LEDs */
		      ADD	  R10, #0x300		/* Illuminate last 3 LEDSs */
		      STR     R10, [R1]			/* Turn on the LEDS */
		      MOV     R9, LR			/* Store Link Register address locally */
		      BL	  MHZ800DELAY		/* Branch to MHZ800DELAY Subroutine */
		      MOV	  LR, R9			/* Reload previous link register address */
		      MOV     R10, #0x0        	/* Load 0x00 into R10 */
		      STR     R10, [R1]			/* Turn off the LEDS */
		      MOV     R9, LR			/* Store Link Register address locally */
		      BL	  MHZ800DELAY		/* Branch to MHZ800DELAY Subroutine */	
		      MOV	  LR, R9			/* Reload previous link register address */
		      BX	  LR

          .text
          .global _start
//Program Start
_start:
	        LDR     R1, =LEDR_BASE  	/* Address of red LEDs. */
          LDR     R2, =KEY_BASE     /* Address of keys. */
LOOP:     LDR     R3, [R2]        	/* Read the state of keys. */
		      CMP	  R3, #0x00	  		/* Compare the value of R3 to 0x00 */
		      BLNE	  LEDON				/* Branch to KON if not equal */

		      B		  LOOP
.end
