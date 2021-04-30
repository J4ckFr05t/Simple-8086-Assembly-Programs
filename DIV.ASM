.model small
.data
msg1 db 0ah,0dh,"enter divident: $"
msg2 db 0ah,0dh,"enter divisor: $"
msg3 db 0ah,0dh,"quotient: $"
msg4 db 0ah,0dh,"remainder: $"
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
	mov dl,al

	mov al,bl
	xor ah,ah
	div dl
	add al,30h
	add ah,30h
	mov bx,ax

	mov dx,offset msg3
	mov ah,09h
	int 21h

	mov dl,bl
	mov ah,02h
	int 21h

	mov dx,offset msg4
	mov ah,09h
	int 21h
	
	mov dl,bh
	mov ah,02h
	int 21h

	mov ah,4ch
	int 21h
end



