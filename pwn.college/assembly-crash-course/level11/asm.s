.section  .text
  .intel_syntax noprefix
  .global _start

;Implement the following logic:
;  if x is even then
;    y = 1
;  else
;    y = 0
;
;where:
;  x = rdi
;  y = rax

_start:
  xor   rax,  rax   ;make rax register value equal to 0
  and   rdi,  1     ;store and bitwise value to rdi, if last bit is equal to 1 that the number is odd
  or    rax,  rdi   ;store or bitwise value to rax, if 
  xor   rax,  1     ;store xor bitwise value to rax, final result;