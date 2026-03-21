lw   x9,  a              # carregar a em x9
lw   x10, b              # carregar b em x10
add  x11, x0, x0         # m = 0

blt  x10, x11, sum       # se (b < m), vai para sum

sub x11, x9, x10         # caso não faz m = a - b
beq  x0, x0, end         # pula o sum

sum:
    add x11, x9, x10     # m = a + b
end:
    sw   x11, m          # salvar m na memória
halt

a: .word 0x6
b: .word 0xf
m: .word 0x0  