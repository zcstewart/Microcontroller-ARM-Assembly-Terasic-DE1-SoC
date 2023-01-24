	.text
	.include "address_map_arm.s"
//	.include "lcd_commands.s"
	.align
	.global _start
_start:
	//	GPIO PINS
	//	D10	D9	D8	D7	D6	D5	D4	D3	D2	D1	D0	
	//	LCD DISPLAY PINS
	//	 E	RS	RW	D7	D6	D5	D4	D3	D2	D1	D0

	LDR R0, =HPS_TIMER0_BASE
	LDR R1, =JP2_BASE
	MOVW R2, #0X7FF
	STR R2, [R1, #4]
	BL DELAY_50MS
	MOV R2, #0X0
	STR R2, [R1]
	BL DELAY_5US

SET_FUNCTION:
	MOVW R2, #0B00000111100	// SET 2 LINES, 8-BITS, AND NO LINE NUMBERS
	STR R2, [R1]
	BL PULSE_ENABLE
	BL DELAY_5MS

	MOVW R2, #0B00000111100	// SET 2 LINES, 8-BITS, AND NO LINE NUMBERS
	STR R2, [R1]
	BL PULSE_ENABLE
	BL DELAY_1MS

	MOVW R2, #0B00000111100	// SET 2 LINES, 8-BITS, AND NO LINE NUMBERS
	STR R2, [R1]
	BL PULSE_ENABLE
	
SET_DISPLAY:
	MOVW R2, #0B00000001100
	STR R2, [R1]
	BL PULSE_ENABLE
	BL DELAY_100US	

SET_ENTRY_MODE:
	MOVW R2, #0B00000000110
	STR R2, [R1]
	BL PULSE_ENABLE
	BL DELAY_100US

SET_ADDRESS:
	MOVW R2, #0B00010000000
	STR R2, [R1]
	BL PULSE_ENABLE
	BL DELAY_100US


WRITE_CHARS:
	MOVW R2, #0B01000111011		// ;
	STR R2, [R1]
	BL PULSE_ENABLE
	BL DELAY_100US

	MOVW R2, #0B01000101001		// )
	STR R2, [R1]
	BL PULSE_ENABLE
	BL DELAY_100US

DONE: B DONE
	
	.type  PULSE_ENABLE, %function
PULSE_ENABLE:
	PUSH {LR,R0,R1,R2}
	LDR R0, =JP2_BASE
	BL DELAY_1US
	ORR R2, R2, #0X400
	STR R2, [R0]
	BL DELAY_1US
	MOVW R1, #0X3FF
	AND R2, R2, R1 // KEEP EVERYTHING EXCEPT E THE SAME, THEN E = 0
	STR R2, [R0]
	BL DELAY_100US
	POP {LR,R0,R1,R2}
	BX LR

	.type DELAY_1US,%function
DELAY_1US:
	PUSH {R0,R3}
	LDR R0, =HPS_TIMER0_BASE
	MOV R3, #0X64
	STR R3, [R0]
	MOV R3, #0X3
	STR R3, [R0,#8]
CHECK_1US_TIMER:
	LDR R3, [R0,#16]
	AND R3, R3, #0X01
	CMP R3, #1
	BNE CHECK_1US_TIMER
	LDR R3, [R0,#12]		// RESET TIMER
	POP {R3,R0}
	BX LR

	.type DELAY_5US,%function
DELAY_5US:
	PUSH {R0,R3}
	LDR R0, =HPS_TIMER0_BASE
	MOVW R3, #0X1F4
	STR R3, [R0]
	MOV R3, #0X3
	STR R3, [R0,#8]
CHECK_5US_TIMER:
	LDR R3, [R0,#16]
	AND R3, R3, #0X01
	CMP R3, #1
	BNE CHECK_5US_TIMER
	LDR R3, [R0,#12]		// RESET TIMER
	POP {R3,R0}
	BX LR

	.type DELAY_100US,%function
DELAY_100US:
	PUSH {R0,R3}
	LDR R0, =HPS_TIMER0_BASE
	MOVW R3, #0X2710
	STR R3, [R0]
	MOV R3, #0X3
	STR R3, [R0,#8]
CHECK_100US_TIMER:
	LDR R3, [R0,#16]
	AND R3, R3, #0X01
	CMP R3, #1
	BNE CHECK_100US_TIMER
	LDR R3, [R0,#12]		// RESET TIMER
	POP {R3,R0}
	BX LR

	.type DELAY_1MS,%function
DELAY_1MS:
	PUSH {R0,R3}
	LDR R0, =HPS_TIMER0_BASE
	MOVW R3, #0X86A0
	MOVT R3, #0X0001
	STR R3, [R0]
	MOV R3, #0X3
	STR R3, [R0,#8]
CHECK_1MS_TIMER:
	LDR R3, [R0,#16]
	AND R3, R3, #0X01
	CMP R3, #1
	BNE CHECK_1MS_TIMER
	LDR R3, [R0,#12]		// RESET TIMER
	POP {R3,R0}
	BX LR


	.type DELAY_2MS,%function
DELAY_2MS:
	PUSH {R0,R3}
	LDR R0, =HPS_TIMER0_BASE
	MOVW R3, #0X0D40
	MOVT R3, #0X0003
	STR R3, [R0]
	MOV R3, #0X3
	STR R3, [R0,#8]
CHECK_2MS_TIMER:
	LDR R3, [R0,#16]
	AND R3, R3, #0X01
	CMP R3, #1
	BNE CHECK_2MS_TIMER
	LDR R3, [R0,#12]		// RESET TIMER
	POP {R3,R0}
	BX LR

	.type DELAY_5MS,%function
DELAY_5MS:
	PUSH {R0,R3}
	LDR R0, =HPS_TIMER0_BASE
	MOVW R3, #0XA120
	MOVT R3, #0X0007
	STR R3, [R0]
	MOV R3, #0X3
	STR R3, [R0,#8]
CHECK_5MS_TIMER:
	LDR R3, [R0,#16]
	AND R3, R3, #0X01
	CMP R3, #1
	BNE CHECK_5MS_TIMER
	LDR R3, [R0,#12]		// RESET TIMER
	POP {R3,R0}
	BX LR

	.type DELAY_1US,%function
DELAY_50MS:
	PUSH {R0,R3}
	LDR R0, =HPS_TIMER0_BASE
	MOVW R3, #0X4B40
	MOVT R3, #0X004C
	STR R3, [R0]
	MOV R3, #0X3
	STR R3, [R0,#8]
CHECK_50MS_TIMER:
	LDR R3, [R0,#16]
	AND R3, R3, #0X01
	CMP R3, #1
	BNE CHECK_50MS_TIMER
	LDR R3, [R0,#12]		// RESET TIMER
	POP {R3,R0}
	BX LR
.end

