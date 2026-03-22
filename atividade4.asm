addi x17, x0, 28        # valor inicial da memoria (H)  

loop:
    lb x10, 0(x17)      # le o valor na memoria 0 + x17 e coloca no x10
    beq x10, x0, end    # caso terminar em 0 por causa da string, termina 

    sb x10, 1024(x0)    # escreve o valor do x10 no endereco do video
    addi x17, x17, 1    # soma mais um para ir para a proxima letra
    
	beq x0, x0, loop    # manda para o inicio do loop

end:                    # pra quando chegar a 0 acabar
    halt

str1: .string "Hello World"
