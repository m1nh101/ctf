.section  .text
  .intel_syntax noprefix
  .global _start

;Recall that memory is stored linearly.
;
;What does that mean?
;
;Say we access the quad word at 0x1337:
;  [0x1337] = 0x00000000deadbeef
;
;The real way memory is layed out is byte by byte, little endian:
;  [0x1337] = 0xef
;  [0x1337 + 1] = 0xbe
;  [0x1337 + 2] = 0xad
;  ...
;  [0x1337 + 7] = 0x00
;
;What does this do for us?
;
;Well, it means that we can access things next to each other using offsets,
;similar to what was shown above.
;
;Say you want the 5th *byte* from an address, you can access it like:
;  mov al, [address+4]
;
;Remember, offsets start at 0.
;
;Perform the following:
;  Load two consecutive quad words from the address stored in rdi
;  Calculate the sum of the previous steps quad words.
;  Store the sum at the address in rsi


_start:
  mov   rax,    [rdi]
  add   rax,    [rdi + 8]
  mov   [rsi],  rax
