/* 
	Zachary Stewart
	ECE 118L
	Lab 7 Part 3
*/

          .include "address_map_arm.s"
		  .include "Lab7_Part3_DelaySubroutine.s"

// Array 
//			  A     B     C     D     E     F     G     H     I     J
//		 	  C0 	C1 	  C2 	C3 	  C4 	C5 	  C6 	C7 	  C8 	C9
array:  .word 0x00, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01	//R0	A	
	 	.word 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00	//R1	B
	 	.word 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00	//R2	C
	 	.word 0x01, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00	//R3	D
	 	.word 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01	//R4	E
	 	.word 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01	//R5	F
	 	.word 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00	//R6	G
	 	.word 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00	//R7	H
	 	.word 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00	//R8	I
	 	.word 0x01, 0x00, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00	//R9	J

// Vector to determine final order of Depth First Traversal
checkOff:
// Checkoff table to determine order of traversal
// Row order  0	   1	 2	   3     4     5	 6	   7	 8	   9
		.word 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF

fOrder:
//Table lists final order of traversal
		.word 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF

		.type DFT %function
DFT:
labelExplored:
		LDR	  R3, =0x00		/* Initialize memoryIncrement to zero */
		LDR   R0, =array	/* Load array holding graph data */
		LDR	  R4, =checkOff	/* Load checkoff table array */
		MUL	  R3, R1, R11   /* Multiply row by element size, store result in R3 */
							/* This is done to determine checkoff memory increment */
		ADD	  R4, R4, R3	/* Increment checkoff table address to mark visit */
		STR	  R1, [R4]		/* Store current row to R4 */
		CMP	  R2, #0x00		/* Compare column to 0 */
		BEQ	  calcAddress	/* Branch to address calculation if equal */
		BNE	  loadNext		/* Branch to loadNext */
loadNext:
		LDR   R0, =array	/* Load array holding graph data */
		ADD	  R2, R2, #1	/* Increment column by one */
		CMP	  R2, R10		/* Check to make sure R2 doesn't exceed length */
		BEQ	  leaveDFT		/* leave subroutine */
calcAddress:
		MUL	  R3, R1, R10   /* Multiply current row by row size, store result in R3 */
		ADD	  R3, R3, R2	/* Add current column to R3, store result in R3 */
		MUL	  R3, R3, R11   /* Mutiply element size by result */
		ADD   R0, R0, R3	/* Increment current address appropriately */
checkContents:
		LDR	  R5, [R0]		/* Load contents of array to R5 */
		CMP	  R5, #0x00		/* Compare contents of R5 to 0 */
		BNE	  checkExplored	/* If vertex exists, check if explored */
		BEQ	  loadNext		/* Else, increment to next column */
checkExplored:
		LDR	  R4, =checkOff	/* Initialize checkoff table address */
		MUL	  R3, R2, R11   /* Multiply column by element size, store result in R3 */
							/* This is done to determine checkoff memory increment */
		ADD	  R4, R4, R3	/* Increment checkoff table address to mark visit */
		LDR	  R8, [R4]		/* Load contents of lookup table to R8 */
		CMP	  R8, #0xFF		/* Compare lookup table contents to 0xFF */
		BEQ	  recDFT		/* Branch to recursive function call */
		BNE	  loadNext		/* Branch to load next element from column */ 
recDFT:
		STR	  R2, [R4]		/* Store current col to R4 */
		STR	  R2, [R6], #4	/* Add column to array containing traversal order */
		B	  activateLED	/* Branch to activateLED */
LEDreturn:
		PUSH  {R1}			/* Push current row to stack */
		PUSH  {R2}			/* Push current col to stack */
		PUSH  {LR}			/* Push the link register to stack */
		MOV	  R1, R2		/* Move current Row to current Column */
		LDR	  R2, =0x00		/* Set current col to zero */
		BL	  DFT			/* Branch to DFT subroutine */
		POP   {LR}			/* Push the link register to stack */
		POP   {R2}			/* Push current col to stack */
		POP   {R1}			/* Push current row to stack */
		CMP	  R2, R10		/* Check to make sure R2 doesn't exceed length */
		BNE	  loadNext		/* Continue with traversal */
		BEQ	  leaveDFT		/* Recursively backtrack becuase row has been traversed*/
leaveDFT:
		BX	 LR

		.text
		.global _start

//Program Start
_start:
		LDR	  R1, =0x05		/* Current Row */
		LDR   R2, =0x00		/* Current Column */
		LDR   R3, =0x00		/* Next Address */
		LDR   R0, =array	/* Load array holding graph data */
		LDR   R4, =checkOff	/* Load checkoff table array */
		LDR	  R6, =fOrder	/* Load array containing traversal order */
		LDR	  R7, =LEDR_BASE/* Load address of LEDs */
		LDR	  R11, =0x4		/* elementSize */
		LDR	  R10, =0xA		/* Row size */
// For the initial conditions, the ROW is stored to the array holding the traversal order
// The number ten also has the initial row subtracted from it to determine the amount
// to shift left by. For the remainder of the program, the column will be used to 
// store the traversal order, as well as determine which LEDs to illuminate.
		STR	  R1, [R6], #4	/* Add row to array containing traversal order */
		MOV	  R3, #0x9		/* Move the value of nine to R3 */
		SUB	  R3, R3, R1	/* Subtract Row from R3, store in R3 */
		MOV	  R0, #0x01		/* Move 1 into R0 */
		LSL	  R0, R3		/* Logical Shift Left of R0 by R3 */
		STR	  R0, [R7]		/* Store Row to R7 to illuminate LED */
		PUSH  {LR}			/* PUSH LR to stack */
		BL	  MHZ800DELAY	/* Branch to MHZ800DELAY Subroutine */
		POP	  {LR}			/* POP LR from stack */
		BL    DFT			/* Branch to DepthFirstTraversal Subroutine */
loop:	B	  loop			/* Branch to loop */ 

activateLED:
		MOV	  R4, #0x9		/* Move the value of ten to R3 */
		SUB	  R4, R4, R2	/* Subtract Col from R3, store in R3 */
		MOV	  R0, #0x01		/* Move 1 into R0 */
		LSL	  R0, R4		/* Logical Shift Left of R0 by R3 */
		LDR	  R4, [R7]		/* Load current LED value */
		ADD	  R4, R0		/* Add shifted bit to R4 */
		STR	  R4, [R7]		/* Store new R4 value to LEDs */
		PUSH  {LR}			/* PUSH LR to stack */
		BL	  MHZ800DELAY	/* Branch to MHZ800DELAY Subroutine */
		POP	  {LR}			/* POP LR from stack */
		B	  LEDreturn 	/* Branch to LED return */


		
		
		
