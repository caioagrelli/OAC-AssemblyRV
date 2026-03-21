lw   x9,  a
lw   x10, b
add  x11, x9, x0
beq  x10, x11, fim1
add x11, x9, x10
fim1:
sw  x11, m       
 halt

a: .word 0x6 
b: .word 0xf
m: .word 0x0
