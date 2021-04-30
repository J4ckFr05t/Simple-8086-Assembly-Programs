.model small
.data
msg1 db 0ah,0dh,"enter first number :$"
msg2 db 0ah,0dh,"enter second number :$"
msg3 db 0ah,0dh," RESULT: $"
.code
        mov ax,@data
        mov ds,ax

        mov dx,offset msg1
        mov ah,09h
        int 21h

        mov ah,01h
        int 21h
        sub al,30h
        mov bl,al

        mov dx,offset msg2
        mov ah,09h
        int 21h

        mov ah,01h
        int 21h
        sub al,30h

        mul bl
        mov bl,al
        mov dx,offset msg3
        mov ah,09h
        int 21h

        add bl,30h

        mov dl,bl
        mov ah,02h
        int 21h

        mov ah,4ch
        int 21h

end
