TITLE ENSA07.ASM
COMMENT $Este programa muestra:
        *El uso de Constantes
$       *El uso de las directivas de segmento simplificadas.
DOSSEG
.MODEL Small
.STACK

.CONST
a DW 43690
b DW 0AaAaH
c DW 1010101010101010b
d DT 1234567890
e DT -1234567890

.DATA
f DD 1.0
g DD 3F800000R
h DQ 0.1E1
i DT 1000.0E-3

.CODE
inicio:
        MOV AX, DGROUP
        MOV DS, ax
        MOV AX, a
        MOV BX, b
        MOV CX, c
        MOV AX, 4C00H
        INT 21h
        END inicio
