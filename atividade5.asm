loop:
    lb x10, 1025(x0)      # le caractere do teclado
    addi x11, x0, 42      # x11 vira '*' (42 em ASCII) para conferir
    beq x10, x11, end     # se digitou '*', sai do loop e terminar 

    sb x10, 1024(x0)      # mostra o caractere na tela
    jal x0, loop          # repete o loopis

end:
    halt
