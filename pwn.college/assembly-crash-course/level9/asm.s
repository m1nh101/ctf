.section  .text
  .intel_syntax noprefix
  .global _start


;x86 allows you to 'shift' bits around in a register.
;Take, for instance, al, the lowest 8 bits of rax.
;The value in al (in bits) is:
;  rax = 10001010
;If we shift once to the left using the shl instruction:
;  shl al, 1
;The new value is:
;  al = 00010100
;Everything shifted to the left and the highest bit fell off
;while a new 0 was added to the right side.
;rdi = | B7 | B6 | B5 | B4 | B3 | B2 | B1 | B0 |
;Set rax to the value of B4

_start:
  mov   rax,    rdi   ;copy value from rdi to rax
  shl   rax,    24    ;a char represent for 4bit, from B7 to end of B5 take total 24 bits;
  shr   rax,    56    ;from start of B3 to the and take total 48 bits, previous instruction, remove 24 bit from left, but also add to the end 24 bits have zero value, so must have to shift right 56 bits in total;