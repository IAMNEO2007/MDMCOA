.MODEL SMALL
.STACK 100H

.DATA
msg DB 'Result = $'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Multiplicand and Multiplier
    MOV AL, 5
    MOV BL, 4

    MUL BL              ; AL * BL → AX (Result = 20)

    ; Print message
    MOV DX, OFFSET msg
    MOV AH, 09H
    INT 21H

    ; Convert result to decimal
    MOV AH, 0
    MOV BL, 10
    DIV BL              ; AL = tens, AH = ones

    ; Print tens digit
    ADD AL, 30H
    MOV DL, AL
    MOV AH, 02H
    INT 21H

    ; Print ones digit
    MOV AL, AH
    ADD AL, 30H
    MOV DL, AL
    MOV AH, 02H
    INT 21H

    ; Exit program
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN