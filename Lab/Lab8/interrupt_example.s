				.include	"address_map_arm.s"
				.include	"defines.s"
				.include	"interrupt_ID.s"

/*********************************************************************************
 * Initialize the exception vector table
 ********************************************************************************/
				.section .vectors, "ax"

				B 			_start					// reset vector
				B 			SERVICE_UND				// undefined instruction vector
				B 			SERVICE_SVC				// software interrrupt vector
				B 			SERVICE_ABT_INST		// aborted prefetch vector
				B 			SERVICE_ABT_DATA		// aborted data vector
				.word 	0							// unused vector
				B 			SERVICE_IRQ				// IRQ interrupt vector
				B 			SERVICE_FIQ				// FIQ interrupt vector

/* ********************************************************************************
 * This program demonstrates use of interrupts with assembly code. It first starts
 * two timers: an HPS timer, and the Altera interval timer (in the FPGA). The 
 * program responds to interrupts from these timers in addition to the pushbutton 
 * KEYs in the FPGA.
 *
 * The interrupt service routine for the HPS timer causes the main program to flash
 * the green light connected to the HPS GPIO1 port.
 * 
 * The interrupt service routine for the Altera interval timer displays a pattern 
 * on the HEX3-0 displays, and rotates this pattern either left or right:
 *		KEY[0]: loads a new pattern from the SW switches
 *		KEY[1]: rotates the displayed pattern to the right
 *		KEY[2]: rotates the displayed pattern to the left
 *		KEY[3]: stops the rotation
 ********************************************************************************/
				.text
				.global	_start
_start:		
				/* Set up stack pointers for IRQ and SVC processor modes */
				MOV		R1, #INT_DISABLE | IRQ_MODE
				MSR		CPSR_c, R1					// change to IRQ mode
				LDR		SP, =A9_ONCHIP_END - 3		// set IRQ stack to top of A9 onchip memory
				/* Change to SVC (supervisor) mode with interrupts disabled */
				MOV		R1, #INT_DISABLE | SVC_MODE
				MSR		CPSR_c, R1					// change to supervisor mode
				LDR		SP, =DDR_END - 3			// set SVC stack to top of DDR3 memory
				BL		CONFIG_HPS_TIMER			// configure the HPS timer					

/* Configure the HPS timer to create interrupts at one-second intervals */
CONFIG_HPS_TIMER:
				/* initialize the HPS timer */
				LDR 		R0, =HPS_TIMER0_BASE	// base address
				MOV		R1, #0						// used to stop the timer
				STR		R1, [R0, #0x8]				// write to timer control register
				LDR		R1, =100000000				// period = 1/(100 MHz) x (100 x 10^6) = 1 sec
				STR		R1, [R0]					// write to timer load register
				MOV		R1, #0b011					// int mask = 0, mode = 1, enable = 1
				STR		R1, [R0, #0x8]				// write to timer control register
				BX			LR

