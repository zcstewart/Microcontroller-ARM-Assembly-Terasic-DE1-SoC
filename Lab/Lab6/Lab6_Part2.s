/* 
	The purpose of this program is to display four different LED 
	sequences on the DE1-SoC Development board.

	This program uses four subroutines to implement the different
	patterns. The patterns for key 1, key 2, key 3, and key 4 are
	SEQ1, SEQ2, SEQ3, and SEQ4, respectively.

	The delay subroutine is named MHZ800DELAY, and delays program
	execution approximately two seconds.
*/

          .include "address_map_arm.s"	//Include address map file
		  .include "Lab6_PRELAB.s"		//Include delay subroutine from prelab */

//Subroutine: SEQ1
		  .type SEQ1, %function
SEQ1:
		  MOV     R10, #0xFF        /* Illuminate first 8 LEDs */
		  ADD	  R10, #0x300		/* Illuminate last 3 LEDSs */
		  STR     R10, [R1]			/* Store the value of R3 into R1 */
		  MOV     R9, LR			/* Store Link Register address locally */
		  BL	  MHZ800DELAY		/* Branch to MHZ800DELAY Subroutine */
		  MOV	  LR, R9			/* Reload previous link register address */
		  MOV     R10, #0x0        	/* Illuminate first 8 LEDs */
		  STR     R10, [R1]			/* Store the value of R3 into R1 */
		  MOV     R9, LR			/* Store Link Register address locally */
		  BL	  MHZ800DELAY		/* Branch to MHZ800DELAY Subroutine */
		  MOV	  LR, R9			/* Reload previous link register address */
		  BX	  LR				/* Branch out of subroutine to Link Register */

//Subroutine: SEQ2
		  .type SEQ2, %function
SEQ2:
		  LDR	  R5, =0x00			/* Initialize R5 to zero */	
		  LDR     R4, =0x3FF		/* Load 3FF to R5*/
begin2:	  STR     R5, [R1]			/* Store R5 value to LEDS */
		  MOV     R9, LR			/* Store Link Register address locally */
		  BL	  MHZ800DELAY		/* Branch to MHZ800DELAY Subroutine */
		  MOV	  LR, R9			/* Reload previous link register address */
		  LDR     R3, [R2]			/* Load state of switches to R3 */
		  CMP	  R3, #0x2			/* Check to see if button 2 is still pressed */
		  BNE     quickOFF2			/* Branch to quickOFF2 if not pressed */
		  ADD     R5, R5, #1		/* Increment R5 by one */
		  SUB	  R4, R4, #1		/* Decrement R4 by one */
		  CMP	  R4, #0			/* Compare R4 to 0x00 */
		  BEQ	  leave2			/* Branch to leave2 if equal to */
		  BNE	  begin2			/* Branch to begin2 if not equal to */
  
leave2:   MOV	  LR, R9			/* Reload previous link register address */
		  BX	  LR				/* Branch out of subroutine to Link Register */

quickOFF2:MOV 	  R5, #0x00			/* Initialize R5 to zero */				
		  STR	  R5, [R1]			/* Store R5 value to LEDS */
		  B		  leave2			/* Branch to leave2 */

//Subroutine: SEQ3
		  .type SEQ3, %function
SEQ3:
		  LDR	  R5, =0x00			/* Initialize R5 to zero */
		  LDR     R4, =0xB			/* Initialize counter to 11 */

begin3:	  STR     R5, [R1]			/* Store R5 value to LEDS */
		  MOV     R9, LR			/* Store Link Register address locally */
		  BL	  MHZ800DELAY		/* Branch to MHZ800DELAY Subroutine */
		  MOV	  LR, R9			/* Reload previous link register address */
		  LDR     R3, [R2]]			/* Load state of switches to R3 */
		  CMP	  R3, #0x4			/* Check to see if third button is pressed*/
		  BNE     quickOFF3			/* Branch to quickOFF3 if not equal */
		  ADD     R5, R5, #0x01		/* Increment R5 by one */
		  SUB	  R4, R4, #1		/* Decrement R4 by one */
		  CMP	  R4, #0			/* Compare R4 to 0x00 */
		  BEQ	  leave3			/* Branch to leave3 if equal to */
		  BNE	  restart3
		

quickOFF3:MOV 	  R5, #0x00			/* Initialize R5 to zero */
		  STR	  R5, [R1]			/* Store R5 value to LEDS */
		  B		  leave2
		  
