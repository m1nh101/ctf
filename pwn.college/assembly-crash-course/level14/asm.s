.section  .text
  .intel_syntax noprefix
  .global _start

;Place the value stored at 0x404000 into rax
;Increment the value stored at the address 0x404000 by 0x1337
;rax register must keep original of [0x404000]
;value at [0x404000] must update after increment
_start:
  mov   rax,  [0x404000]      ;copy value from [0x404000] to rax
  mov   rdi,  rax             ;copy value from rax to rdi, to keep original value
  add   rax,  0x1337          ;increment rax's value
  mov   [0x404000],   rax     ;store new value from rax to [0x404000]
  mov   rax,  rdi             ;copy rdi value (original value of [0x404000]) to rax