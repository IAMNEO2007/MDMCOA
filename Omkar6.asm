.MODEL SMALL
.STACK 100H

.DATA
filename    DB "testfile.txt",0
handle      DW ?
buffer      DB 150 DUP(?)   		 

message DB "Hey I am BATMAN!",13,10
 DB "Perform by OM BHOR",13,10
msgLen EQU $ - message

readMsg DB 13,10,"File Content:",13,10,"$"

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
	
;----------------------------------------
; 1. CREATE FILE (AH=3Ch)
;----------------------------------------
    MOV AH, 3CH
    MOV CX, 0
    LEA DX, filename
    INT 21H
    JC ERROR
    MOV handle, AX

;----------------------------------------
; 2. WRITE TO FILE (AH=40h)
;----------------------------------------
    MOV AH, 40H
    MOV BX, handle
    MOV CX, msgLen
    LEA DX, message
    INT 21H
    JC ERROR
	
;----------------------------------------
; 3. CLOSE FILE
;----------------------------------------
    MOV AH, 3EH
    MOV BX, handle
    INT 21H
		
;----------------------------------------
; 4. OPEN FILE (Read Mode)
;----------------------------------------
    MOV AH, 3DH
    MOV AL, 0
    LEA DX, filename
    INT 21H
    		JC ERROR
    		MOV handle, 	AX
	
;----------------------------------------
; 5. READ FILE
;----------------------------------------
    MOV AH, 3FH
    MOV BX, handle
    MOV CX, 150
    LEA DX, buffer
    INT 21H
    JC ERROR
		
   		 MOV SI, AX  	      ; Number of bytes read

;----------------------------------------
; 6. DISPLAY "File Content:"
;----------------------------------------
    MOV AH, 09H
    LEA DX, readMsg
    INT 21H

;----------------------------------------
; 7. DISPLAY FILE CONTENT
;----------------------------------------
    MOV AH, 40H
    MOV BX, 1
    MOV CX, SI
    LEA DX, buffer
    INT 21H

;----------------------------------------
; 8. CLOSE FILE
;----------------------------------------
    MOV AH, 3EH
    MOV BX, handle
    INT 21H

;----------------------------------------
; EXIT PROGRAM
;----------------------------------------
    MOV AH, 4CH
    INT 21H
		
ERROR:	
    MOV AH, 4CH
    MOV AL, 01
    INT 21H
		
MAIN ENDP
END MAIN