TITLE Programa ENSA15.ASM Muestra uso de $ y la igualdad EQU
DOSSEG
.MODEL Small
.STACK 100h
.DATA
a DB "Hola Muchachas.",13,10
la EQU $ - a

.CODE
start:
        mov ax, @DATA
        mov ds, ax
        mov bx, 1
        mov cx, la
        lea dx, a
        mov ah, 40h
        INT 21h
        mov ax, 4C00h
        INT 21h
        END start
