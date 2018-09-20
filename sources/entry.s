.syntax unified
.cpu cortex-m7
.thumb

.global Default_Handler
.global reset

/* start address for the initialization values of the .data section. defined in linker script */
/* .word  _sidata */
/* start address for the .data section. defined in linker script */
/* .word  _sdata */
/* end address for the .data section. defined in linker script */
/* .word  _edata */
/* start address for the .bss section. defined in linker script */
/* .word  _sbss */
/* end address for the .bss section. defined in linker script */
/* .word  _ebss */
/* stack used for SystemInit_ExtMemCtl; always internal RAM used */

/**
 * @brief  This is the code that gets called when the processor first
 *          starts execution following a reset event. Only the absolutely
 *          necessary set is performed, after which the application
 *          supplied main() routine is called. 
 * @param  None
 * @retval : None
*/
.section .text.reset
    .type reset, %function
reset:  
    /* set stack pointer */
    ldr     sp, = _estack 

    /* handle data segment */
    /* start with idx/offset 0 */
    movs    r1, #0
    b       LoopCopyDataSection

CopyDataSection:
    /* __rodata_end is an starting point for .data copy in flash */
    ldr     r3, =__rodata_end
    ldr     r3, [r3, r1]    /* copy data stored in flash __rodata_end + r1 offset */
    str     r3, [r0, r1]    /* to __data_start in ram with r1 offset */
    adds    r1, r1, #4      /* move idx/offset by 4 bytes as ldr/str are 32-bits */
    
LoopCopyDataSection:
    ldr     r0, =__data_start
    ldr     r3, =__data_end
    adds    r2, r0, r1
    cmp     r2, r3          /* compare __data_start + r1 offset against __data_end to stop copy loop */
    bcc     CopyDataSection

    /* handle BSS segment */
    /* start with idx/offset 0 */
    ldr     r2, =__bss_start
    b       LoopFillZeroBSS

FillZeroBSS:
    movs    r3, #0
    str     r3, [r2], #4    /* update __bss_start(r2) + 4 bytes with 0(r3) */
    
LoopFillZeroBSS:
    ldr     r3, =__bss_end
    cmp     r2, r3
    bcc     FillZeroBSS

    /* call the clock system intitialization function */
    bl      SystemInit   
    /* call the application's entry point */
    bl      main
    bx      lr
.size reset, .-reset
