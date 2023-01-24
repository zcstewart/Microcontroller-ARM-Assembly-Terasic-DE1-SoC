          .include "address_map_arm.s"
	
		  .data
AAA:      .word 0x000c	//User defined value AA
		  
		  .text
          .global _start

_start:
		  LDR	  R9, =AAA			/* Load address of label M1 into R8 */
	      LDR     R1, [R9]  		/* Load address of AAA to R2 */
		  SUB	  R2, R1, #1		/* Subtract 1 from R1, store in R2 */
facto:
		  MOV	  R3, #0x10			/* Counter register holding decimal 16 */
		  MOV     R5, #0x00			/* Move zero into R5 */
		  MOV     R8, R2   			/* Move value from R2 to R8 */

mX:
		  SUB     R3, R3, #0x1		/* Subtract 1 from R3, store result in R3 */
		  AND 	  R4, R8, #0x1    	/* AND last bit of data with 0x1 */
		  CMP     R4, #0x1			/* Compare R3 to 1 */
		  BNE	  shift				/* Branch to shift if not equal */
		  ADD	  R5, R5, R1		/* Add R1 to R5, store result in R5 */
shift:
		  LSL	  R1, #1			/* Logic Shift Left R1 by 1 bit */
		  LSR	  R8, #1			/* Logic Shift Right R1 by 1 bit */

		  CMP	  R3, #0			/* Compare R3 to 0 */
		  BNE     mX				/* Branch to mask if greater than */
		  
		  MOV     R1, R5			/* Move R1 to R5 */
		  SUB     R2, R2, #1		/* Subtract 1 from R2, store in R2 */
		  CMP     R2, #1			/* Compare value in R2 to 1 */
		  BGT     facto				/* Branch to final if equal to */
		  LDR 	  R10, =LEDR_BASE	/* Load LED address into R10 */
		  STR 	  R1, [R10]			/* Store multiplication result in R10 */

final:
		  B 	  final				/* Branch to final */

.end
