.data
    myarray:.space 40    
    st:.asciiz "Enter the 10 Elements"

.text    
    li $v0,4
    la $a0,st
    syscall
    jal fun
    li $v0,10
    syscall

fun:        
    li $v0,5
    syscall
    beq $t0,40,exit
    sw $v0,myarray($t0)
    add $t0,$t0,4
    j fun

exit:
    jr $ra