restart3: STR     R5, [R1]			/* Store R5 value to LEDS */
		  MOV     R9, LR			/* Store Link Register address locally */
		  BL	  MHZ800DELAY		/* Branch to MHZ800DELAY Subroutine */
		  MOV	  LR, R9			/* Reload previous link register address */
		  LDR     R3, [R2]]			/* Load state of switches to R3 */
		  CMP	  R3, #0x4			/* Check to see if third button is pressed */
		  BNE     quickOFF3			/* Branch to quickOFF3 if not equal */
		  MUL     R5, R5, R8		/* Multiply R5 by 2 (shifts LED sequence) */
		  ADD	  R5, R5, #1		/* Increment R5 by one */
		  SUB	  R4, R4, #1		/* Decrement R4 by one */
		  CMP	  R4, #0			/* Compare R4 to 0x00 */
		  BNE	  restart3			/* Branch to restart3 if not equal */
		  BEQ	  leave3			/* Branch to leave3 if equal to */

leave3:	  MOV	  LR, R9			/* Reload previous link register address */
		  BX	  LR				/* Branch out of subroutine to Link Register */

//Subroutine: SEQ4
		  .type SEQ4, %function
SEQ4:
		  LDR	  R5, =0x00			/* Initialize R5 to zero */
		  LDR	  R6, =0x00			/* Initialize R6 to zero */
		  LDR     R4, =0xB			/* Initialize counter to 11 */

		  STR     R5, [R1]			/* Store R5 value to LEDS */
		  MOV     R9, LR			/* Store Link Register address locally */
		  BL	  MHZ800DELAY		/* Branch to MHZ800DELAY Subroutine */
		  MOV	  LR, R9			/* Reload previous link register address */
		  ADD     R5, R5, #1		/* Increment R5 by one */
		  SUB	  R4, R4, #1		/* Decrement R4 by one */
		  CMP	  R4, #0			/* Compare R4 to 0x00 */
		  BEQ	  leave4			/* Branch to leave4 if equal to */
		  
restart4: STR     R5, [R1]			/* Store R5 value to LEDS */
		  MOV     R9, LR			/* Store Link Register address locally */
		  BL	  MHZ800DELAY		/* Branch to MHZ800DELAY Subroutine */
		  MOV	  LR, R9			/* Reload previous link register address */
		  LDR     R3, [R2]]			/* Load state of switches to R3 */
		  CMP	  R3, #0x8			/* Check to see if button 4 is pressed */
		  BNE     quickOFF4			/* Branch to quickOFF4 if not equal */
		  MUL     R5, R5, R8		/* Multiply R5 by 2 (shifts LED sequence) */
		  ADD	  R5, R5, #1		/* Increment R5 by one */
		  STR     R6, [R1]			/* Turn LEDs off after delay from illumination */
		  MOV     R9, LR			/* Store Link Register address locally */
		  BL	  MHZ800DELAY		/* Branch to MHZ800DELAY Subroutine */
		  MOV	  LR, R9			/* Reload previous link register address */
		  LDR     R3, [R2]]			/* Load state of switches to R3 */
		  CMP	  R3, #0x8			/* Check to see if button 4 is still pressed */
		  BNE     quickOFF4			/* Branch to quickOFF4 if not equal */
		  SUB	  R4, R4, #1		/* Decrement R4 by one */
		  CMP	  R4, #0			/* Compare R4 to 0x00 */
		  BNE	  restart4			/* Branch to restart4 if not equal to */
		  BEQ	  leave4			/* Branch to leave4 if equal to */

leave4:	  MOV	  LR, R9			/* Reload previous link register address */
		  BX	  LR				/* Branch out of subroutine to Link Register */

quickOFF4:MOV 	  R5, #0x00			/* Load zero to R5 */
		  STR	  R5, [R1]			/* Store R5 value to LEDS */
		  B		  leave2			/* Branch to leave2 */
		
          .text
          .global _start

//Program Start
_start:
	      LDR     R1, =LEDR_BASE  	/* Address of red LEDs. */
          LDR     R2, =KEY_BASE     /* Address of keys. */
		  LDR	  R5, =0x00			/* Initialize R5 with 0x00 */
		  LDR     R4, =0x3FF		/* Hex number to illuminate all LEDs */
		  LDR	  R8, =0x2			/* Hex number to multiply registers by two */
LOOP:     LDR     R3, [R2]        	/* Read the state of keys. */
		  CMP	  R3, #0x01	  		/* Compare the value of R3 to 0x00 */
		  BLEQ	  SEQ1				/* Branch to SEQ1 if not equal */
		  CMP	  R3, #0x02	  		/* Compare the value of R3 to 0x00 */
		  BLEQ	  SEQ2				/* Branch to SEQ2 if not equal */				
		  CMP	  R3, #0x04	  		/* Compare the value of R3 to 0x00 */
		  BLEQ	  SEQ3				/* Branch to SE3 if not equal */
		  CMP	  R3, #0x08	  		/* Compare the value of R3 to 0x00 */
		  BLEQ	  SEQ4				/* Branch to SEQ4 if not equal */

		  B		  LOOP				/* Branch to loop */
.end
