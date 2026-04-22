.MODEL SMALL
.STACK 100H

.DATA
msg1 DB 'Enter first number (-9 to 9): $'
msg2 DB 13,10,'Enter second number (-9 to 9): $'
msg3 DB 13,10,'Result = $'
num1 DB ?
num2 DB ?
result DW ?

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

; -------- Input first number --------
    MOV AH,09H
    LEA DX,msg1
    INT 21H

    MOV AH,01H         ; Read single character
    INT 21H
    SUB AL,30H         ; Convert ASCII to number
    MOV num1,AL

; -------- Input second number --------
    MOV AH,09H
    LEA DX,msg2
    INT 21H

    MOV AH,01H
    INT 21H
    SUB AL,30H
    MOV num2,AL

; -------- Signed Multiplication --------
    MOV AL,num1
    CBW                ; Convert AL to AX signed
    IMUL num2          ; AX = AL*num2 (signed)
    MOV result,AX

; -------- Display Result --------
    MOV AH,09H
    LEA DX,msg3
    INT 21H

    ; Convert result to ASCII
    MOV AX,result
    CMP AX,0
    JGE POSITIVE
    ; If negative, print '-' sign
    MOV DL,'-'
    MOV AH,02H
    INT 21H
    NEG AX
POSITIVE:
    ; Print tens digit (if any)
    MOV BX,10
    XOR DX,DX
    DIV BX             ; AX / 10 -> quotient in AX, remainder in DX
    ADD AL,30H
    MOV DL,AL
    MOV AH,02H
    INT 21H

    ; Print units digit
    ADD DL,0           ; Remainder is in DL
    MOV AL,AH
    ADD AH,30H
    MOV DL,AH
    MOV AH,02H
    INT 21H

; -------- Exit Program --------
    MOV AH,4CH
    INT 21H

MAIN ENDP
END MAIN