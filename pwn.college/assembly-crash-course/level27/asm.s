.section  .text
  .intel_syntax noprefix
  .global _start

; In this level you will be working with control flow manipulation. This involves using instructions
; to both indirectly and directly control the special register `rip`, the instruction pointer.
; You will use instructions such as: jmp, call, cmp, and their alternatives to implement the requested behavior.



; In a previous level you computed the average of 4 integer quad words, which
; was a fixed amount of things to compute, but how do you work with sizes you get when
; the program is running?

; In most programming languages a structure exists called the
; for-loop, which allows you to do a set of instructions for a bounded amount of times.
; The bounded amount can be either known before or during the programs run, during meaning
; the value is given to you dynamically.

; As an example, a for-loop can be used to compute the sum of the numbers 1 to n:
;   sum = 0
;   i = 1
;   while i <= n:
;     sum += i
;     i += 1

; Please compute the average of n consecutive quad words, where:
;   rdi = memory address of the 1st quad word
;   rsi = n (amount to loop for)
;   rax = average computed

;I demonstrate for loop in assembly not while loop

_start:
  mov   rbx,    0x0                 ;set rbx as sum variable and set value to 0;
  mov   rcx,    0x0                 ;set rcx as i variable and set value to 0;
  jmp   loop                        ;jmp to loop

loop:
  cmp   rcx,    rsi                 ;compare i vs rsi
  je    done                        ;quit loop if i (rcx) equal to rsi
  add   rbx,    [rdi + rcx * 8]     ;addition value to sum (rbx), since quad word take 8 bit so have to multiple i (rcx) with 8;
  inc   rcx                         ;increase i (rcx) value by 1
  jmp   loop                        ;loop again

done:
  mov   rax,    rbx                 ;copy value from rbx to rax
  idiv  rsi                         ;division rax