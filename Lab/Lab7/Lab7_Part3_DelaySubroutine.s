// The following code represents a subroutine for delaying program execution
// The processor has a clock rate of 800MHz. This means that there 800,000,000
// clock cycles per second within the processor. Each instruction is assumed
// to take one cycle per instruction. 800,000,000 in hexadecimal is 2FAF08000.
// There are four instructions within the main loop. 800,000,000 divided by 
// four is 200,000,000. 200,000,000 in hexadecimal is 0BEBC200. 


//The loop is a counter that subtracts one from 0BEBC200 each repetition. 
//When the counter is zero, the program exits the loop.
		.type MHZ800DELAY, %function

MHZ800DELAY:
		  LDR	R0, =0x17D78400		/* Load 0x0800 into counter */
counter1:
		  SUB	R0, R0, #1			/* Decrement counter by 1 */
		  CMP   R0, #0				/* Compare counter to 0 */
		  BNE   counter1			/* Loop to top if not equal */
		  B		exit				/* Otherwise exit Loop */
exit:
		  BX	LR					/* Exit subroutine */
