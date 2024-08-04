.section  .text
  .intel_syntax noprefix
  .global _start

; In this level we will ask you to do a relative jump.

; You will need to fill space in your code with something to make this relative jump possible.

; We suggest using the `nop` instruction. It's 1 byte long and very predictable.

; In fact, the as assembler that we're using has a handy .rept directive that you can use to
; repeat assembly instructions some number of times:
;   https://ftp.gnu.org/old-gnu/Manuals/gas-2.9.1/html_chapter/as_7.html

; Useful instructions for this level:
;   jmp (reg1 | addr | offset) ; nop

; Hint: for the relative jump, lookup how to use `labels` in x86.

; Using the above knowledge, perform the following:
;   Make the first instruction in your code a jmp
;   Make that jmp a relative jump to 0x51 bytes from the current position
;   At the code location where the relative jump will redirect control flow set rax to 0x1

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
  nop 
  jmp   jump_here

jump_here:
  mov   rax,  0x1   ;copy 1 to rax