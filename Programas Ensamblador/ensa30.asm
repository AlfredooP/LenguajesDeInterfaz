COMMENT + ENSA30.ASM. En este programa se muestra las diferentes instrucciones de salto condicional.+
.MODEL Small
.STACK 100h
.CONST
A1 DB "Destino > Fuente",10,13,'$'
A2 DB "Destino < Fuente",10,13,'$'
A3 DB "Destino = Fuente",10,13,'$'
A4 DB "Destino >= Fuente",10,13,'$'
A5 DB "Destino <= Fuente",10,13,'$'
TBL dw cmd1, cmd2, cmd3, cmd4
.DATA
a DB 88h
aa DB 88h
b DB 0A6h
c1 DB -90
c2 DB -90
d DB -120
.CODE
inicio:
mov ax, DGROUP
mov ds, ax
mov ah, 9
xor si, si
mov bl, b
cmp bl, a
ja uno
cmd1:
mov si, 2
mov bl, a
cmp bl, b
jb tres
cmd2:
mov si, 4
mov bl, a
cmp bl, aa
je cinco
cmd3:
mov si, 6
mov bl, c1
cmp bl, d
jg siete
cmd4:
mov si, 8
mov bl, d
cmp bl, c1
jl nueve
uno:
lea dx, A1
int 21h
jmp TBL[si]
tres:
lea dx, A2
int 21h
jmp TBL[si]
cinco:
lea dx, A3
int 21h
jmp TBL[si]
siete:
lea dx, A1
int 21h
jmp TBL[si]
nueve:
lea dx, A2
int 21h
mov ax, 4C00h
int 21h
END inicio
