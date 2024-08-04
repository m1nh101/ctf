.section  .text
  .intel_syntax noprefix
  .global _start

;use bracket [] to get what value store at the address in memory
;Place the value stored at 0x404000 into rax
_start:
  mov   rax,    [0x404000]  ;copy value at the 0x404000 memory address to rax