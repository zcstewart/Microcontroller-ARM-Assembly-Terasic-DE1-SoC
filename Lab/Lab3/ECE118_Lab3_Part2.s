          .include "address_map_arm.s"

          .text
          .global _start

AA:	.word 0x01	//User defined value AA
AB:	.word 0x31	//User defined value AB
AC:	.word 0x21	//User defined value AC
AD:	.word 0x04	//User defined value AD
AE:	.word 0x12	//User defined value AE

_start:
		   LDR	   R1, =SDRAM_BASE		/* Load address of SDRAM base */
		   LDR     R2, =LEDR_BASE		/* Load address of LEDs */
		   LDR     R0, =0x00			/* Initialize R0 to 0x00 */

		   LDR     R4, =AA			/* Load defined value AA to register */
		   LDR     R5, =AB			/* Load defined value AB to register */
		   LDR     R6, =AC			/* Load defined value AC to register */
		   LDR     R7, =AD			/* Load defined value AD to register */
		   LDR     R8, =AE		   	/* Load defined value AE to register */
		   
		   LDR	   R3, [R4]			/* Load contents of R4 to R3 */
		   ADD     R0, R3			/* Add R3 to R0, store results in R0 */

		   LDR	   R3, [R5]			/* Load contents of R5 to R3 */
		   ADD	   R0, R3			/* Add R3 to R0, store results in R0 */
		   
		   LDR	   R3, [R6]			/* Load contents of R6 to R3 */
		   ADD	   R0, R3			/* Add R3 to R0, store results in R0 */
		   
		   LDR	   R3, [R7]			/* Load contents of R7 to R3 */
		   ADD	   R0, R3			/* Add R3 to R0, store results in R0 */

		   LDR	   R3, [R8]			/* Load contents of R8 to R3 */
		   ADD	   R0, R3			/* Add R3 to R0, store results in R0 */

		   STR     R0, [R2]			/* Store R0 to R2 */

.end


