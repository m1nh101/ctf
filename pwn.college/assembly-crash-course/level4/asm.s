.section  .text
  .intel_syntax noprefix
  .global _start

; calculate the following
;f(x) = mx + b, where:
;    m = rdi
;    x = rsi
;    b = rdx

_start:
  imul    rdi,  rsi   ;equivalent rdi = rdi * rsi
  add     rdi,  rdx   ;equivalent rdi = rdi + rdx
  mov     rax,  rdi   ;copy value from rdi register to rax register