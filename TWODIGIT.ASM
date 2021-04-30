.model small
readno macro num        ;macro to read a number to num
mov ah,1h
int 21h
sub al,30h
mov num,al
endm

.data
msg1 db 0ah,0dh, "Enter the firsts digit: ","$"
msg2 db 0ah,0dh, "Enter the second digit: "," $"
msg3 db 0ah,0dh,0ah,0dh, "The entered number is "," $"
exit db 0ah,0dh,0ah,0dh, "Jibin George S6 CSE-A 63"," $"
num1 db ?
num2 db ?
.code
        mov ax,@data
        mov ds,ax

        mov dx,offset msg1
        mov ah,9h
        int 21h

        readno num1     ;read first digit
        mov bh,num1
        

        mov dx,offset msg2
        mov ah,9h
        int 21h

        readno num2     ;read second digit
        mov bl,num2

        mov cl,10h
        sub cl,30h
        mov al,bh
        mul cl
        add al,bl
        mov bx,ax

        mov dx,offset msg3
        mov ah,9h
        int 21h

        mov dl,cl       ;store first digit in al by dividing by 10
        mov ax,bx
        div dl
        add al,30h
        add ah,30h
        mov bx,ax

        mov dl,bl       ;print first digit
        mov ah,2h
        int 21h

        mov dl,bh       ;print second digit
        mov ah,2h
        int 21h

        mov dx,offset exit      ;exiting
        mov ah,9h
        int 21h

        mov ah,4ch      ;exit
        int 21h

end
