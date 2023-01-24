				.include	"address_map_arm.s"
				.extern TICK

/******************************************************************************
 * HPS timer0 interrupt service routine
 *                                                                          
 * This code increments the TICK global variable, and clears the interrupt
 *****************************************************************************/
					
				.global	HPS_TIMER_ISR
HPS_TIMER_ISR:

				LDR		R0, =HPS_TIMER0_BASE	// base address of timer
				LDR		R6, =JP2_BASE			/* Load the address of the GPIO 2 pins */

				LDR   	R2, [R6]			/* Load contents of data register for GPIO 2 pins */
		 		MVN  	R3, R2				/* Move Binary 1010 to R3 */				
				AND		R3, R3, #0x1		/* Mask by ANDing with 1 */
				STR		R3, [R6]	  


				LDR		R0, [R0, #0xC]		// read timer end of interrupt register to
											// clear the interrupt
				BX			LR
				.end
