;Programa ENSA16.ASM
;Uso de Operadores, segundo programa.

STACK SEGMENT PARA STACK 'STACK'
        DB 64 DUP (?)
STACK ENDS

DATA SEGMENT PARA PUBLIC 'DATA'
a DB 10h, 20h, 30h, 40h, 50h
b DW 6070h, 8090h
c DD ?
d EQU 0AABBh
DATA ENDS

CSEG SEGMENT PARA PUBLIC 'CODE'
        ASSUME CS:CSEG, DS:DATA, SS:STACK
inicio:
        mov ax, SEG DATA
        mov ds, ax
        mov ax, WORD PTR a
        mov WORD PTR c[0], ax
        mov ax, WORD PTR a[2]
        mov WORD PTR c[2], ax
        mov ax, b
        add WORD PTR c[0], ax
        mov ax, b[2]
        adc WORD PTR c[2], ax
        mov bh, HIGH d
        mov bl, LOW d
        mov ax, 4C00h
        INT 21h
        CSEG ENDS
        END inicio
