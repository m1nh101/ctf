#!/bin/sh

as -o asm.o asm.s &&
objcopy -O binary --only-section=.text ./asm.o ./asm.bin && 
cat ./asm.bin | /challenge/run