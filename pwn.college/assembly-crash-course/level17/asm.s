.section  .text
  .intel_syntax noprefix
  .global _start

;It is worth noting, as you may have noticed, that values are stored in reverse order of how we
;represent them.
;
;As an example, say:
;  [0x1330] = 0x00000000deadc0de
;
;If you examined how it actually looked in memory, you would see:
;  [0x1330] = 0xde
;  [0x1331] = 0xc0
;  [0x1332] = 0xad
;  [0x1333] = 0xde
;  [0x1334] = 0x00
;  [0x1335] = 0x00
;  [0x1336] = 0x00
;  [0x1337] = 0x00
;
;This format of storing things in 'reverse' is intentional in x86, and its called "Little Endian".
;
;For this challenge we will give you two addresses created dynamically each run.
;
;The first address will be placed in rdi.
;The second will be placed in rsi.
;
;Using the earlier mentioned info, perform the following:
;  Set [rdi] = 0xdeadbeef00001337
;  Set [rsi] = 0xc0ffee0000

_start:
  mov   rax,    0xdeadbeef00001337
  mov   [rdi],  rax
  mov   rax,    0xc0ffee0000
  mov   [rsi],  rax