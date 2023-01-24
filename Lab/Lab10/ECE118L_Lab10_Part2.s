//Zachary Stewart
//ECE118L Lab 10 Part 2
          .include "address_map_arm.s"
		  .include "SevenSegmentLookUpTable.s"

		  .text
          .global _start

//The loop is a MPCORE timer that subtracts one from 0BEBC200 each repetition. 
//When the counter is zero, the program exits the loop.
		.type MPCORE_TIMER, %function

MPCORE_TIMER:

loopTop:
		  LDR	R1, [R5, #12]		/* Load From ISR Register */
		  AND	R3, R1, #1			/* Mask bit with 1 */
		  CMP	R3, #1				/* Compare masked bit to 1 */
		  BNE	loopTop				/* Branch to loop top if not equal */
		  MOV	R1, #1				/* Enable Interrupt bit*/
		  STR	R1,	[R5, #12] 		/* Store to Control Register */
exit:1
		  BX	LR					/* Exit subroutine */

/////////////////////////////////////////////////////////////////////////////////

_start:
		  LDR	R0, =0xFF200020 /* Load address of 7-Seg Displays */
		  LDR	R5, =MPCORE_PRIV_TIMER /* MPCORE Base Address */
		  LDR	R4, =0xBEBC200		/* Load  counter for MPOCORE Timer */
		  STR	R4, [R5]		/* Store counter to Load Register */
		  LDR	R4, =0x103		/* Set Enable Bit and Auto-Restart */
		  STR	R4, [R5, #8]	/* Store Enable Bit to Control Register */
SEVEN_SEG_Sequence:
		  LDR	R2, =ZERO		/* Load 7-Segment value for ZERO */
		  STR	R2, [R0]		/* Store value to 7-Seg Register */
		  PUSH	{LR}			/* PUSH Link Register to Stack */
		  BL	MPCORE_TIMER	/* Branch to MPCORE_TIMER label */
		  POP	{LR}			/* POP Link Register from Stack */
		  LDR	R2, =ONE		/* Load 7-Segment value for ONE */
		  STR	R2, [R0]		/* Store value to 7-Seg Register */
		  PUSH	{LR}			/* PUSH Link Register to Stack */
		  BL	MPCORE_TIMER	/* Branch to MPCORE_TIMER label */
		  POP	{LR}			/* POP Link Register from Stack */
		  LDR	R2, =TWO		/* Load 7-Segment value for TWO */
		  STR	R2, [R0]		/* Store value to 7-Seg Register */
		  PUSH	{LR}			/* PUSH Link Register to Stack */
		  BL	MPCORE_TIMER	/* Branch to MPCORE_TIMER label */
		  POP	{LR}			/* POP Link Register from Stack */
		  LDR	R2, =THREE		/* Load 7-Segment value for THREE */
		  STR	R2, [R0]		/* Store value to 7-Seg Register */
		  PUSH	{LR}			/* PUSH Link Register to Stack */
		  BL	MPCORE_TIMER	/* Branch to MPCORE_TIMER label */
		  POP	{LR}			/* POP Link Register from Stack */
		  LDR	R2, =FOUR		/* Load 7-Segment value for FOUR */
		  STR	R2, [R0]		/* Store value to 7-Seg Register */
		  PUSH	{LR}			/* PUSH Link Register to Stack */
		  BL	MPCORE_TIMER	/* Branch to MPCORE_TIMER label */
		  POP	{LR}			/* POP Link Register from Stack */
		  LDR	R2, =FIVE		/* Load 7-Segment value for FIVE */
		  STR	R2, [R0]		/* Store value to 7-Seg Register */
		  PUSH	{LR}			/* PUSH Link Register to Stack */
		  BL	MPCORE_TIMER	/* Branch to MPCORE_TIMER label */
		  POP	{LR}			/* POP Link Register from Stack */
		  LDR	R2, =SIX		/* Load 7-Segment value for SIX */
		  STR	R2, [R0]		/* Store value to 7-Seg Register */
		  PUSH	{LR}			/* PUSH Link Register to Stack */
		  BL	MPCORE_TIMER	/* Branch to MPCORE_TIMER label */
		  POP	{LR}			/* POP Link Register from Stack */
		  LDR	R2, =SEVEN		/* Load 7-Segment value for SEVEN */
		  STR	R2, [R0]		/* Store value to 7-Seg Register */
		  PUSH	{LR}			/* PUSH Link Register to Stack */
		  BL	MPCORE_TIMER	/* Branch to MPCORE_TIMER label */
		  POP	{LR}			/* POP Link Register from Stack */
		  LDR	R2, =EIGHT		/* Load 7-Segment value for EIGHT */
		  STR	R2, [R0]		/* Store value to 7-Seg Register */
		  PUSH	{LR}			/* PUSH Link Register to Stack */
		  BL	MPCORE_TIMER	/* Branch to MPCORE_TIMER label */
		  POP	{LR}			/* POP Link Register from Stack */
		  LDR	R2, =NINE		/* Load 7-Segment value for NINE */
		  STR	R2, [R0]		/* Store value to 7-Seg Register */
		  PUSH	{LR}			/* PUSH Link Register to Stack */
		  BL	MPCORE_TIMER	/* Branch to MPCORE_TIMER label */
		  POP	{LR}			/* POP Link Register from Stack */
		  B		SEVEN_SEG_Sequence /* Branch to loop top */
		.end
