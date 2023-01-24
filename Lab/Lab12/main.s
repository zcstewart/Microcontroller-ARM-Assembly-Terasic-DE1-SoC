//Zachary Stewart
//ECE118L Lab 12 Part2
          .include "address_map_arm.s"

		  .text
          .global _start

//
		.type MHZ800DELAY, %function


		  B		exit				/* Otherwise exit Loop */
exit:
		  BX	LR					/* Exit subroutine */

/////////////////////////////////////////////////////////////////////////////////


_start:
		  LDR	  R6, =JP2_BASE		/* Load the address of the GPIO 2 pins */
		  MOV	  R3, #0x1			/* Enable D0 as output */
		  STR	  R3, [R6, #4]		/* Store value to Data Direction Register */ 
		  MOV	  R3, #0x0			/* Move zero to R3 */
		  STR	  R3, [R6]			/* Store zero to Data Register */
		  
		  B		  deadLOOP

deadLOOP:
		  B		  deadLOOP


