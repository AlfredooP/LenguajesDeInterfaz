COMMENT*Programa ENSA04.ASM. Inicializa SI y luego lo incrementa. Usa la estructura simplificada*
.MODEL Small
.STACK 100h
.CODE
inicio:
        mov si,2
        inc si
        inc si
        mov ax, 4C00h
        INT 21h
        END inicio
