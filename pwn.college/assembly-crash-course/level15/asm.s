.section  .text
  .intel_syntax noprefix
  .global _start

;Recall that registers in x86_64 are 64 bits wide, meaning they can store 64 bits.
;
;Similarly, each memory location can be treated as a 64 bit value.
;
;We refer to something that is 64 bits (8 bytes) as a quad word.
;
;Here is the breakdown of the names of memory sizes:
;  Quad Word   = 8 Bytes = 64 bits
;  Double Word = 4 bytes = 32 bits
;  Word        = 2 bytes = 16 bits
;  Byte        = 1 byte  = 8 bits
;
;In x86_64, you can access each of these sizes when dereferencing an address, just like using
;bigger or smaller register accesses:
;  mov al, [address]        <=>        moves the least significant byte from address to rax
;  mov ax, [address]        <=>        moves the least significant word from address to rax
;  mov eax, [address]       <=>        moves the least significant double word from address to rax
;  mov rax, [address]       <=>        moves the full quad word from address to rax
;
;Remember that moving into al does not fully clear the upper bytes.


_start:
  mov   al,   [0x404000]