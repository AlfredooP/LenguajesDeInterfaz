;Programa ensa13.asm, Uso de la directiva LABEL
.386

STACK SEGMENT PARA STACK 'STACK'
        DB 100 DUP(?)
STACK ENDS

DATA SEGMENT PARA PUBLIC 'DATA'
a label WORD
b label DWORD
ar DB 10h, 20h, 30h, 40h
DATA ENDS

CODE SEGMENT PARA PUBLIC USE16'CODE'
        ASSUME CD:CODE, DS:DATA, SS:STACK
inicio:
        mov ax, SEG DATA
        mov ds, ax
        mov bx, a
        mov cx, a+2
        mov eax, b
        mov ax, 4C00h
        INT 21h
CODE ENDS
        END inicio
