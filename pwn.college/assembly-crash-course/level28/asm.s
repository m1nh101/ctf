.section  .text
  .intel_syntax noprefix
  .global _start

; In previous levels you discovered the for-loop to iterate for a *number* of times, both dynamically and
; statically known, but what happens when you want to iterate until you meet a condition?

; A second loop structure exists called the while-loop to fill this demand.

; In the while-loop you iterate until a condition is met.

; As an example, say we had a location in memory with adjacent numbers and we wanted
; to get the average of all the numbers until we find one bigger or equal to 0xff:
;   average = 0
;   i = 0
;   while x[i] < 0xff:
;     average += x[i]
;     i += 1
;   average /= i

; Using the above knowledge, please perform the following:
;   Count the consecutive non-zero bytes in a contiguous region of memory, where:
;     rdi = memory address of the 1st byte
;     rax = number of consecutive non-zero bytes

; Additionally, if rdi = 0, then set rax = 0 (we will check)!

; An example test-case, let:
;   rdi = 0x1000
;   [0x1000] = 0x41
;   [0x1001] = 0x42
;   [0x1002] = 0x43
;   [0x1003] = 0x00

; then: rax = 3 should be set

_start:
  mov   rax,           0x0            ;initialize rax value to 0
  mov   rcx,           -1             ;initialize rcx value to -1
  cmp   rdi,           0x0            ;compare rdi with 0
  je    done                          ;end program if equal
  jmp   loop                          ;otherwise start loop

loop:
  add   rcx,           1              ;increase rcx value by 1
  mov   rsi,           [rdi + rcx]    ;copy value of memory offset to rsi
  cmp   rsi,           0x0            ;compare rsi value with 0
  jne   loop                          ;if not equal continue run the loop
  mov   rax,           rsi            ;otherwise move rsi value to rax;;

done:
  nop                                 ;do nothing