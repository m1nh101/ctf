.section  .text
  .intel_syntax noprefix
  .global _start

;compute following:
;speed = distance / time, where:
;    distance = rdi
;    time = rsi
;    speed = rax

;   rax register will be hold the result
;   rdx register will be hold remainder

_start:
  mov   rax,  rdi
  idiv  rsi