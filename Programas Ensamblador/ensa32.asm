COMMENT & ENSA32.ASM
En este programa vamos a ejemplificar el uso de las siguientes instrucciones: SCAS, REPNE, JCXZ y
JMP.
El programa calcula la longitud de una cadena terminada en CERO colocando el resultado en la variable
result. &
maxlen EQU 255
;Longitud máxima de la cadena.
.MODEL Small
.STACK 100h
.DATA
cad DB 'Calculamos longitud de la cadena',0
result DW ?
.CODE
inicio:
mov ax, @data
mov ds, ax
mov es, ax
cld
mov cx, maxlen
mov al, 0
lea di, cad
mov dx, di
repne scasb
jcxz max_long
mov cx, di
sub cx, dx
mov result, cx
jmp SHORT fin;limpia bandera de dirección
;almacena en CX la longitud máxima
;Valor a encontrar
;DI offset del primer byte de cad ES:DI
;Guarda offset de inicio
;Realiza la búsqueda
;Salta si no encontró el 0 en 255 bytes
;Inicia el cálculo de la longitud
; CX  CX - DX
;Pone longitud en result
;Termina el programa
max_long:
mov cx, maxlen
mov result, cx;Pone en result el valor de 255
;indica que no encontró el CERO
fin:
mov ax, 4C00h
int 21h
END inicio
