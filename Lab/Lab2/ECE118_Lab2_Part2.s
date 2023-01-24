          .include "address_map_arm.s"

          .text
          .global _start
_start:
	      LDR     R1, =LEDR_BASE  	/* Address of red LEDs. */
          LDR     R2, =KEY_BASE     /* Address of keys. */
LOOP:     LDR     R3, [R2]        	/* Read the state of keys. */
		  CMP	  R3, #0x01	  		/* Compare the value of R3 to 0x01 */
		  BEQ	  KEY1				/* If eaqual, branch to KEY1 */
		  CMP	  R3, #0x02	  		/* Compare the value of R3 to 0x02 */
		  BEQ	  KEY2				/* If eaqual, branch to KEY2 */
		  CMP	  R3, #0x03	  		/* Compare the value of R3 to 0x04 */
		  BEQ	  KEY3				/* If eaqual, branch to KEY3 */
		  CMP	  R3, #0x0C	  		/* Compare the value of R3 to 0x08 */
		  BEQ	  KEY4				/* If eaqual, branch to KEY4 */
		  MOV	  R3, #0x00			/* Move the value of 0 (hex: 0x00) into R3 */
		  STR     R3, [R1]			/* Store the value of R3 into R1 */
		  B       LOOP
KEY1:	  MOV	  R3, #0x001
		  ADD	  R3, #0x200		/* Add immediate value of binary 0010 0000 0001 
									   (hex: 0x201)to illuminate first and last LED */
									/* (LED0 and LED9) */
		  STR     R3, [R1]			/* Store the value of R3 into R1
									   (address of the red LEDs) */
		  B       LOOP
KEY2:	  MOV	  R3, #0x002
		  ADD	  R3, #0x100		/* Add immediate value of binary 0001 0000 0010 
									   (hex: 0x102)to illuminate second to first and 
										second to last LED (LED8 and LED1)  */
		  STR     R3, [R1]			/* Store the value of R3 into R1
									   (address of the red LEDs) */
		  B       LOOP
KEY3:	  MOV	  R3, #0xCC 		/* Add immediate value of binary 0000 1100 1100
									   (hex: 0xCC) to illuminate LED2, LED3, LED6,
										and LED7 */
		  STR     R3, [R1]			/* Store the value of R3 into R1
									   (address of the red LEDs) */
		  B       LOOP
KEY4:	  MOV	  R3, #0x30			/* Add immediate value of binary 0000 0011 0000
									   (hex: 0xCC) to illuminate LED4 and LED5 */
		  STR     R3, [R1]			/* Store the value of R3 into R1
									   (address of the red LEDs) */
		  B       LOOP

.end