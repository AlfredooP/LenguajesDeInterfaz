;EQUIPO 4
.MODEL Small
.CONST
    Presentacion DB 13, 10, '<=== EQUIPO 4: "CALCULADORA BASICA" ===>', 10, 13, "- Alfredo Puentes Vargas", 10, 13, "- Alejandrina Reyes", 10 ,13, "$"
    MenuMsg DB 10, 10, 13, "MENU DE OPCIONES:", 10, 13, 9, "A. Suma", 10, 13, 9, "B. Resta", 10, 13, 9, "C. El cuadrado de un numero", 10, 13, 9, "D. Salir", 10, 13, "INGRESE OPCION: $"
    PrimerNumMsg DB 10, 13, "INGRESE EL PRIMER NUMERO: $"
    SegundoNumMsg DB 10, 13, "INGRESE EL SEGUNDO NUMERO: $"
    ResulMsg DB 13,10, "EL RESULTADO ES: $"
    ErrorOpcMsg DB 10, 13, "ERROR: OPCION INVALIDA. INTENTE DE NUEVO.", 10, 13, "$"

.DATA
    PrimerNum DB 3 DUP(?)
    SegundoNum DB 3 DUP(?)
    Resul DB 3 DUP(?)

.CODE
Main:
; Inicializar DS
    MOV ax, @data
    MOV DS, ax

; Presentacion
    MOV dx, OFFSET Presentacion
    MOV ah, 9h
    INT 21h

; Menu de opciones
Menu:
    MOV dx, OFFSET MenuMsg
    MOV ah, 9h
    INT 21h

; Leer opcion del usuario
    MOV ah, 1h
    INT 21h

; Fuerza la entrada a mayúscula (borra el bit 5, que diferencia mayúsculas/minúsculas)
    AND al, 11011111b

; Comparar la opcion ingresada
    CMP al, 'A'
    JE Suma
    CMP al, 'B'
    JE Resta
    CMP al, 'C'
    JE PuenteACuadrado
    CMP al, 'D'
    JE PuenteASalida

; Opcion invalida
    MOV dx, OFFSET ErrorOpcMsg
    MOV ah, 9h
    INT 21h
    JMP menu

; Salta a la opción C (Debido a que esta fuera de alcance)
PuenteACuadrado:
    JMP Cuadrado

; Opcion A: Suma
Suma:
; Pedir primer numero
    MOV dx, OFFSET PrimerNumMsg
    MOV ah, 9h
    INT 21h

; Leer primer numero
    MOV ah, 1h
    INT 21h

; Validar si es un numero
    CMP al, '0'
    JB suma
    CMP al, '9'
    JA suma
    JMP ContSuma1

ContSuma1:
; Convertir caracteres a numeros
    SUB al, '0'
    MOV PrimerNum, al

; Pedir segundo numero
    MOV dx, OFFSET SegundoNumMsg
    MOV ah, 9h
    INT 21h
    
; Leer segundo numero
    MOV ah, 1h
    INT 21h

; Validar si es un numero
    CMP al, '0'
    JB suma
    CMP al, '9'
    JA suma

; Convertir caracteres a numeros
    SUB al, '0'
    MOV SegundoNum, al

; Sumar los dos numeros
    MOV al, PrimerNum
    ADD al, SegundoNum

; Guardar resultado
    MOV bl, al
    JMP Convertir


; Salta a la salida (Debido a que esta fuera de alcance)
PuenteASalida:
    JMP salida

; Opcion B: Resta
resta:
; Pedir primer numero
    MOV dx, OFFSET PrimerNumMsg
    MOV ah, 9h
    INT 21h

; Leer primer numero
    MOV ah, 1h
    INT 21h

; Validar si es un numero
    CMP al, '0'
    JB resta
    CMP al, '9'
    JA resta

; Convertir caracteres a numeros
    SUB al, '0'
    MOV PrimerNum, al

; Pedir segundo numero
    MOV dx, OFFSET SegundoNumMsg
    MOV ah, 9h
    INT 21h    

; Leer segundo numero
    MOV ah, 1h
    INT 21h

; Validar si es un numero
    CMP al, '0'
    JB resta
    CMP al, '9'
    JA resta

; Convertir caracteres a numeros
    SUB al, '0'
    MOV SegundoNum, al

; Restar los dos numeros
    MOV al, PrimerNum
    SUB al, SegundoNum

; Guardar resultado
    MOV bl, al
    JMP Convertir

; Opcion C: Cuadrado
Cuadrado:
; Pedir primer numero
    MOV dx, OFFSET PrimerNumMsg
    MOV ah, 9h
    INT 21h

; Leer primer numero
    MOV ah, 1h
    INT 21h

; Validar si es un numero
    CMP al, '0'
    JB cuadrado
    CMP al, '9'
    JA cuadrado

; Convertir caracteres a numeros  
    SUB al, '0'
    MOV PrimerNum, al

; Multiplicar el numero por si mismo
    MOV al, PrimerNum
    MOV bl, al
    MUL bl

; Guardar resultado
    MOV bl, al
    JMP Convertir

Convertir: ; El resultado debe estar en BL
; Convertir el resultado a decimal
    MOV ax, 0
    MOV al, bl
    MOV ah, 0
    MOV bl, 10
    DIV bl; AL / 10, AH = residuo

; Convertir el cociente a ASCCI
    ADD al, '0'
    MOV Resul, al

; Convertir el residuo a ASCCI
    ADD ah, '0'
    MOV Resul+1, ah

; Agregar el terminador de cadena
    MOV Resul+2, '$'

Resultados:
; Mostrar el mensaje del resultado
    MOV dx, OFFSET ResulMsg
    MOV ah, 09h
    INT 21h

; Mostrar el resultado
    MOV dx, OFFSET Resul
    MOV ah, 09h
    INT 21h

    JMP Menu

; Salir
	salida:
	        mov ax, 4C00h
        	INT 21h


END main
