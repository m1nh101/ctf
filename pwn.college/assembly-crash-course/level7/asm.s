.section  .text
  .intel_syntax noprefix
  .global _start

;It turns out that using the div operator to compute the modulo operation is slow!
;We can use a math trick to optimize the modulo operator (%). Compilers use this trick a lot.
;If we have "x % y", and y is a power of 2, such as 2^n, the result will be the lower n bits of x.
;Therefore, we can use the lower register byte access to efficiently implement modulo!

_start:
  mov   al,   dil
  mov   bx,   si