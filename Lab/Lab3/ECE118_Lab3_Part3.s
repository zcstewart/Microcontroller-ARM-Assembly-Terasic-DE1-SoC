          .include "address_map_arm.s"

          .text
          .global _start

A:	.word 0xE
array:	.word 0x09132017, 0x09132017, 0x09132017, 0x09132017, 0x09132017, 0x09132017

_start:

		LDR		R0, =array	//Load array address to R0
		LDR 	R9, =A		//Load 0xE using define directive
		LDR		R1, [R9]	//Load contents of R9 to R0
		LDR     R2, =0x00	//Load 0x00 into R2
		
		LDR		R2, [R0]	//Load contents of R0 into R2
		ADD     R2, R1		//Add R1 to R2 (0xE + 0x09132017)
		STR		R2, [R0]	//Store R2 into R0 (sum into array[0])
		ADD 	R0, #4		//Add 4 to R0 (increment array 1 byte)

		LDR		R2, [R0]	//Load contents of R0 into R2
		LSL		R1, R1, #1	//Logical Shift Left, 1 Bit
		ADD     R2, R1		//Add R1 to R2 (0x1C + 0x09132017)
		STR		R2, [R0]	//Store R2 into R0 (sum into array[1])
		ADD 	R0, #4		//Add 4 to R0 (increment array 1 byte)

		LDR		R2, [R0]	//Load contents of R0 into R2
		LSL		R1, R1, #1	//Logical Shift Left, 1 Bit
		ADD     R2, R1		//Add R1 to R2 (0x38 + 0x09132017)
		STR		R2, [R0]	//Store R2 into R0 (sum into array[2])
		ADD 	R0, #4		//Add 4 to R0 (increment array 1 byte)

		LDR		R2, [R0]	//Load contents of R0 into R2
		LSL		R1, R1, #1	//Logical Shift Left, 1 Bit
		ADD     R2, R1		//Add R1 to R2 (0x70 + 0x09132017)
		STR		R2, [R0]	//Store R2 into R0 (sum into array[3])
		ADD 	R0, #4		//Add 4 to R0 (increment array 1 byte)

		LDR		R2, [R0]	//Load contents of R0 into R2
		LSL		R1, R1, #1	//Logical Shift Left, 1 Bit
		ADD     R2, R1		//Add R1 to R2 (0xE0 + 0x09132017)
		STR		R2, [R0]	//Store R2 into R0 (sum into array[4])
		ADD 	R0, #4		//Add 4 to R0 (increment array 1 byte)

		LDR		R2, [R0]	//Load contents of R0 into R2
		LSL		R1, R1, #1	//Logical Shift Left, 1 Bit
		ADD     R2, R1		//Add R1 to R2 (0x1C0 + 0x09132017)
		STR		R2, [R0]	//Store R2 into R0 (sum into array[5])
		ADD     R0, #4		//Add 4 to R0 (increment array 1 byte)

		MRS		R8, APSR	//Move Program Status Register (PSR) to R8
		STR		R8, [R0]	//Store R8 into R0

LOOP:

B LOOP
	
.end
