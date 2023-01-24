          .include "address_map_arm.s"
		  .include "SevenSegmentLookUpTable.s"

          .text
          .global _start

_start:
	      LDR     R1, =HEX3_HEX0_BASE  /* Address of seven-segment displays. */
          LDR     R2, =SW_BASE    	   /* Address of switches. */
LOOP:     LDR     R3, [R2]        	   /* Read the state of switches. */
          AND 	  R4, R3, #0xF    	   /* And last byte of data with 0FF */
LOOP2:	  CMP	  R4, #0x00			   /* Compare R4 to 0x00 */
		  BEQ	  HEX0				   /* Branch to HEX0 if equal */
		  CMP	  R4, #0x01			   /* Compare R4 to 0x00 */
		  BEQ	  HEX1				   /* Branch to HEX1 if equal */
		  CMP	  R4, #0x02			   /* Compare R4 to 0x00 */
		  BEQ	  HEX2				   /* Branch to HEX2 if equal */
		  CMP	  R4, #0x03			   /* Compare R4 to 0x00 */
		  BEQ	  HEX3				   /* Branch to HEX3 if equal */
		  CMP	  R4, #0x04			   /* Compare R4 to 0x00 */
		  BEQ	  HEX4				   /* Branch to HEX4 if equal */
		  CMP	  R4, #0x05			   /* Compare R4 to 0x00 */
		  BEQ	  HEX5				   /* Branch to HEX5 if equal */
		  CMP	  R4, #0x06			   /* Compare R4 to 0x00 */
		  BEQ	  HEX6				   /* Branch to HEX6 if equal */
		  CMP	  R4, #0x07			   /* Compare R4 to 0x00 */
		  BEQ	  HEX7				   /* Branch to HEX7 if equal */
		  CMP	  R4, #0x08			   /* Compare R4 to 0x00 */
		  BEQ	  HEX8				   /* Branch to HEX8 if equal */
		  CMP	  R4, #0x09			   /* Compare R4 to 0x00 */
		  BEQ	  HEX9				   /* Branch to HEX9 if equal */
          CMP	  R4, #0x0A			   /* Compare R4 to 0x00 */
		  BGE	  MODSUB			   /* Branch to MODSUB if Greater or Equal */
		  B		  LOOP
HEX0:
		  LDR	  R5, =ZERO				/* Load 7-seg value from lookup table to R5 */
		  B		  LEDON					/* Branch to LEDON */
HEX1: 
		  LDR	  R5, =ONE				/* Load 7-seg value from lookup table to R5 */
		  B		  LEDON					/* Branch to LEDON */
HEX2: 
		  LDR	  R5, =TWO				/* Load 7-seg value from lookup table to R5 */
		  B		  LEDON					/* Branch to LEDON */
HEX3: 
		  LDR	  R5, =THREE			/* Load 7-seg value from lookup table to R5 */
		  B		  LEDON					/* Branch to LEDON */
HEX4: 
		  LDR	  R5, =FOUR				/* Load 7-seg value from lookup table to R5 */
		  B		  LEDON					/* Branch to LEDON */
HEX5: 
		  LDR	  R5, =FIVE				/* Load 7-seg value from lookup table to R5 */
		  B		  LEDON					/* Branch to LEDON */
HEX6:
		  LDR	  R5, =SIX				/* Load 7-seg value from lookup table to R5 */
		  B		  LEDON					/* Branch to LEDON */
HEX7: 
		  LDR	  R5, =SEVEN			/* Load 7-seg value from lookup table to R5 */
		  B		  LEDON					/* Branch to LEDON */
HEX8: 
		  LDR	  R5, =EIGHT			/* Load 7-seg value from lookup table to R5 */
		  B		  LEDON					/* Branch to LEDON */
HEX9: 
		  LDR	  R5, =NINE				/* Load 7-seg value from lookup table to R5 */
		  B		  LEDON					/* Branch to LEDON */

MODSUB:
		  SUB     R4, R4, #0b1010		/* Subtract 0b1010 from R4, Store result in R4 */
		  B       LOOP2					/* Branch to LOOP2 */

LEDON:
		  LDR     R6, =0				/* Load value of zero into R6 */
		  ADD     R6, R6, R5			/* Add R5 to R6, store in R6 */
		  LSL	  R5, #8				/* Logical shift left by 8 bits (1 byte) */
		  ADD 	  R6, R6, R5			/* Add R5 to R6, store in R6 */
		  LSL	  R5, #8				/* Logical shift left by 8 bits (1 byte) */
		  ADD 	  R6, R6, R5			/* Add R5 to R6, store in R6 */
		  LSL	  R5, #8				/* Logical shift left by 8 bits (1 byte) */
		  ADD 	  R6, R6, R5			/* Add R5 to R6, store in R6 */
		  STR     R6, [R1]				/* Store R6 into R1 */
		  B		  LOOP					/* Branch to LOOP */
.end
