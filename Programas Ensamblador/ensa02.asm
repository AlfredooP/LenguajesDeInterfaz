;Programa ENSA02.ASM
STACK SEGMENT PARA STACK 'STACK'
        DB 64 DUP (?)
STACK ENDS

CODE SEGMENT PARA PUBLIC 'CODE'
        ASSUME CS:CODE, DS:CODE, ES:CODE, SS:STACK

inicio:jmp principio

Dato DB 'Hola$'
principio:
        mov ax, CS
        mov ds, ax
        mov dx, OFFSET Dato
        mov ah, 9h
        INT 21h
        mov ax, 4C00h
        INT 21h
CODE ENDS
        END inicio
