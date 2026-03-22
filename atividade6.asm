addi x11, x0, 0   
addi x12, x0, 5   

loop:
    lb x10, 1026(x0)
    andi x10, x10, 0x1
    beq x10, x0, off

on:
    addi x11, x11, 1     
    lb x10, 64(x0)
    sll x10, x10, x11 
    sb x10, 1029(x0) 
    beq x11, x12, parar 
    jal x0, loop

off:
    lb x10, 64(x0)      
    sll x10, x10, x11  
    sb x10, 1029(x0)   
    jal x0, loop

parar:
    halt

HIGH: .byte 1
LOW:  .byte 0


codigo certo
