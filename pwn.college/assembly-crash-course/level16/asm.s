.section  .text
  .intel_syntax noprefix
  .global _start

;Similar knownlege from level 15
;Please perform the following:
;  Set rax to the byte at 0x404000
;  Set rbx to the word at 0x404000
;  Set rcx to the double word at 0x404000
;  Set rdx to the quad word at 0x404000

_start:
  mov   al,   [0x404000]
  mov   bx,   [0x404000]
  mov   ecx,  [0x404000]
  mov   rdx,  [0x404000]