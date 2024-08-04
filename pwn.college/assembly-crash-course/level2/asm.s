.section  .text
  .intel_syntax noprefix
  .global _start

_start:
  mov   rax,  0x1337              ;copy 1337 in hexademical to rax reggister
  mov   r12,  0xCAFED00D1337BEEF  ;copy 0xCAFED00D1337BEEF in hexademical to r12 register
  mov   rsp,  0x31337             ;copy 0x31337 in hexademical to rsp register