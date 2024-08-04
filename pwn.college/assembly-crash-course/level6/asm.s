.section  .text
  .intel_syntax noprefix
  .global _start

;compute rdi % rsi

_start:
  mov   rax,  rdi
  imul  rsi
  mov   rax,  rdx