//Zachary Stewart
//ECE118L Lab 9 Part5
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
		  MOV	  R6, #3			/* Counter variable for KEY3 sequence */
		  MOV	  R3, #0xF			/* Enable D0, D1, D2, and D3 as output */
		  STR	  R3, [R0, #4]		/* Store value to Data Direction Register */

loopTop:
		  LDR	  R5, =KEY_BASE		/* Load the address of the KEYs */
		  LDR	  R5, [R5]			/* Load the value of the KEYs to R5 */
		  CMP	  R5, #1			/* Check if first button is pressed */
		  BEQ	  rotateCW			/* Branch to rotateCW if pressed */
		  CMP	  R5, #2			/* Check if second button is pressed */
		  BEQ	  rotateCCW			/* Branch to rotateCCW if pressed */
		  CMP	  R5, #4			/* Check if third button is pressed */
		  BEQ	  rotate90			/* Branch to rotate90 if pressed */
		  B		  loopTop			/* Branch to loopTop */

//Sequence to rotate motor clockwise
rotateCW:
		  MOV	  R2, #9			/* Binary 1001 */
		  STR	  R2, [R0]			/* Store Value to JP2_BASE*/
		  PUSH	  {LR}				/* Push the Link Register to stack */
		  BL	  MHZ800DELAY		/* Branch to the MHZ800DELAY subroutine */
		  POP	  {LR}				/* Pop the Link Register from stack */
		  MOV	  R2, #5			/* Binary 1100 */
		  STR	  R2, [R0]			/* Store Value to JP2_BASE*/
		  PUSH	  {LR}				/* Push the Link Register to stack */
		  BL	  MHZ800DELAY		/* Branch to the MHZ800DELAY subroutine */
		  POP	  {LR}				/* Pop the Link Register from stack */
		  MOV	  R2, #6			/* Binary 0110 */
		  STR	  R2, [R0]			/* Store Value to JP2_BASE*/
		  PUSH	  {LR}				/* Push the Link Register to stack */
		  BL	  MHZ800DELAY		/* Branch to the MHZ800DELAY subroutine */
		  POP	  {LR}				/* Pop the Link Register from stack */
		  MOV	  R2, #10			/* Binary 0011 */
		  STR	  R2, [R0]			/* Store Value to JP2_BASE*/
		  PUSH	  {LR}				/* Push the Link Register to stack */
		  BL	  MHZ800DELAY		/* Branch to the MHZ800DELAY subroutine */
		  POP	  {LR}				/* Pop the Link Register from stack */
		  B		  loopTop			/* Branch to loopTop */


//Sequence to rotate motor counter-clockwise
rotateCCW:
		  MOV	  R2, #9			/* Binary 1001 */
		  STR	  R2, [R0]			/* Store the contents of R2 to JP2 GPIO */
		  PUSH	  {LR}				/* Push the Link Register to stack */
		  BL	  MHZ800DELAY		/* Branch to the MHZ800DELAY subroutine */
		  POP	  {LR}				/* Pop the Link Register from stack */
		  MOV	  R2, #10			/* Binary 0011 */
		  STR	  R2, [R0]			/* Store the contents of R2 to JP2 GPIO */
		  PUSH	  {LR}				/* Push the Link Register to stack */
		  BL	  MHZ800DELAY		/* Branch to the MHZ800DELAY subroutine */
		  POP	  {LR}				/* Pop the Link Register from stack */
		  MOV	  R2, #6			/* Binary 0110 */
		  STR	  R2, [R0]			/* Store the contents of R2 to JP2 GPIO */
		  PUSH	  {LR}				/* Push the Link Register to stack */
		  BL	  MHZ800DELAY		/* Branch to the MHZ800DELAY subroutine */
		  POP	  {LR}				/* Pop the Link Register from stack */
		  MOV	  R2, #5			/* Binary 1100 */
		  STR	  R2, [R0]			/* Store the contents of R2 to JP2 GPIO */
		  PUSH	  {LR}				/* Push the Link Register to stack */
		  BL	  MHZ800DELAY		/* Branch to the MHZ800DELAY subroutine */
		  POP	  {LR}				/* Pop the Link Register from stack */
		  B		  loopTop			/* Branch to loopTop */

rotate90:
		  MOV	  R2, #9			/* Binary 1001 */
		  STR	  R2, [R0]			/* Store the contents of R2 to JP2 GPIO */
		  PUSH	  {LR}				/* Push the Link Register to stack */
		  BL	  MHZ800DELAY		/* Branch to the MHZ800DELAY subroutine */
		  POP	  {LR}				/* Pop the Link Register from stack */
		  MOV	  R2, #5			/* Binary 1100 */
		  STR	  R2, [R0]			/* Store the contents of R2 to JP2 GPIO */
		  PUSH	  {LR}				/* Push the Link Register to stack */
		  BL	  MHZ800DELAY		/* Branch to the MHZ800DELAY subroutine */
		  POP	  {LR}				/* Pop the Link Register from stack */
		  MOV	  R2, #6			/* Binary 0110 */
		  STR	  R2, [R0]			/* Store the contents of R2 to JP2 GPIO */
		  PUSH	  {LR}				/* Push the Link Register to stack */
		  BL	  MHZ800DELAY		/* Branch to the MHZ800DELAY subroutine */
		  POP	  {LR}				/* Pop the Link Register from stack */
		  MOV	  R2, #10			/* Binary 0011 */
		  STR	  R2, [R0]			/* Store the contents of R2 to JP2 GPIO */
		  PUSH	  {LR}				/* Push the Link Register to stack */
		  BL	  MHZ800DELAY		/* Branch to the MHZ800DELAY subroutine */
		  POP	  {LR}				/* Pop the Link Register from stack */
		  SUB	  R6, R6, #1		/* Decrement counter variable by one */
		  CMP	  R6, #0			/* Compare counter variable to zero */
		  BEQ	  exitLoop			/* Branch to exitLoop if equal */
		  B		  rotate90			/* Branch to rotate90 otherwise */




exitLoop:
		  B		  exitLoop			/* Infinite loop for program execution */

