INT21 EQU 21h

STACK SEGMENT PARA STACK 'STACK'
        DB 100 DUP(?)
STACK ENDS

DATA SEGMENT PARA PUBLIC 'DATA'
x DB 0AAh, 0BBh, 0CCh, 0DDh, 0EEh, 0FFh
a EQU x + 4
b EQU a - 2
c EQU 50 MOD 9
d EQU NOT 0F0h
DATA ENDS

CODE SEGMENT PARA PUBLIC 'CODE'
        ASSUME CS:CODE, DS:DATA, SS:STACK

inicio:
        mov ax, SEG DATA
        mov ds, ax
        mov ch, c SHL 1
        mov cl, 4
        SHL x[2], cl
        mov cl, b
        mov, ax, d AND 0Afh
        mov ch, a
        add ch, c
        mov bx, 4 EQ 3
        mov si, 4 NE 3
        mov ax, 4C00h
        INT INT21
CODE ENDS
        END inicio
