TITLE Programa ENSA17.ASM
COMMENT $ Este programa ejemplifica el uso de:
                1) Un puntero
                2) Operadores de tipo
$

.MODEL Small
.STACK 100h

.DATA
a DB "Esta es una cadena"
pa DW a
b EQU THIS WORD
c DD 1887473824
d DW 16 DUP (?)
e label WORD
f DB 10h, 20h, 30h, 40h

.CODE
inicio:
        mov ax, DGROUP
        mov ds, ax
        mov ax, SEG pa
        mov bx, pa
        mov cx, OFFSET a
        mov dx, b
        mov di, e
        mov ax, SIZE d
        mov bx, TYPE d
        mov cx, LENGTH d
        mov ax, 4C00h
        INT 21h
        END inicio
