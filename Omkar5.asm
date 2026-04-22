.MODEL SMALL
.STACK 100H

.CODE
MAIN PROC
    ; Set graphics mode 13H (320x200, 256 colors)
    MOV AH, 00H
    MOV AL, 13H
    INT 10H

    ; ----------------------
    ; Draw Square
    ; ----------------------
    MOV CX, 50      ; X start
    MOV DX, 50      ; Y start
    MOV BL, 04      ; Color (Red)

SQUARE:
    MOV AH, 0CH
    MOV AL, BL
    INT 10H
    INC CX
    CMP CX, 100
    JNE SQUARE

    MOV CX, 50
    INC DX
    CMP DX, 100
    JNE SQUARE

    ; ----------------------
    ; Draw Rectangle
    ; ----------------------
    MOV CX, 120
    MOV DX, 50
    MOV BL, 02      ; Color (Green)

RECT:
    MOV AH, 0CH
    MOV AL, BL
    INT 10H
    INC CX
    CMP CX, 200
    JNE RECT

    MOV CX, 120
    INC DX
    CMP DX, 100
    JNE RECT

    ; ----------------------
    ; Draw Triangle
    ; ----------------------
    MOV CX, 50
    MOV DX, 120
    MOV BL, 01      ; Color (Blue)

TRI:
    MOV AH, 0CH
    MOV AL, BL
    INT 10H
    INC CX
    INC DX
    CMP CX, 100
    JNE TRI

    ; Wait for key press
    MOV AH, 00H
    INT 16H

    ; Return to text mode
    MOV AH, 00H
    MOV AL, 03H
    INT 10H

    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN