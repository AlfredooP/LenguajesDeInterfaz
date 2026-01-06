;TAREA06 

STACK SEGMENT PARA STACK 'STACK'
	DB 64 DUP (?)
STACK ENDS

DATA SEGMENT PARA PUBLIC 'DATA'
    MsgMenu DB 13, 10, 9, 9, 9, "a) Creditos", 10, 13, 9, 9, 9, "b) Elevar al cuadrado", 10, 13, 9, 9, 9, "c) Salir", 10, 13, 9, 9, 9, "INGRESE OPCION:", 10 , 13, "$"
	Creditos DB 9, 9, 9, "Alfredo Puentes Vargas", 10, 13, 9, 9, 9, "22130803", 10, 13, 9, 9, 9, "Captura y empleo de datos numericos", 10, 13, "$"
        OpcionB DB 13, 10, 9, 9, 9, "INGRESE EL NUMERO: $"
        MsgResul DB 13,10, 9, 9, 9, "EL CUADRADO ES: $"
		MsgOtra DB 13, 10, 9, 9, 9, "DESEA REALIZAR OTRA OPERACION? (S/N): $"
        Resul DB 3 dup('$')  
    Espacio DB 10, 13, "$"
DATA ENDS

CODE SEGMENT PARA PUBLIC 'CODE'
	ASSUME CS:CODE, DS:DATA, SS:STACK

	main:
		mov ax, DATA
		mov DS, ax
        mov cx, 15      ;Contador para ciclos de espacios
;ESPACIO DE ARRIBA
	arriba:
        mov dx, OFFSET Espacio
        mov ah, 9h
        INT 21h
		loop arriba
;IMPRIME MENU
	menu:
                mov dx, OFFSET MsgMenu
	    mov ah, 9h
	    INT 21h
        mov cx, 15      ;Contador para ciclos de espacios
;ESPACIO DE ABAJO
	abajo:
		mov dx, OFFSET Espacio
        mov ah, 9h
        INT 21h
		loop abajo
;LEER CARACTER	        
		mov ah, 1h
		INT 21h
;COMPARAR CON A
		cmp al, 61h
		je opcA
		jne compB
;COMPARAR CON B
	compB:
		cmp al, 62h
		je opcB
		jne compC
;COMPARAR CON C
	compC:
		cmp al, 63h
		je salida
		jne salida
;OPCION A
	opcA:
		mov dx, OFFSET Creditos
		mov ah, 9h
		INT 21h
		jmp menu
;OPCION B
	opcB:
		mov dx, OFFSET OpcionB
		mov ah, 9h
		INT 21h

		mov ah, 01h
		int 21h

    	sub al, '0'

    	mov bl, al

    	mul bl


		mov bx, 10
		xor cx, cx
		lea si, Resul + 2

	conv:
		xor dx, dx
		div bx               
		add dl, '0'
		dec si
		mov [si], dl
		inc cx
		cmp ax, 0
		jne conv

		mov ah, 09h
		lea dx, MsgResul
		int 21h

		mov ah, 09h
		mov dx, si
		int 21h

		mov dx, OFFSET MsgOtra
		mov ah, 9h
		INT 21h

		mov ah, 01h
                INT 21h


		cmp al, 'S'
		je opcB

		cmp al, 's'
		je opcB
		jne menu

;SALIR
	salida:
	        mov ax, 4C00h
        	INT 21h
CODE ENDS
	END main
 
