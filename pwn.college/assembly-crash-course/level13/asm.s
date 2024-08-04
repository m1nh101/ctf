.section  .text
  .intel_syntax noprefix
  .global _start

;same as level 11 but this challenge is write value from rax to the memory

_start:
  mov   [0x404000],   rax