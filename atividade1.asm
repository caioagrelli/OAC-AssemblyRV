lw   x9,  a             # guardar a em x9
lw   x10, b             # guardar b em x10
add  x11, x9, x0        # x11 == x9 (m == a)

blt  x10, x11, sum      # verificar se (b < m) pula pra sum
beq  x0, x0, end        # caso n for pula pra end

sum:
    add x11, x9, x10    # fazer (a + b) = m
    sw x11, m           # salvar registrador em m
end:
    sw x11, m           # salvar (m = a)

halt

a: .word 0x6 
b: .word 0xf
m: .word 0x0
