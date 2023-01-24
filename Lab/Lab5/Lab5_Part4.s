          .include "address_map_arm.s"
	
		  .data
				/* Array of integers from 31 to 1 */
arr1:     .word 31,30,29,28,27,26,25,24,23,22,21,20,19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1

		  .text

          .global _start

_start:
		  LDR 	  R10, =LEDR_BASE   /* Load address of LEDs to R10 */
		  LDR     R0, =arr1			/* Load address of array to R0 */
		  MOV     R5, #31			/* Load contents of R3 to R5 */

loopTOP:  LDR     R1, [R0]  		/* Load contents of R0 to R1 */
		  SUB	  R2, R1, #1   		/* Subtract 1 from R1, store result in R2 */
		  CMP     R2, #0
		  BEQ	  LED1

mX:		  MUL     R1, R1, R2		/* Multiply R1 by R2, store result in R1 */
		  SUB     R2, R2, #1		/* Subtract 1 from R2, store in R1 */
		  CMP     R2, #0			/* Compare R2 to 0 */
		  BNE     mX				/* Branch to final if equal to */

		  STR	  R1, [R0], #4		/* Store R1 to R0, increment R0 4 bytes */
		  SUB     R5, R5, #1		/* Subtract 1 from R5, store in R5 */
		  CMP     R5, #0			/* Compare R5 to 1 */
		  BNE     loopTOP			/* Branch to restart if not equal to 1 */

LED1:	  LDR     R0, =arr1			/* Load address of arr1 to R0 */
		  MOV     R5, #31			/* Load contents of R3 to R5 */
LED:	  LDR     R6, =1000000		/* Load 0x3E8 (Decimal 1000) to R6 */
		  LDR     R1, [R0], #4		/* Load contents of R0 to R1 */
		  B       delay

delay:	  STR 	  R1, [R10]			/* Store contents of R1 to LEDS */
	  	  SUB     R6, R6, #1		/* Subtract 1 from R6, store in R6 */
		  CMP     R6, #0			/* Compare value of R6 to 0 */
		  BNE     delay				/* Branch to LED2 if not equal to 0 */

inc:	  SUB     R5, R5, #1		/* Subtract 1 from R5, store in R5 */
		  CMP     R5, #0			/* Compare R5 to 0 */
		  BEQ	  LED1
		  BNE     LED				/* Branch to final if equal to 0 */

final:	  B 	  final				/* Branch to final */

.end
