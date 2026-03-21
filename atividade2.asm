lw   x9,  a
lw   x10, b
lw  x11, m

beq x10, x11, bloco_soma
sub x11, x9, x10
beq x0,  x0, salvar

bloco_soma:
add x11, x9, x10

salvar:
sw  x11, m       
 halt

a: .word 0x6  
b: .word 0xf
m: .word 0x0
