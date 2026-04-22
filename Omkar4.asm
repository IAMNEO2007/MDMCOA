.MODEL SMALL
.STACK 100H

.DATA
    msg1 DB 10,13,'Enter a string: $'
    msg2 DB 10,13,'You entered: $'

    ; Buffered input format
    buffer DB 20          ; max characters
           DB ?           ; actual characters entered
           DB 20 DUP('$') ; string storage

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Display "Enter a string"
    MOV AH, 09H
    LEA DX, msg1
    INT 21H

    ; Input string
    MOV AH, 0AH
    LEA DX, buffer
    INT 21H

    ; Display "You entered"
    MOV AH, 09H
    LEA DX, msg2
    INT 21H

    ; Display entered string
    LEA DX, buffer+2
    MOV AH, 09H
    INT 21H

    ; Exit program
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN