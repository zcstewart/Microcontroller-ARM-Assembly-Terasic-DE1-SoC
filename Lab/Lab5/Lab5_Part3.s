          .include "address_map_arm.s"
	
		  .data
AAA:      .word 0x0003	//User defined value AA
		  
		  .text
          .global _start

_start:
		  LDR	  R9, =AAA			/* Load address of label M1 into R8 */
	      LDR     R1, [R9]  		/* Load address of AAA to R2 */
		  SUB	  R2, R1, #1   		/* Subtract 1 from R1, store in R2 */
mX:
		  MUL     R1, R1, R2		/* Multiply R2 and R1, store in R1 */
		  SUB     R2, R2, #1		/* Subtract 1 from R2, store in R2 */
		  CMP     R2, #1			/* Compare R2 to o1 */
		  BGE     mX				/* Branch to final if equal to */
		  LDR 	  R10, =LEDR_BASE	/* Load LED address to R10 */
		  STR 	  R1, [R10]			/* Store product to LEDS */

final:
		  B 	  final				/* Branch to final */

.end
