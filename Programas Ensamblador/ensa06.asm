TITLE ENSA06
COMMENT*Copia X en Y de atras hacia adelante*
DOSSEG
.MODEL Small
.STACK 100h
.DATA
x       DW 100, 1000, 10000, 40000
y       DW 4 dup(?)
.CODE
inicio:
        mov ax, @DATA
        mov ds, ax
        mov si, offset x
        mov di, offset y
        mov cx, 4h
lazo1:  push [si]
        inc si
        inc si
        loop lazo1
        mov cx, 4h
lazo2:  pop [di]
        inc di
        inc di
        loop lazo2
        mov ax, 4C00h
        INT 21h
        END inicio
