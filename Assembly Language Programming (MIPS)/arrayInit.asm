.data
	array: .word 10,12,13,14,15
	space : .byte ' '
.text
	addi $t0,$zero,0
	
	while :
		 beq $t0,20,exit
		 
		 lw $t6,array($t0)
		 
		 addi $t0,$t0,4
		 
		 li $v0,1
		 move $a0,$t6
		 syscall
		 
		 li $v0,4
			la $a0,space
			syscall
		 
		 j while
	
	
	exit:
		li $v0,10
		syscall