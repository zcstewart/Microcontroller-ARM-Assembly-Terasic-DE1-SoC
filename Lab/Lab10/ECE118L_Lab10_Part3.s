//Zachary Stewart
//ECE118L Lab 10 Part 3
          .include "address_map_arm.s"
		  .include "SevenSegmentLookUpTable.s"

		  .text
          .global _start

//The loop is a counter that subtracts one from 59B8C0 each repetition. 
//When the counter is zero, the program exits the loop.
		.type MHZ800DELAY, %function
MHZ800DELAY:
//0x23C34600 Former Counter value
		  LDR	R4, =0x59B8C0		/* Load 0x59B8C0 into counter */
counter1:
		  LDR	R5, [R6, #0x10] 	/* Check S-Bit from Interrupt Status Register */
		  AND	R5, R5, #0x1		/* Mask bit */
		  CMP	R5, #1				/* Check if S bit is 1 */
		  BNE	DELAY_RESUME		/* Skip to decrement counter */
		  PUSH	{LR}				/* PUSH Link Register to the Stack */
		  BL	HPS_TIMER_ISR		/* Branch to HPS_TIMER_ISR */
		  POP	{LR}				/* POP Link Register from the Stack */
DELAY_RESUME:
		  SUB	R4, R4, #1			/* Decrement counter by 1 */
		  CMP   R4, #0				/* Compare counter to 0 */
		  BNE   counter1			/* Loop to top if not equal */
		  BEQ	exitDELAY			/* Exit the delay subroutine */
exitDELAY:
		  BX	LR					/* Exit subroutine */

/////////////////////////////////////////////////////////////////////////////////
// This subroutine determines which value to display on the HEX4 7-segment
// display. The counter counts from 0 to 9, and the relevant value
// of the 7-segment display is shown according the the counter value. The
// S and F bits are reset by loading from the register before exiting
// the subroutine
		  .type HPS_TIMER_ISR, %function
HPS_TIMER_ISR:
		  CMP	R8, #0			/* Compare HPS counter to 0 */
		  BEQ	HPS_0			/* Branch to HPS_0 */
HPS_0_RETURN:
		  CMP	R8, #1			/* Compare HPS counter to 1 */
		  BEQ	HPS_1			/* Branch to HPS_1 */
HPS_1_RETURN:
		  CMP	R8, #2			/* Compare HPS counter to 2 */
		  BEQ	HPS_2			/* Branch to HPS_2 */
HPS_2_RETURN:
		  CMP	R8, #3			/* Compare HPS counter to 3 */
		  BEQ	HPS_3			/* Branch to HPS_3 */
HPS_3_RETURN:
		  CMP	R8, #4			/* Compare HPS counter to 4 */
		  BEQ	HPS_4			/* Branch to HPS_4 */
HPS_4_RETURN:
		  CMP	R8, #5			/* Compare HPS counter to 5 */
		  BEQ	HPS_5			/* Branch to HPS_5 */
HPS_5_RETURN:
		  CMP	R8, #6			/* Compare HPS counter to 6 */
		  BEQ	HPS_6			/* Branch to HPS_6 */
HPS_6_RETURN:
		  CMP	R8, #7			/* Compare HPS counter to 7 */
		  BEQ	HPS_7			/* Branch to HPS_7 */
HPS_7_RETURN:
		  CMP	R8, #8			/* Compare HPS counter to 8 */
		  BEQ	HPS_8			/* Branch to HPS_8 */
HPS_8_RETURN:
		  CMP	R8, #9			/* Compare HPS counter to 9 */
		  BEQ	HPS_9			/* Branch to HPS_9 */
HPS_9_RETURN:

INCREMENT_COUNTER:
		  ADD	R8, R8, #1		/* Increment HPS Counter */
		  CMP	R8, #10			/* Compare HPS Counter to 10 */
		  MOVEQ	R8, #0			/* Reset HPS Counter to 0 if 10 */
		  LDR	R5, [R6, #0XC]	/* Read from End-of-Interrupt to reset */
HPS_EXIT:
		  BX	LR				/* Exit HPS Subroutine */
HPS_0:
		  LDR	R2, =ZERO		/* Load 7-Seg value for 0 */
		  STR	R2, [R1]		/* Store R2 to HEX4 */
		  B		HPS_0_RETURN	/* HPS_0_RETURN */
HPS_1:
		  LDR	R2, =ONE		/* Load 7-Seg value for 1 */
		  STR	R2, [R1]		/* Store R2 to HEX4 */
		  B		HPS_1_RETURN	/* HPS_1_RETURN */
HPS_2:
		  LDR	R2, =TWO		/* Load 7-Seg value for 2 */
		  STR	R2, [R1]		/* Store R2 to HEX4 */
		  B		HPS_2_RETURN	/* HPS_2_RETURN */
HPS_3:
		  LDR	R2, =THREE		/* Load 7-Seg value for 3 */
		  STR	R2, [R1]		/* Store R2 to HEX4 */
		  B		HPS_3_RETURN	/* HPS_3_RETURN */
HPS_4:
		  LDR	R2, =FOUR		/* Load 7-Seg value for 4 */
		  STR	R2, [R1]		/* Store R2 to HEX4 */
		  B		HPS_4_RETURN	/* HPS_4_RETURN */
HPS_5:
		  LDR	R2, =FIVE		/* Load 7-Seg value for 5 */
		  STR	R2, [R1]		/* Store R2 to HEX4 */
		  B		HPS_5_RETURN	/* HPS_5_RETURN */
HPS_6:
		  LDR	R2, =SIX		/* Load 7-Seg value for 6 */
		  STR	R2, [R1]		/* Store R2 to HEX4 */
		  B		HPS_6_RETURN	/* HPS_6_RETURN */
HPS_7:
		  LDR	R2, =SEVEN		/* Load 7-Seg value for 7 */
		  STR	R2, [R1]		/* Store R2 to HEX4 */
		  B		HPS_7_RETURN	/* HPS_7_RETURN */
HPS_8:
		  LDR	R2, =EIGHT		/* Load 7-Seg value for 8 */
		  STR	R2, [R1]		/* Store R2 to HEX4 */
		  B		HPS_8_RETURN	/* HPS_8_RETURN */
HPS_9:
		  LDR	R2, =NINE		/* Load 7-Seg value for 9 */
		  STR	R2, [R1]		/* Store R2 to HEX4 */
		  B		HPS_9_RETURN	/* HPS_9_RETURN */






/////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////

_start:

		  LDR	R0, =HEX3_HEX0_BASE /* Load address of HEX1, HEX2, HEX3, and HEX4 */
		  LDR	R1, =HEX5_HEX4_BASE	/* Load address of HEX4 and HEX5 */
		  LDR	R6, =HPS_TIMER0_BASE/* Load address of HPS_TIMER_BASE */
		  MOV	R7, #0				/* Counter for delay subroutine */
		  MOV	R8, #0				/* Counter for HPS */

HPS_SETUP:
		  MOV	R4, #0b110			/* Set I to 1, M to 1, E to 0 */
		  STR	R4, [R6, #0x8]		/* Store bits to Control Register */
		  LDR	R4, =0x47868C0		/* Load counter value */
		  STR	R4, [R6]			/* Store counter value to Load Register */
		  MOV	R4, #0b011			/* Set I to 0, M to 1, E to 1 */
		  STR	R4, [R6, #0x8]		/* Store bits to Control Register */ 

SEVEN_SEG_DELAYSEQ:
		  LDR	R5, [R6, #0x10] 	/* Check S-Bit from Interrupt Status Register */
		  AND	R5, R5, #0x1		/* Mask bit */
		  CMP	R5, #1				/* Compare masked bit to 1 */
		  BNE	NEXT_0				/* Branch to NEXT_0 if not equal */
		  PUSH	{LR}				/* PUSH Link Register to Stack */
		  BL	HPS_TIMER_ISR		/* Branch to HPS_TIMER_ISR */
		  POP	{LR}				/* POP Link Register from Stack */

NEXT_0:
		  CMP	R7, #0				/* Compare HEX1 Counter to 0 */
		  BEQ	HEX_0				/* Branch to HEX_0 if equal */
RETURN_0:
		  LDR	R5, [R6, #0x10] 	/* Check S-Bit from Interrupt Status Register */
		  AND	R5, R5, #0x1		/* Mask bit */
		  CMP	R5, #1				/* Compare masked bit to 1 */
		  BNE	NEXT_1				/* Branch to NEXT_1 if not equal */
		  PUSH	{LR}				/* PUSH Link Register to Stack */
		  BL	HPS_TIMER_ISR		/* Branch to HPS_TIMER_ISR */
		  POP	{LR}				/* POP Link Register from Stack */
NEXT_1:
		  CMP	R7, #1				/* Compare HEX1 Counter to 1 */
		  BEQ	HEX_1				/* Branch to HEX_1 if equal */
RETURN_1:
		  LDR	R5, [R6, #0x10] 	/* Check S-Bit from Interrupt Status Register */
		  AND	R5, R5, #0x1		/* Mask bit */
		  CMP	R5, #1				/* Compare masked bit to 1 */
		  BNE	NEXT_2				/* Branch to NEXT_2 if not equal */
		  PUSH	{LR}				/* PUSH Link Register to Stack */
		  BL	HPS_TIMER_ISR		/* Branch to HPS_TIMER_ISR */
		  POP	{LR}				/* POP Link Register from Stack */
NEXT_2:
		  CMP	R7, #2				/* Compare HEX1 Counter to 2 */
		  BEQ	HEX_2				/* Branch to HEX_2 if equal */
RETURN_2:
		  LDR	R5, [R6, #0x10] 	/* Check S-Bit from Interrupt Status Register */
		  AND	R5, R5, #0x1		/* Mask bit */
		  CMP	R5, #1				/* Compare masked bit to 1 */
		  BNE	NEXT_3				/* Branch to NEXT_3 if not equal */
		  PUSH	{LR}				/* PUSH Link Register to Stack */
		  BL	HPS_TIMER_ISR		/* Branch to HPS_TIMER_ISR */
		  POP	{LR}				/* POP Link Register from Stack */
NEXT_3:
		  CMP	R7, #3				/* Compare HEX1 Counter to 3 */
		  BEQ	HEX_3				/* Branch to HEX_3 if equal */
RETURN_3:
		  LDR	R5, [R6, #0x10] 	/* Check S-Bit from Interrupt Status Register */
		  AND	R5, R5, #0x1		/* Mask bit */
		  CMP	R5, #1				/* Compare masked bit to 1 */
		  BNE	NEXT_4				/* Branch to NEXT_4 if not equal */
		  PUSH	{LR}				/* PUSH Link Register to Stack */
		  BL	HPS_TIMER_ISR		/* Branch to HPS_TIMER_ISR */
		  POP	{LR}				/* POP Link Register from Stack */
NEXT_4:
		  CMP	R7, #4				/* Compare HEX1 Counter to 4 */
		  BEQ	HEX_4				/* Branch to HEX_4 if equal */
RETURN_4:
		  LDR	R5, [R6, #0x10] 	/* Check S-Bit from Interrupt Status Register */
		  AND	R5, R5, #0x1		/* Mask bit */
		  CMP	R5, #1				/* Compare masked bit to 1 */
		  BNE	NEXT_5				/* Branch to NEXT_5 if not equal */
		  PUSH	{LR}				/* PUSH Link Register to Stack */
		  BL	HPS_TIMER_ISR		/* Branch to HPS_TIMER_ISR */
		  POP	{LR}				/* POP Link Register from Stack */
NEXT_5:
		  CMP	R7, #5				/* Compare HEX1 Counter to 5 */
		  BEQ	HEX_5				/* Branch to HEX_5 if equal */
RETURN_5:
		  LDR	R5, [R6, #0x10] 	/* Check S-Bit from Interrupt Status Register */
		  AND	R5, R5, #0x1		/* Mask bit */
		  CMP	R5, #1				/* Compare masked bit to 1 */
		  BNE	NEXT_6				/* Branch to NEXT_6 if not equal */
		  PUSH	{LR}				/* PUSH Link Register to Stack */
		  BL	HPS_TIMER_ISR		/* Branch to HPS_TIMER_ISR */
		  POP	{LR}				/* POP Link Register from Stack */
NEXT_6:
		  CMP	R7, #6				/* Compare HEX1 Counter to 6 */
		  BEQ	HEX_6				/* Branch to HEX_6 if equal */
RETURN_6:
		  LDR	R5, [R6, #0x10] 	/* Check S-Bit from Interrupt Status Register */
		  AND	R5, R5, #0x1		/* Mask bit */
		  CMP	R5, #1				/* Compare masked bit to 1 */
		  BNE	NEXT_7				/* Branch to NEXT_7 if not equal */
		  PUSH	{LR}				/* PUSH Link Register to Stack */
		  BL	HPS_TIMER_ISR		/* Branch to HPS_TIMER_ISR */
		  POP	{LR}				/* POP Link Register from Stack */
NEXT_7:
		  CMP	R7, #7				/* Compare HEX1 Counter to 7 */
		  BEQ	HEX_7				/* Branch to HEX_7 if equal */
RETURN_7:
		  LDR	R5, [R6, #0x10] 	/* Check S-Bit from Interrupt Status Register */
		  AND	R5, R5, #0x1		/* Mask bit */
		  CMP	R5, #1				/* Compare masked bit to 1 */
		  BNE	NEXT_8				/* Branch to NEXT_8 if not equal */
		  PUSH	{LR}				/* PUSH Link Register to Stack */
		  BL	HPS_TIMER_ISR		/* Branch to HPS_TIMER_ISR */
		  POP	{LR}				/* POP Link Register from Stack */
NEXT_8:
		  CMP	R7, #8				/* Compare HEX1 Counter to 8 */
		  BEQ	HEX_8				/* Branch to HEX_8 if equal */
RETURN_8:
		  LDR	R5, [R6, #0x10] 	/* Check S-Bit from Interrupt Status Register */
		  AND	R5, R5, #0x1		/* Mask bit */
		  CMP	R5, #1				/* Compare masked bit to 1 */
		  BNE	NEXT_9				/* Branch to NEXT_9 if not equal */
		  PUSH	{LR}				/* PUSH Link Register to Stack */
		  BL	HPS_TIMER_ISR		/* Branch to HPS_TIMER_ISR */
		  POP	{LR}				/* POP Link Register from Stack */
NEXT_9:
		  CMP	R7, #9				/* Compare HEX1 Counter to 9 */
		  BEQ	HEX_9				/* Branch to HEX_9 if equal */
RETURN_9:
		  LDR	R5, [R6, #0x10] 	/* Check S-Bit from Interrupt Status Register */
		  AND	R5, R5, #0x1		/* Mask bit */
		  CMP	R5, #1				/* Compare masked bit to 1 */
		  BNE	INCREMENT_COUNTER_R7/* INCREMENT_COUNTER_R7 */
		  PUSH	{LR}				/* PUSH Link Register to Stack */
		  BL	HPS_TIMER_ISR		/* Branch to HPS_TIMER_ISR */
		  POP	{LR}				/* POP Link Register from Stack */

INCREMENT_COUNTER_R7:
		  ADD	R7, R7, #1			/* Increment HEX1 Counter */
		  CMP	R7, #10				/* Compare counter to 10 */
		  MOVEQ	R7, #0				/* Reset counter to 0 if equal */
		  B		SEVEN_SEG_DELAYSEQ	/* Branch to SEVEN_SEG_DELAYSEQ */

HEX_0:
		  LDR 	R2, =ZERO		/* Load 7-Seg value for 0 to R2 */
		  STR	R2, [R0]		/* Store 7-seg Value to HEX1 */
		  PUSH	{LR}			/* PUSH Link Register to Stack */
		  BL	MHZ800DELAY		/* Branch to the MHZ800DELAY */
		  POP	{LR}			/* POP Link Register from Stack */
		  B		RETURN_0		/* Branch to RETURN_0 */

HEX_1:
		  LDR 	R2, =ONE		/* Load 7-Seg value for 1 to R2 */
		  STR	R2, [R0]		/* Store 7-seg Value to HEX1 */
		  PUSH	{LR}			/* PUSH Link Register to Stack */
		  BL	MHZ800DELAY		/* Branch to the MHZ800DELAY */
		  POP	{LR}			/* POP Link Register from Stack */
		  B		RETURN_1		/* Branch to RETURN_1 */

HEX_2:
		  LDR 	R2, =TWO		/* Load 7-Seg value for 2 to R2 */
		  STR	R2, [R0]		/* Store 7-seg Value to HEX1 */
		  PUSH	{LR}			/* PUSH Link Register to Stack */
		  BL	MHZ800DELAY		/* Branch to the MHZ800DELAY */
		  POP	{LR}			/* POP Link Register from Stack */
		  B		RETURN_2		/* Branch to RETURN_2 */

HEX_3:
		  LDR   R2, =THREE		/* Load 7-Seg value for 3 to R2 */
		  STR	R2, [R0]		/* Store 7-seg Value to HEX1 */
		  PUSH	{LR}			/* PUSH Link Register to Stack */
		  BL	MHZ800DELAY		/* Branch to the MHZ800DELAY */
		  POP	{LR}			/* POP Link Register from Stack */
		  B		RETURN_3		/* Branch to RETURN_3 */

HEX_4:
		  LDR	R2, =FOUR		/* Load 7-Seg value for 4 to R2 */			
		  STR	R2, [R0]		/* Store 7-seg Value to HEX1 */
		  PUSH	{LR}			/* PUSH Link Register to Stack */
		  BL	MHZ800DELAY		/* Branch to the MHZ800DELAY */
		  POP	{LR}			/* POP Link Register from Stack */
		  B		RETURN_4		/* Branch to RETURN_4 */

HEX_5:
		  LDR	R2, =FIVE		/* Load 7-Seg value for 5 to R2 */
		  STR	R2, [R0]		/* Store 7-seg Value to HEX1 */
		  PUSH	{LR}			/* PUSH Link Register to Stack */
		  BL	MHZ800DELAY		/* Branch to the MHZ800DELAY */
		  POP	{LR}			/* POP Link Register from Stack */
		  B		RETURN_5		/* Branch to RETURN_5 */

HEX_6:
		  LDR	R2, =SIX		/* Load 7-Seg value for 6 to R2 */
		  STR	R2, [R0]		/* Store 7-seg Value to HEX1 */
		  PUSH	{LR}			/* PUSH Link Register to Stack */
		  BL	MHZ800DELAY		/* Branch to the MHZ800DELAY */
		  POP	{LR}			/* POP Link Register from Stack */
		  B		RETURN_6		/* Branch to RETURN_6 */

HEX_7:
		  LDR	R2, =SEVEN		/* Load 7-Seg value for 7 to R2 */
		  STR	R2, [R0]		/* Store 7-seg Value to HEX1 */
		  PUSH	{LR}			/* PUSH Link Register to Stack */
		  BL	MHZ800DELAY		/* Branch to the MHZ800DELAY */
		  POP	{LR}			/* POP Link Register from Stack */
		  B		RETURN_7		/* Branch to RETURN_7 */

HEX_8:
		  LDR	R2, =EIGHT		/* Load 7-Seg value for 8 to R2 */
		  STR	R2, [R0]		/* Store 7-seg Value to HEX1 */
		  PUSH	{LR}			/* PUSH Link Register to Stack */
		  BL	MHZ800DELAY		/* Branch to the MHZ800DELAY */
		  POP	{LR}			/* POP Link Register from Stack */
		  B		RETURN_8		/* Branch to RETURN_8 */

HEX_9:
		  LDR	R2, =NINE		/* Load 7-Seg value for 9 to R2 */
		  STR	R2, [R0]		/* Store 7-seg Value to HEX1 */
		  PUSH	{LR}			/* PUSH Link Register to Stack */
		  BL	MHZ800DELAY		/* Branch to the MHZ800DELAY */
		  POP	{LR}			/* POP Link Register from Stack */
		  B		RETURN_9		/* Branch to RETURN_9 */

		.end
