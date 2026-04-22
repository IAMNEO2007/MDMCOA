.MODEL SMALL
.STACK 100H

.DATA
MSG1 DB 13,10,"Study of Cache Memory Mapping Techniques",13,10,"$"

MSG2 DB 13,10,"1. Direct Mapping",13,10
     DB "Each memory block maps to one specific cache line.",13,10,"$"

MSG3 DB 13,10,"2. Associative Mapping",13,10
     DB "Any memory block can be placed in any cache line.",13,10,"$"

MSG4 DB 13,10,"3. Set Associative Mapping",13,10
     DB "Cache is divided into sets and block maps to a set.",13,10,"$"

.CODE
MAIN PROC

MOV AX,@DATA
MOV DS,AX

; Display Title
LEA DX,MSG1
MOV AH,09H
INT 21H

; Display Direct Mapping
LEA DX,MSG2
MOV AH,09H
INT 21H

; Display Associative Mapping
LEA DX,MSG3
MOV AH,09H
INT 21H

; Display Set Associative Mapping
LEA DX,MSG4
MOV AH,09H
INT 21H

MOV AH,4CH
INT 21H

MAIN ENDP
END MAIN