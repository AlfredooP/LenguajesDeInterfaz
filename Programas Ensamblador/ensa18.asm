;Ensa 18.asm

.model small
.stack 20h

.data
dato1 db "La clase de Lenguaje Ensamblador$"

.code
inicio:
        mov ax, @data
        mov ds, ax
        mov ah, 02h
        mov bh, 00h
        mov dx, 100Ch
        INT 10h
        mov ah, 06
        mov al, 00
        mov bh, 57h
        mov cx, 00
        mov dx, 184Fh
        INT 10h
        mov dx, offset dato1
        mov ah, 09h
        INT 21h
        mov ax, 4C00h
        INT 21h
        end inicio
