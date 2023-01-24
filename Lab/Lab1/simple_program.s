          .include "address_map_arm.s"

          .text
          .global _start

//This is a simple program that reads the value of the switches
//and stores the value in the memory for the seven-segment
//displays the value on the first four hex displays
//HEX0 to HEX3

_start:
	      LDR     R1, =HEX3_HEX0_BASE  /* Address of red LEDs. */
          LDR     R2, =SW_BASE    /* Address of switches. */
LOOP:     LDR     R3, [R2]        /* Read the state of switches. */
          STR     R3, [R1]        /* Display the state on LEDs. */
          B       LOOP
.end
