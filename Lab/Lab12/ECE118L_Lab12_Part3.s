//Zachary Stewart
//ECE118L Lab 12 Part 3
          .include "address_map_arm.s"

		  .text
          .global _start


/////////////////////////////////////////////////////////////////////////////////
		.type F2, %function

Note_F2:
		  LDR	R4, =4581376
		  MOV	R3, #1
		  STR	R3, [R9]
F2_HIGH:
		  SUB	R4, R4, #1		/* Decrement counter by 1 */
		  CMP   R4, #0			/* Compare counter to 0 */
		  BNE   F2_HIGH			/* Loop to top if not equal */
		  LDR	R4, =4581376
F2_LOW:
		  SUB	R4, R4, #1		/* Decrement counter by 1 */
		  CMP   R4, #0			/* Compare counter to 0 */
		  BNE   F2_LOW			/* Loop to top if not equal */

		  BX	LR

/////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////
		.type G2, %function

Note_G2:
		  LDR	R4, =4081633
		  MOV	R3, #1
		  STR	R3, [R9]
G2_HIGH:
		  SUB	R4, R4, #1		/* Decrement counter by 1 */
		  CMP   R4, #0			/* Compare counter to 0 */
		  BNE   G2_HIGH			/* Loop to top if not equal */
		  LDR	R4, =4081633
G2_LOW:
		  SUB	R4, R4, #1		/* Decrement counter by 1 */
		  CMP   R4, #0			/* Compare counter to 0 */
		  BNE   G2_LOW			/* Loop to top if not equal */

		  BX	LR

/////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////
		.type A2, %function

Note_A2:
		  LDR	R4, =3852451
		  MOV	R3, #1
		  STR	R3, [R9]
A2_HIGH:
		  SUB	R4, R4, #1		/* Decrement counter by 1 */
		  CMP   R4, #0			/* Compare counter to 0 */
		  BNE   A2_HIGH			/* Loop to top if not equal */
		  LDR	R4, =3852451
A2_LOW:
		  SUB	R4, R4, #1		/* Decrement counter by 1 */
		  CMP   R4, #0			/* Compare counter to 0 */
		  BNE   A2_LOW			/* Loop to top if not equal */

		  BX	LR

/////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////
		.type A2Sharp, %function

Note_A2Sharp:
		  LDR	R4, =3432298
		  MOV	R3, #1
		  STR	R3, [R9]
A2Sharp_HIGH:
		  SUB	R4, R4, #1		/* Decrement counter by 1 */
		  CMP   R4, #0			/* Compare counter to 0 */
		  BNE   A2Sharp_HIGH			/* Loop to top if not equal */
		  LDR	R4, =3432298
A2Sharp_LOW:
		  SUB	R4, R4, #1		/* Decrement counter by 1 */
		  CMP   R4, #0			/* Compare counter to 0 */
		  BNE   A2Sharp_LOW			/* Loop to top if not equal */

		  BX	LR

/////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////
		.type C3, %function

Note_C3:
		  LDR	R4, =3057870
		  MOV	R3, #1
		  STR	R3, [R9]
C3_HIGH:
		  SUB	R4, R4, #1		/* Decrement counter by 1 */
		  CMP   R4, #0			/* Compare counter to 0 */
		  BNE   C3_HIGH			/* Loop to top if not equal */
		  LDR	R4, =3057870
C3_LOW:
		  SUB	R4, R4, #1		/* Decrement counter by 1 */
		  CMP   R4, #0			/* Compare counter to 0 */
		  BNE   C3_LOW			/* Loop to top if not equal */

		  BX	LR

/////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////
		.type C3Sharp, %function

Note_C3Sharp:
		  LDR	R4, =2886211
		  MOV	R3, #1
		  STR	R3, [R9]
C3Sharp_HIGH:
		  SUB	R4, R4, #1		/* Decrement counter by 1 */
		  CMP   R4, #0			/* Compare counter to 0 */
		  BNE   C3Sharp_HIGH			/* Loop to top if not equal */
		  LDR	R4, =2886211
C3Sharp_LOW:
		  SUB	R4, R4, #1		/* Decrement counter by 1 */
		  CMP   R4, #0			/* Compare counter to 0 */
		  BNE   C3Sharp_LOW			/* Loop to top if not equal */

		  BX	LR

/////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////
		.type D3, %function

Note_D3:
		  LDR	R4, =2774239
		  MOV	R3, #1
		  STR	R3, [R9]
D3_HIGH:
		  SUB	R4, R4, #1		/* Decrement counter by 1 */
		  CMP   R4, #0			/* Compare counter to 0 */
		  BNE   D3_HIGH			/* Loop to top if not equal */
		  LDR	R4, =2774239
D3_LOW:
		  SUB	R4, R4, #1		/* Decrement counter by 1 */
		  CMP   R4, #0			/* Compare counter to 0 */
		  BNE   D3_LOW			/* Loop to top if not equal */

		  BX	LR

/////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////
		.type D3Sharp, %function

Note_D3Sharp:
		  LDR	R4, =2571355
		  MOV	R3, #1
		  STR	R3, [R9]
D3Sharp_HIGH:
		  SUB	R4, R4, #1		/* Decrement counter by 1 */
		  CMP   R4, #0			/* Compare counter to 0 */
		  BNE   D3Sharp_HIGH			/* Loop to top if not equal */
		  LDR	R4, =2571355
D3Sharp_LOW:
		  SUB	R4, R4, #1		/* Decrement counter by 1 */
		  CMP   R4, #0			/* Compare counter to 0 */
		  BNE   D3Sharp_LOW			/* Loop to top if not equal */

		  BX	LR

/////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////
		.type F3, %function

Note_F3:
		  LDR	R4, =2290820
		  MOV	R3, #1
		  STR	R3, [R9]
F3_HIGH:
		  SUB	R4, R4, #1		/* Decrement counter by 1 */
		  CMP   R4, #0			/* Compare counter to 0 */
		  BNE   C3_HIGH			/* Loop to top if not equal */
		  LDR	R4, =2290820
C3_LOW:
		  SUB	R4, R4, #1		/* Decrement counter by 1 */
		  CMP   R4, #0			/* Compare counter to 0 */
		  BNE   C3_LOW			/* Loop to top if not equal */

		  BX	LR

/////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////
		.type F3, %function

Note_F3:
		  LDR	R4, =2290820
		  MOV	R3, #1
		  STR	R3, [R9]
F3_HIGH:
		  SUB	R4, R4, #1		/* Decrement counter by 1 */
		  CMP   R4, #0			/* Compare counter to 0 */
		  BNE   C3_HIGH			/* Loop to top if not equal */
		  LDR	R4, =2290820
		  MOV	R3, #0
		  STR	R3, [R9]
C3_LOW:
		  SUB	R4, R4, #1		/* Decrement counter by 1 */
		  CMP   R4, #0			/* Compare counter to 0 */
		  BNE   C3_LOW			/* Loop to top if not equal */

		  BX	LR

/////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////
		.type Rest, %function

Rest:
		

/////////////////////////////////////////////////////////////////////////////////



_start:
		  LDR	  R9, =JP2_BASE		/* Load the address of the GPIO 2 pins */
		  MOV	  R3, #0x1			/* Enable D0 as output */
		  STR	  R3, [R9, #4]		/* Store value to Data Direction Register */ 

		  MOV	  R3, #0x0			/* Move Binary 0 to R3 */
		  STR	  R3, [R9]			/* Store Value to JP2_BASE*/
