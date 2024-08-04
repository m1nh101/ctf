.section  .text
  .intel_syntax noprefix
  .global _start

; On x86, the stack pointer is stored in the special register, rsp.
; rsp always stores the memory address of the top of the stack,
; i.e. the memory address of the last value pushed.

; Similar to the memory levels, we can use [rsp] to access the value at the memory address in rsp.

; Without using pop, please calculate the average of 4 consecutive quad words stored on the stack.

; Push the average on the stack.

; Hint:
;   RSP+0x?? Quad Word A
;   RSP+0x?? Quad Word B
;   RSP+0x?? Quad Word C
;   RSP      Quad Word D

_start:
  mov   rdi,  0x4
  mov   rax,  [rsp]
  add   rax,  [rsp + 8]
  add   rax,  [rsp + 16]
  add   rax,  [rsp + 24]
  idiv  rdi
  push  rax