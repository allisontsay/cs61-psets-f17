OUTPUT_FORMAT(elf64-x86-64)
OUTPUT_ARCH(i386:x86-64)
ENTRY(boot_start)

SECTIONS {
    . = 0x7c00;

    /* Text segment: instructions only.
       The boot loader must fit in 512 bytes; there are no globals. */
    .text : {
        *(.text.unlikely .text.*_unlikely .text.unlikely.*)
        *(.text.exit .text.exit.*)
        *(.text.startup .text.startup.*)
        *(.text.hot .text.hot.*)
        *(.text .stub .text.* .gnu.linkonce.t.*)
    }

    /DISCARD/ : { *(.eh_frame .note.GNU-stack) }
}
