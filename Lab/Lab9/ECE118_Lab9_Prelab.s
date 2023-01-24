//Zachary Stewart
//ECE118L Lab 9 Prelab
          .include "address_map_arm.s"
	
		  .data

		  
		  .text
          .global _start

//The loop is a counter that subtracts one from 0BEBC200 each repetition. 
//When the counter is zero, the program exits the loop.
		.type MHZ800DELAY, %function

MHZ800DELAY:
		  LDR	R0, =0x17D78400		/* Load 0x0800 into counter */
counter1:
		  SUB	R0, R0, #1			/* Decrement counter by 1 */
		  CMP   R0, #0				/* Compare counter to 0 */
		  BNE   counter1			/* Loop to top if not equal */
		  B		exit				/* Otherwise exit Loop */
exit:
		  BX	LR					/* Exit subroutine */

//////////////////////////////////////////////////////////////////////////////////

_start:
		  LDR	  R0, =JP2_BASE		/* Load the address of the GPIO 2 pins */
		  MOV	  R3, #0xF			/* Enable D0, D1, D2, and D3 as output */
		  STR	  R3, [R0, #4]		/* Store value to Data Direction Register */ 

//Read the switch, determine direction to rotate motor
loopTop:
		  LDR	  R1, =SW_BASE		/* Load the address of the switches */
		  LDR	  R1, [R1]			/* Read the state of the switches */
		  CMP	  R1, #1			/* Check if the switch is on */	
		  BEQ	  rotateCCW			/* Branch to rotate counter-clockwise */

//Sequence to rotate motor clockwise
rotateCW:
		  MOV	  R2, #9			/* Binary 1001 */
		  STR	  R2, [R0]			/* Store Value to JP2_BASE*/
		  MOV	  R2, #12			/* Binary 1100 */
		  STR	  R2, [R0]			/* Store Value to JP2_BASE*/
		  MOV	  R2, #6			/* Binary 0110 */
		  STR	  R2, [R0]			/* Store Value to JP2_BASE*/
		  MOV	  R2, #3			/* Binary 0011 */
		  STR	  R2, [R0]			/* Store Value to JP2_BASE*/
		  B		  loopTop

//Sequence to rotate motor counter-clockwise
rotateCCW:
		  MOV	  R2, #9			/* Binary 1001 */
		  STR	  R2, [R0]
		  MOV	  R2, #3			/* Binary 0011 */
		  STR	  R2, [R0]
		  MOV	  R2, #6			/* Binary 0110 */
		  STR	  R2, [R0]
		  MOV	  R2, #12			/* Binary 1100 */
		  STR	  R2, [R0]
		  B		  loopTop

final:
		  B 	  final				/* Branch to final */

.end
