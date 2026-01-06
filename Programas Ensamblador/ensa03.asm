COMMENT + Programa usando el metodo simplificado. ENSA03.ASM +
.MODEL SMALL    ;Define el Modelo de memoria SMALL
.STACK 100h
.DATA
Dato DB 'Hola$'
.CODE
inicio:
        mov ax, @DATA
        mov ds, ax
        mov dx, OFFSET Dato
        mov ah, 9h
        INT 21h
        mov ax, 4c00h
        INT 21h
        end inicio
