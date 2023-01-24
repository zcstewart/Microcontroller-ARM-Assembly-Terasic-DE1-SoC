          .include "address_map_arm.s"

          .text
          .global _start
_start:
	      LDR     R1, =LEDR_BASE  /* Address of red LEDs. */
          LDR     R2, =KEY_BASE   /* Address of switches. */
LOOP:     LDR     R3, [R2]        /* Read the state of switches. */
	  	  CMP	  R3, #0x00		  /* Compare value of R3 with 0 (hex) */
		  BEQ	  LOOP			  /* Branch to beginning of loop if 
									 R3 is equal to 0 (hex) */
          STR     R3, [R1]        /* Display the state on LEDs. */
          B		  LOOP
.end

