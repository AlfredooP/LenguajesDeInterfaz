;Programa ENSA16A.ASM
;Uso de Operadores, segundo programa.
.386

STACK SEGMENT PARA STACK 'STACK'
        DB 64 DUP (?)
STACK ENDS

DATA SEGMENT PARA PUBLIC 'DATA'
a DB 10h, 20h, 30h, 40h, 50h
b DW 6070h, 8090h
c DD ?
d EQU 0AABBh
DATA ENDS

CSEG SEGMENT PARA PUBLIC USE16 'CODE'
        ASSUME CS:CSEG, DS:DATA, SS:STACK
inicio:
        mov ax, SEG DATA
        mov ds, ax
        mov eax, DWORD PTR a
        mov c, eax
        mov eax, DWORD PTR b
        add c, eax
        mov bh, HIGH d
        mov bl, LOW d
        mov ax, 4C00h
        INT 21h
        CSEG ENDS
        END inicio
