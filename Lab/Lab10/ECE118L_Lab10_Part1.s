//Zachary Stewart
//ECE118L Lab 10 Part 1
          .include "address_map_arm.s"

		  .text
          .global _start

//The loop is a counter that subtracts one from 0BEBC200 each repetition. 
//When the counter is zero, the program exits the loop.
		.type MHZ800DELAY, %function

MHZ800DELAY:
		  LDR	R4, =0x23C34600		/* Load 0x23C34600 into counter */
counter1:
		  SUB	R4, R4, #1			/* Decrement counter by 1 */
		  CMP   R4, #0				/* Compare counter to 0 */
		  BNE   counter1			/* Loop to top if not equal */
		  B		exit				/* Otherwise exit Loop */
exit:
		  BX	LR					/* Exit subroutine */

/////////////////////////////////////////////////////////////////////////////////

_start:

		.end
