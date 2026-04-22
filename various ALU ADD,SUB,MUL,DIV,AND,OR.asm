.model small
.stack 100h

.data
num1 db 6
num2 db 3

msg1 db 13,10,'Addition = $'
msg2 db 13,10,'Subtraction = $'
msg3 db 13,10,'Multiplication = $'
msg4 db 13,10,'Division = $'
msg5 db 13,10,'AND = $'
msg6 db 13,10,'OR = $'

.code
main proc
    mov ax, @data
    mov ds, ax

; -------- ADD ----------
    lea dx, msg1
    mov ah, 09h
    int 21h
    mov al, num1
    add al, num2
    add al, 30h
    mov dl, al
    mov ah, 02h
    int 21h

; -------- SUB ----------
    lea dx, msg2
    mov ah, 09h
    int 21h
    mov al, num1
    sub al, num2
    add al, 30h
    mov dl, al
    mov ah, 02h
    int 21h

; -------- MUL ----------
    lea dx, msg3
    mov ah, 09h
    int 21h
    mov al, num1
    mov bl, num2
    mul bl
    add al, 30h
    mov dl, al
    mov ah, 02h
    int 21h

; -------- DIV ----------
    lea dx, msg4
    mov ah, 09h
    int 21h
    xor ax, ax
    mov al, num1
    mov bl, num2
    div bl
    add al, 30h
    mov dl, al
    mov ah, 02h
    int 21h

; -------- AND ----------
    lea dx, msg5
    mov ah, 09h
    int 21h
    mov al, num1
    and al, num2
    add al, 30h
    mov dl, al
    mov ah, 02h
    int 21h

; -------- OR ----------
    lea dx, msg6
    mov ah, 09h
    int 21h
    mov al, num1
    or al, num2
    add al, 30h
    mov dl, al
    mov ah, 02h
    int 21h

    mov ah, 4Ch
    int 21h
main endp
end main
