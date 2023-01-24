          .include "address_map_arm.s"

          .text
          .global _start
_start:
		   LDR	   R1, =SDRAM_BASE	/* Load address of SDRAM base */
		   LDR     R2, =LEDR_BASE	/* Load address of LEDs */

		   MOV    R4, #0x01			/* Move value of 0x01 to R4 */
		   MOV    R5, #0x31			/* Move value of 0x31 to R5 */
		   MOV    R6, #0x21			/* Move value of 0x21 to R6 */
		   MOV    R7, #0x04			/* Move value of 0x04 to R7 */
		   MOV    R8, #0x12			/* Move value of 0x12 to R8 */
   		
		   STR	   R4, [R1], #4		/* Store contents of R4 to R1 to
									increment memory address by 4 bytes */
		   STR	   R5, [R1], #4		/* Store contents of R5 to R1 to
									increment memory address by 4 bytes */
		   STR	   R6, [R1], #4		/* Store contents of R6 to R1 to
									increment memory address by 4 bytes */
		   STR	   R7, [R1], #4		/* Store contents of R7 to R1 to
									increment memory address by 4 bytes */
		   STR	   R8, [R1], #4		/* Store contents of R8 to R1 to
									increment memory address by 4 bytes */
		   
		   LDR	   R1, =SDRAM_BASE	/* Load address of SDRAM base */
		   LDR     R9, =0x00
	
		   LDR      R3, [R1]		/* Load the value of R1 into R3 */
		   ADD	    R1, #4			/* Incrememnt R1 by 4 bytes */
	       ADD	    R9, R9, R3		/* Add value of R3 to R9 */
		   
		   LDR      R3, [R1]		/* Load the value of R1 into R3 */
		   ADD	    R1, #4			/* Incrememnt R1 by 4 bytes */
	       ADD	    R9, R9, R3		/* Add value of R3 to R9 */
		   
		   LDR      R3, [R1]		/* Load the value of R1 into R3 */
		   ADD      R1, #4			/* Incrememnt R1 by 4 bytes */
	       ADD	    R9, R9, R3		/* Add value of R3 to R9 */
		   
		   LDR      R3, [R1]		/* Load the value of R1 into R3 */
		   ADD      R1, #4			/* Incrememnt R1 by 4 bytes */
	       ADD	    R9, R9, R3		/* Add value of R3 to R9 */
		   
		   LDR      R3, [R1] 		/* Load the value of R1 into R3 */
		   ADD	    R1, #4			/* Incrememnt R1 by 4 bytes */
	       ADD	    R9, R9, R3		/* Add value of R3 to R9 */

		   STR	    R9, [R2]		/* Store contents of R9 into R2 */		

.end
