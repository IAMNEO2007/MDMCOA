.MODEL SMALL
.STACK 100H

.DATA
MSG DB 13,10,"8086 Flag Register Value: $"

.CODE
MAIN PROC

MOV AX,@DATA
MOV DS,AX

; Display message
LEA DX,MSG
MOV AH,09H
INT 21H

; Get flag register
PUSHF
POP AX

; Print high byte
MOV BL,AH
CALL PRINT_HEX

; Print low byte
MOV BL,AL
CALL PRINT_HEX

MOV AH,4CH
INT 21H

MAIN ENDP

; Procedure to print hex value
PRINT_HEX PROC

MOV CL,4
MOV CH,2

NEXT:
ROL BL,CL
MOV DL,BL
AND DL,0FH
CMP DL,09
JBE NUM
ADD DL,07

NUM:
ADD DL,30H
MOV AH,02H
INT 21H
DEC CH
JNZ NEXT
RET

PRINT_HEX ENDP

END MAIN