COMMENT *ENSA19.ASM
        *Intercambia el contenido de WORDS en un arreglo.

.MODEL Small
.STACK 100h

.DATA
arre DB 10h, 20h, 30h, 40h, 50h, 60h, 70h, 80h, 90h, 0A0h
numchar EQU $ - arre

.CODE
inicio:
        mov ax, @data
        mov ds, ax
        lea si, arre
        mov cx, numchar/2
uno:
        mov ax, WORD PTR [si]
        xchg ah, al
        mov WORD PTR [si], ax
        inc si
        inc si
        loop uno
        mov ax, 4C00h
        INT 21h
        END inicio
