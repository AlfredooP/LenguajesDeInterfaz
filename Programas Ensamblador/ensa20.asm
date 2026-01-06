COMMENT * ENSA20.ASM *
num EQU 5	;Número del cual se quiere obtener el cubo.
.MODEL Small
.STACK 100h
.DATA
cubo DB 0, 1, 8, 27, 64, 125, 216
.CODE
inicio:
	mov ax, @data
	mov ds, ax
	lea bx, cubo	;Ponemos en BX la dirección de cubo
	mov al, num	;En AL ponemos el 5.
	xlat		;Hacemos la búsqueda en la TABLA.
	mov ax, 4C00h
	int 21h
END inicio
