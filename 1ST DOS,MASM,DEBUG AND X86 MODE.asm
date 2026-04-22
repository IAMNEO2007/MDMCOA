.MODEL SMALL
.STACK 100H

.DATA
msg DB 'Name: OM Bhor', '$'

.CODE
MAIN:
    MOV AX, @DATA
    MOV DS, AX

    MOV AH, 09H
    LEA DX, msg
    INT 21H

    MOV AH, 4CH
    INT 21H
END MAIN
