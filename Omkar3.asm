.model small
.stack 100h
.data
   hexNum dw 003Ah ; Hex number (3A = 58 decimal)
   bcd db 5 dup(0) ; To store BCD digits
   msg db 13,10,"BCD Equivalent: $"

.code
main proc
  mov ax, @data
  mov ds, ax
  ; Load hex number
  mov ax, hexNum
  mov cx, 0 ; digit counter

convert:
  mov dx, 0
  mov bx, 10
  div bx ; AX / 10
  push dx ; remainder
  inc cx
  cmp ax, 0
  jne convert

; Display message
lea dx, msg
mov ah, 09h
int 21h

display:
  pop dx
  add dl, 30h ; convert to ASCII
  mov ah, 02h
  int 21h
  loop display
  mov ah, 4Ch
  int 21h
main endp
end main