.intel_syntax noprefix

str_lower:
        push    rbp                             ;save base pointer (from the caller)
        mov     rbp,    rsp                     ;create new base pointer
        mov     r8,     rdi                     ;copy rdi value to r8
        mov     rcx,    0x0                     ;set rcx value to 0
        cmp     r8,     0x0                     ;compare r8 with null
        je      .done                           ;jump to .done if equal

.while_loop:
        cmp     BYTE PTR [r8],  0x00            ;compare byte value of r8 register with null
        je      .done                           ;end loop if byte value of r8 is null
        cmp     BYTE PTR [r8],  0x5A            ;compare byte value of r8 with 0x5A
        jg      .next_char                      ;jump to .next_car if greater than 0x5A
        inc     rcx                             ;increase rcx by 1
        mov     dil,    BYTE PTR [r8]           ;store byte of r8 register to dil register as parameter
        mov     rax,    0x403000                ;copy memory address reference to foo to rax
        call    rax                             ;call foo
        mov     BYTE PTR [r8],  al              ;modify value of byte that r8 is holding

.next_char:
        inc     r8                              ;set up r8 reference to next byte
        jmp     .while_loop                     ;continue loop

.done: 
        mov     rax,    rcx                     ;copy value from rcx to rax
        leave                                   ;equivalent to mov rsp, rbp -> pop rbp
        ret                                     ;return to the caller