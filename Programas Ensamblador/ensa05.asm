TITLE ENSA05.ASM
COMMENT*Copia el contenido de una variable en otra*
.MODEL SMALL
.STACK 20h        
.DATA
a DW 1000
b DW ?
.CODE
inicio:
        mov ax, @data
        mov ds, ax
        mov bx, a
        mov b, bx
        mov ax, 4C00h
        INT 21h
        END inicio
