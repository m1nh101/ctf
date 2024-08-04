.section  .text
  .intel_syntax noprefix
  .global _start

; There are two major ways to manipulate control flow:
;  through a jump;
;  through a call.

; In this level, you will work with jumps.

; There are two types of jumps:
;   Unconditional jumps
;   Conditional jumps

; Unconditional jumps always trigger and are not based on the results of earlier instructions.

; As you know, memory locations can store data and instructions.

; Your code will be stored at 0x400017 (this will change each run).

; For all jumps, there are three types:
;   Relative jumps: jump + or - the next instruction.
;   Absolute jumps: jump to a specific address.
;   Indirect jumps: jump to the memory address specified in a register.

; In x86, absolute jumps (jump to a specific address) are accomplished by first putting the target address in a register reg, then doing jmp reg.

; In this level we will ask you to do an absolute jump.

; Perform the following:
;   Jump to the absolute address 0x403000

_start:
  mov   rax,  0x403000
  jmp   rax