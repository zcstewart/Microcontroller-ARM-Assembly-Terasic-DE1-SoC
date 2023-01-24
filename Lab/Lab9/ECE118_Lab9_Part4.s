//Zachary Stewart
//ECE118L Lab 9 Part4
          .include "address_map_arm.s"

		  .text
          .global _start

//The loop is a counter that subtracts one from 0BEBC200 each repetition. 
//When the counter is zero, the program exits the loop.
		.type MHZ800DELAY, %function

MHZ800DELAY:
		  LDR	R4, =0x17D78400		/* Load 0x0800 into counter */
counter1:
		  SUB	R4, R4, #1			/* Decrement counter by 1 */
		  CMP   R4, #0				/* Compare counter to 0 */
		  BNE   counter1			/* Loop to top if not equal */
		  B		exit				/* Otherwise exit Loop */
exit:
		  BX	LR					/* Exit subroutine */

/////////////////////////////////////////////////////////////////////////////////


_start:
		  LDR	  R0, =JP2_BASE		/* Load the address of the GPIO 2 pins */
		  MOV	  R3, #0xF			/* Enable D0, D1, D2, and D3 as output */
		  STR	  R3, [R0, #4]		/* Store value to Data Direction Register */ 

LED_Sequence:
		  MOV	  R3, #0xA			/* Move Binary 1010 to R3 */
		  STR	  R3, [R0]			/* Store Value to JP2_BASE*/
		  PUSH	  {LR}				/* Push the Link Register to stack */
		  BL	  MHZ800DELAY		/* Branch to the MHZ800DELAY subroutine */
		  POP	  {LR}				/* Pop the Link Register from stack */
		  MOV	  R3, #0x5			/* Move Binar 0101 to R3 */
		  STR	  R3, [R0]			/* Store Value to JP2_BASE*/
		  PUSH	  {LR}				/* Push the Link Register to stack */
		  BL	  MHZ800DELAY		/* Branch to the MHZ800DELAY subroutine */
		  POP	  {LR}				/* Pop the Link Register from stack */
		  B		  LED_Sequence		/* Branch to LED_Sequence to loop */
