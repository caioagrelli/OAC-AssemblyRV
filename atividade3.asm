lw  x20, g
lw  x21, h
lw  x22, i
lw  x23, j

beq x22, x23, equal     # caso forem iguais joga pra equal
sub x19, x20, x21       # caso forem diferentes faz a sub
beq x0,  x0,  exit      # pula o equal

equal:	
    add x19, x20, x21   # soma (f = g + h)

exit:
    sw  x19, f          # atribui o resultado de f
halt

g: .word 0x5   
h: .word 0x3
i: .word 0x2
j: .word 0x2
f: .word 0x0
