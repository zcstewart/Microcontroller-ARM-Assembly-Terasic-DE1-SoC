          .include "address_map_arm.s"

          .text
          .global _start

M1:	.hword 0xFFFF	//User defined value FFFF
M2:	.hword 0xFFFF	//User defined value FFFF

_start:
		  LDR	  R8, =M1			/* Load address of label M1 into R8 */
		  LDR	  R9, =M2			/* Load address of label M2 into R9 */
	    LDRH    R1, [R8]  		/* Load M1 into R1*/
		  LDRH    R2, [R9]  		/* Load M2 into R2 */
		  LDR	  R3, =0x10			/* Counter register holding decimal 16 */
		  LDR     R5, =0x00			/* Load zero into R5 */

mask:
		  AND 	  R4, R2, #0x1    	/* And last bit of data with 0x1 */
		  CMP     R4, #0x1			/* Compare R3 to 1 */
		  BEQ     mAdd				/* Branch to mAdd if equal */
		  BNE	  shift				/* Branch to shift if not equal */

mAdd:     
		  ADD	  R5, R5, R1		/* Add R1 to R5, store result in R5 */
		  B		  shift				/* Branch to shift */
shift:
		  LSL	  R1, #1			/* Logic Shift Left R1 by 1 bit */
		  LSR	  R2, #1			/* Logic Shift Right R1 by 1 bit */
		  SUB     R3, R3, #0x1		/* Subtract one from R3, store result in R3 */
		  CMP	  R3, #0			/* Compare R3 to 0 */
		  BGT     mask				/* Branch to mask if greater than */
		  BEQ     final				/* Branch to final if equal to */
final:
		  B 	  final				/* Infinite loop for continuous program execution */

.end
