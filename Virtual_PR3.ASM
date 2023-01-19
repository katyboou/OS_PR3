org 7C00h

        jmp start

figure: db 'Utkina', 68 dup ' ', '••••• ',\
           'Ekaterina', 64 dup ' ', '•••••••', \
           'Igorevna', 65 dup ' ', '•••••••', \
           'NMT-303902', 64 dup ' ', '••••• ', 0

start:
        mov ah, 7Eh     ; пишем жёлтым на светло-сером фоне
        mov bx, 0B800h  ; адрес видео-сегмента
        mov es, bx      ; напрямую в сегментный регистр писать нельзя, поэтому пишем через bx
        mov di, 0       ; смещение в сегменте
        mov si, figure
        add di, 80 * 10 * 2 ; смещение в сегменте

loop1:
        mov al, [cs:si]
        cmp al, 0
        je exit
        mov [es:di], ax
        inc si
        add di, 2
        jmp loop1

        jmp exit

exit:
        db 510-($-$$) dup 0
        dw 0AA55h