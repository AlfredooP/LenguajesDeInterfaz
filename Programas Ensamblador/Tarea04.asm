;TAREA04
.MODEL SMALL ;Especifica un modelo de memoria (2 segmentos)
.STACK 100h  ;Declaracion del segmento de pila (256B)
.CODE        ;Declaracion del segmento de codigo
Nombre DB "Alfredo Puentes Vargas", 10, 13, "$" ;Define una cadena para el nombre
Control DB "22130803", 10, 13, "$"              ;Define una cadena para el numero de control
Esp DB "Sistemas Computacionales$"              ;Define una cadena para la especialidad

inicio:
	mov ax, CS
	mov DS, ax
        mov dx, OFFSET Nombre
        mov ah, 9h
        INT 21h
        mov dx, OFFSET Control
        mov ah, 9h
        INT 21h
        mov dx, OFFSET Esp
        mov ah, 9h
        INT 21h
        mov ax, 4C00h   ;Se usa la funcion 4Ch de la
        INT 21h         ;Interrupcion 21h para salir al DOS
END inicio              ;Indica donde inicia la ejecucion.
