/* 
	Zachary Stewart
	ECE 118L
	Lab 7 Part 1
*/
//		 	 C0 C1 C2 C3 C4 C5 C6 C7 C8 C9
array:  .word 0, 1, 0, 1, 0, 0, 0, 0, 1, 1	//R0	A	
	 	.word 1, 0, 0, 0, 0, 0, 0, 0, 0, 0	//R1	B
	 	.word 0, 0, 0, 1, 0, 0, 0, 0, 0, 0	//R2	C
	 	.word 1, 0, 1, 0, 0, 0, 1, 1, 0, 0	//R3	D
	 	.word 0, 0, 0, 0, 0, 0, 0, 0, 0, 1	//R4	E
	 	.word 0, 0, 0, 0, 0, 0, 0, 0, 0, 1	//R5	F
	 	.word 0, 0, 0, 1, 0, 0, 0, 0, 0, 0	//R6	G
	 	.word 0, 0, 0, 1, 0, 0, 0, 0, 0, 0	//R7	H
	 	.word 1, 0, 0, 0, 0, 0, 0, 0, 0, 0	//R8	I
	 	.word 1, 0, 0, 0, 1, 1, 0, 0, 0, 0	//R9	J

		.text
		.global _start

//Program Start
_start:
		MOV	  R1, #0x00		/* Current Row */
		MOV   R2, #0x00		/* Current Column */
		MOV   R4, #0x00		/* Next Address */
		LDR   R0, =array	/* First memory location of array */
		LDR	  R11, =0x4		/* elementSize */
		LDR	  R10, =0xA		/* Row size */
loopTOP:
		LDR   R0, =array	/* First memory location of array */
		MUL	  R4, R1, R10   /* Multiply Row by Row Size, Store result in R4 */
		ADD	  R4, R4, R2	/* Add current column to R4, Store result in R4 */
		MUL	  R4, R4, R11   /* Mutiply element size by result */
		ADD   R0, R0, R4	/* Increment current address appropriately */
		LDR	  R5, [R0]		/* Load contents of array to R5 */
		PUSH  {R5}			/* Push value to stack */
		ADD	  R2, R2, #1	/* Increment Column */
		CMP	  R2, #10		/* Compare current column to column limit */
		BNE	  loopTOP		/* Branch to top of loop */
		BEQ	  updateROW		/* Branch to updateROW */
updateROW:
		MOV	  R2, #0x00		/* Reset Column to 0 */
		ADD	  R1, R1, #1	/* Increment Row by 1 */
		CMP   R1, R10		/* Compare current row to ten */
		BEQ	  discardLOOP	/* Array traversed, branch to pop off data */
		BNE	  loopTOP		/* Array still needs traversing, branch to loop top */
discardLOOP:
		MOV	  R4, #0x64		/* Load 100 (Hex 0x64) for counter */
dLOOPtop:
		POP	  {R0}			/* Pop data from stack to R0 */
		SUB	  R4, R4, #1	/* Decrement counter by one */
		CMP   R4, #0x00		/* Compare counter value to zero */
		BEQ	  exitLOOP		/* Branch to exitLOOP if zero */
		BNE	  dLOOPtop   	/* Loop to top, continue discarding data */
exitLOOP:
		B	  exitLOOP		/* Branch to exitLOOP (infinite loop) */
.end
