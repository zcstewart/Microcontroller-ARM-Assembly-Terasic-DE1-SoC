//Zachary Stewart
//ECE118L Lab 11 Part 2
          .include "address_map_arm.s"

		  .text
          .global _start

// The loop is a counter that subtracts one from 0xA0 each repetition. 
// When the counter is zero, the program exits the loop.
// The frequency of the DE1-SoC board is 800MHz. The maximum conversion time
// for analog to digital conversion is 800ns according to the AD7928 datasheet
// The delay of 800ns with an 800MHz clock implies that 640 clock cycles need
// to be exectured. The delay subroutine has


		.type MHZ800DELAY, %function

MHZ800DELAY:
		  LDR	R4, =0x17D78400		/* Load 0xA0 into counter */
counter1:
		  SUB	R4, R4, #1			/* Decrement counter by 1 */
		  CMP   R4, #0				/* Compare counter to 0 */
		  BNE   counter1			/* Loop to top if not equal */
		  B		exit				/* Otherwise exit Loop */
exit:
		  BX	LR					/* Exit subroutine */

/////////////////////////////////////////////////////////////////////////////////

_start:
		  LDR	R0, =LEDR_BASE		/* Load address of LEDs to R0 */
		  LDR	R1, =ADC_BASE		/* Load address of ADC_BASE */
loopTOP:
		  MOV	R2, #1				/* Move 1 to R2 */
		  STR	R2, [R1]			/* Write 1 to Update Register */
		  PUSH	{LR}
		  BL	MHZ800DELAY
		  POP	{LR}
		  LDR	R3, [R1, #8]
		  LSR	R3, #2
		  STR	R3, [R0]
		  B		loopTOP
		.end
