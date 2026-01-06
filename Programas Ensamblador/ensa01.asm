;Programa ENSA01.ASM
CODE SEGMENT
ORG 100h
ASSUME CS:CODE, DS:CODE, ES:CODE, SS:CODE
inicio: jmp principio
Dato DB "Hola$"
principio:
        mov dx, OFFSET Dato
        mov ah, 09h
        INT 21h
        mov ax, 4c00h
        INT d21h
CODE    ENDS
        END inicio
