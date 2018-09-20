ENTRY(main)

MEMORY
{
    RAM_ITCM        (xrw) : ORIGIN = 0x00000000, LENGTH = 64K       /* over 64-bit bus - critical real-time routines */
    ROM_FLASH       (xrw) : ORIGIN = 0x08000000, LENGTH = 2048K     /* over 32-bit bus */
    RAM_DTCM        (xrw) : ORIGIN = 0x20000000, LENGTH = 128K      /* over 32-bit bus - critical real-time data ISR, stack, heap */
    RAM_D1_SRAM_AXI (xrw) : ORIGIN = 0x24000000, LENGTH = 512K      /* over 32-bit bus */
    RAM_D2_SRAM_ABH (xrw) : ORIGIN = 0x30000000, LENGTH = 288K      /* over 32-bit bus */
    RAM_D3_SRAM_ABH (xrw) : ORIGIN = 0x38000000, LENGTH = 64K       /* over 32-bit bus */
    RAM_SRAM_BCK    (xrw) : ORIGIN = 0x38800000, LENGTH = 4K        /* over 32-bit bus */
}

_estack = 0x20020000; /* highest address of DTCM - start of stack; end of DTCM */
_min_stack_size = 0x400; /* minimal stack size (1K), just for linker error in case .data/.bss overflows stack space */

SECTIONS
{
    .text : 
    {
        . = ALIGN(4);
        __text_start = .;

            *(.isr_vector)
            . = ALIGN(4);
            *(.text.reset)
            *(.text)

        . = ALIGN(4);
        __text_end = .;

        /* data copy will be stored here */
    } > ROM_FLASH

    .rodata :
    {
        . = ALIGN(4);
        __rodata_start = .;
            
            *(.rodata)
        
        . = ALIGN(4);
        __rodata_end = .;
    } > ROM_FLASH

    .data : AT( ADDR(.rodata) + SIZEOF(.rodata) )
    {
        . = ALIGN(4);
        __data_start = .;
        
            *(.data)
        
        . = ALIGN(4);
        __data_end = .;
    } > RAM_DTCM /* consider (if needed) moving to RAM_D1_SRAM_AXI and leave DTCM for stack */

    .bss :
    {
        . = ALIGN(4);
        __bss_start = .;
        
            *(.bss)
        
        . = ALIGN(4);
        __bss_end = .;
    } > RAM_DTCM /* consider (if needed) moving to RAM_D1_SRAM_AXI and leave DTCM for stack */

    .stack :
    {
        /* 64-bit alignment is required for stack pointer */
        /* ARMv7-M architecture manual (register CCR.STKALIGN) */
        . = ALIGN(8);
        . = . + _min_stack_size;
        . = ALIGN(8);
    } > RAM_DTCM

    .dwarf 0x00000000 :
    {
        *(.debug)
        *(.line)
        *(.debug_srcinfo)
        *(.debug_sfnames)
        *(.debug_aranges)
        *(.debug_pubnames)
        *(.debug_info)
        *(.gnu.linkonce.wi.*)
        *(.debug_abbrev)
        *(.debug_line)
        *(.debug_frame)
        *(.debug_str)
        *(.debug_loc)
        *(.debug_macinfo)
        *(.debug_weaknames)
        *(.debug_funcnames)
        *(.debug_typenames)
        *(.debug_varnames)
        *(.debug_macro)
        *(.ARM.attributes)
        *(.comment)
    }
    
    /DISCARD/ :
    {
        *(*.*)
    }
    
    
    
    
}