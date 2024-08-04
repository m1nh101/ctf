.section  .text
  .intel_syntax noprefix
  .global _start


; In this level you will be working with control flow manipulation. This involves using instructions
; to both indirectly and directly control the special register `rip`, the instruction pointer.
; You will use instructions such as: jmp, call, cmp, and their alternatives to implement the requested behavior.



; Now, we will combine the two prior levels and perform the following:
;   Create a two jump trampoline:
;     Make the first instruction in your code a jmp
;     Make that jmp a relative jump to 0x51 bytes from its current position
;     At 0x51 write the following code:
;       Place the top value on the stack into register rdi
;       jmp to the absolute address 0x403000

_start:
  nop 
  nop 
  nop 
  nop 
  nop 
  nop 
  nop 
  nop 
  nop 
  nop 
  nop 
  nop 
  nop 
  nop 
  nop 
  nop 
  nop 
  nop 
  nop 
  nop 
  nop 
  nop 
  nop 
  nop 
  nop 
  nop 
  nop 
  nop 
  nop 
  nop 
  nop 
  nop 
  nop 
  nop 
  nop 
  nop 
  nop 
  nop 
  nop 
  nop 
  nop 
  nop 
  nop 
  nop 
  nop 
  nop 
  nop
  nop 
  nop 
  nop 
  nop 
  nop 
  nop 
  nop 
  nop 
  nop 
  nop 
  nop 
  nop 
  nop 
  nop 
  nop 
  nop 
  nop 
  nop 
  nop 
  nop 
  nop 
  nop 
  nop 
  nop 
  nop 
  nop 
  nop 
  nop 
  nop 
  nop 
  nop 
  nop 
  nop 
  jmp   jump_here

jump_here:
  pop   rdi
  mov   rax,  0x4003000
  jmp   rax