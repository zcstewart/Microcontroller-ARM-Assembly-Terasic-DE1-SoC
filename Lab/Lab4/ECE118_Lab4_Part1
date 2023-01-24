          .include "address_map_arm.s"
		  .include "SevenSegmentLookUpTable.s"

          .text
          .global _start

_start:
	      LDR     R1, =HEX3_HEX0_BASE  /* Address of seven-segment displays. */
          LDR     R2, =SW_BASE    	   /* Address of switches. */
LOOP:     LDR     R3, [R2]        	   /* Read the state of switches. */
          AND 	  R4, R3, #0xF    	   /* And last byte of data with 0FF */
		  CMP	  R4, #0x00			   /* Compare R4 to 0x00 */
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
		  BEQ	  HEXA				   /* Branch to HEXA if equal */
		  CMP	  R4, #0x0B			   /* Compare R4 to 0x00 */
		  BEQ	  HEXB				   /* Branch to HEXB if equal */
		  CMP	  R4, #0x0C			   /* Compare R4 to 0x00 */
		  BEQ	  HEXC				   /* Branch to HEXC if equal */
		  CMP	  R4, #0x0D			   /* Compare R4 to 0x00 */
		  BEQ	  HEXD				   /* Branch to HEXD if equal */
		  CMP	  R4, #0x0E			   /* Compare R4 to 0x00 */
		  BEQ	  HEXE				   /* Branch to HEXE if equal */
		  CMP	  R4, #0x0F			   /* Compare R4 to 0x00 */
		  BEQ	  HEXF				   /* Branch to HEXF if equal */
		  B		  LOOP				   /* Branch to LOOP */
HEX0:
		  LDR	  R5, =ZERO			   /* Load 7-seg value to R5*/
		  B		  LEDON				   /* Branch to LEDON */
HEX1: 
		  LDR	  R5, =ONE			   /* Load 7-seg value to R5*/
		  B		  LEDON				   /* Branch to LEDON */
HEX2: 
		  LDR	  R5, =TWO			   /* Load 7-seg value to R5*/
		  B		  LEDON				   /* Branch to LEDON */
HEX3: 
		  LDR	  R5, =THREE		   /* Load 7-seg value to R5*/
		  B		  LEDON				   /* Branch to LEDON */
HEX4: 
		  LDR	  R5, =FOUR			   /* Load 7-seg value to R5*/
		  B		  LEDON				   /* Branch to LEDON */
HEX5: 
		  LDR	  R5, =FIVE			   /* Load 7-seg value to R5*/
		  B		  LEDON				   /* Branch to LEDON */
HEX6: 
		  LDR	  R5, =SIX			   /* Load 7-seg value to R5*/
		  B		  LEDON				   /* Branch to LEDON */
HEX7: 
		  LDR	  R5, =SEVEN		   /* Load 7-seg value to R5*/
		  B		  LEDON				   /* Branch to LEDON */
HEX8: 
		  LDR	  R5, =EIGHT		   /* Load 7-seg value to R5*/
		  B		  LEDON				   /* Branch to LEDON */
HEX9: 
		  LDR	  R5, =NINE			   /* Load 7-seg value to R5*/
		  B		  LEDON				   /* Branch to LEDON */
HEXA: 
		  LDR	  R5, =AHEX			   /* Load 7-seg value to R5*/
		  B		  LEDON				   /* Branch to LEDON */
HEXB: 
		  LDR	  R5, =BHEX			   /* Load 7-seg value to R5*/
		  B		  LEDON				   /* Branch to LEDON */
HEXC: 
		  LDR	  R5, =CHEX			   /* Load 7-seg value to R5*/
		  B		  LEDON				   /* Branch to LEDON */
HEXD: 
		  LDR	  R5, =DHEX			   /* Load 7-seg value to R5*/
		  B		  LEDON				   /* Branch to LEDON */
HEXE: 
		  LDR	  R5, =EHEX			   /* Load 7-seg value to R5*/
		  B		  LEDON				   /* Branch to LEDON */
HEXF: 
		  LDR	  R5, =FHEX			   /* Load 7-seg value to R5*/
		  B		  LEDON				   /* Branch to LEDON */
LEDON:
		  LDR     R6, =0			   /* Load 0 to R6 (initialize) */
		  ADD     R6, R6, R5		   /* Add R5 to R6, store in R6 */
		  LSL	  R5, #8		   	   /* Logical shift left R5 by 8 bits (1 byte) */
		  ADD 	  R6, R6, R5		   /* Add R5 to R6, store in R6 */
		  LSL	  R5, #8		   	   /* Logical shift left R5 by 8 bits (1 byte) */
		  ADD 	  R6, R6, R5		   /* Add R5 to R6, store in R6 */
		  LSL	  R5, #8		   	   /* Logical shift left R5 by 8 bits (1 byte) */
		  ADD 	  R6, R6, R5		   /* Add R5 to R6, store in R6 */
		  STR     R6, [R1] 			   /* Store R6 to R1*/
		  B		  LOOP				   /* Branch to LOOP */
.end
