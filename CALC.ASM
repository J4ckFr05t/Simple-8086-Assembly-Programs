.model small

readn macro no
mov ah,01h
int 21h
sub al,30h
mov no,al
endm

disp macro msg
mov dx,offset msg
mov ah,09h
int 21h
endm

disp2 macro
mov dl,al
mov ah,02h
int 21h
endm

.data
msg1 db 0dh,0ah,"1.add",0dh,0ah,"2.sub",0dh,0ah,"3.mul",0dh,0ah,"4.div",0dh,0ah,"5. exit",0dh,0ah,"enter choice = ","$"
msg2 db 0dh,0ah,"enter number = ","$"
m_sum db 0dh,0ah,"sum = ","$"
m_sub db 0dh,0ah,"subtracted = ","$"
m_mul db 0dh,0ah,"product = ","$"
m_div db 0dh,0ah,"quotient = ","$"
m_exit db 0dh,0ah,"Jibin George 63 CSEA...",0dh,0ah,"$"
ch1 db ?
num1 db ?
num2 db ?

.code
start : mov ax,@data
        mov ds,ax
        disp msg1           ;display menu
        readn ch1
        cmp ch1,05h         ;invalid option
        jz exit

        disp msg2           ;read first number to num1
        readn num1

        disp msg2           ;read second number to num2        
        readn num2

        cmp ch1,01h         ;addition
        jz f_add

        cmp ch1,02h         ;substraction
        jz f_sub

        cmp ch1,03h         ;multiplication
        jz f_mul

        cmp ch1,04h         ;division
        jz f_div

exit :  jmp exit1           ;exit program


f_add:  mov al,num1
        add al,num2
        add al,30h
        disp m_sum
        disp2
        jmp start

f_sub:  mov al,num1
        sub al,num2
        add al,30h
        disp m_sub
        disp2
        jmp start

f_mul:  mov al,num1
        mul num2
        add al,30h
        disp m_mul
        disp2
        jmp start

f_div:  mov ah,00h 
        mov al,num1
        mov bl,num2
        div bl     
        add al,30h
        disp m_div
        disp2
        jmp start

exit1 : disp m_exit
        mov ah,4ch
        int 21h
        end
