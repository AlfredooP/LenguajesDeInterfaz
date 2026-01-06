;TAREA05
STACK SEGMENT PARA STACK 'STACK'	;Inicio del segmento de pila.
	DB 64 DUP (?)			;Se reservan 64 bytes
STACK ENDS				;Fin de la pila.
DATA SEGMENT PARA PUBLIC 'DATA'		;Inicia segmento de datos.
        Nombre DB 9, 9, 9, "Alfredo Puentes Vargas", 10, 13, "$"
        Control DB 9, 9, 9, "22130803", 10, 13, "$"              
        Esp DB 9, 9, 9, "Sistemas Computacionales", 10, 13, "$"
        Espacio DB 10, 13, "$"
DATA ENDS				;Fin del segmento de datos.
CODE SEGMENT PARA PUBLIC 'CODE'		;Inicia segmento de código.
        ASSUME CS:CODE, DS:DATA, SS:STACK

	inicio:
		mov ax, DATA
		mov DS, ax
                mov cx, 11
	arriba:
                mov dx, OFFSET Espacio
                mov ah, 9h
                INT 21h
		loop arriba
	        mov dx, OFFSET Nombre
	        mov ah, 9h
	        INT 21h
	        mov dx, OFFSET Control
	        mov ah, 9h
	        INT 21h
	        mov dx, OFFSET Esp
	        mov ah, 9h
	        INT 21h
                mov cx, 11
	abajo:
		mov dx, OFFSET Espacio
                mov ah, 9h
                INT 21h
		loop abajo
	        mov ax, 4C00h   ;Se usa la funcion 4Ch de la
        	INT 21h         ;Interrupcion 21h para salir al DOS
CODE ENDS
	END inicio              ;Indica donde inicia la ejecucion.
