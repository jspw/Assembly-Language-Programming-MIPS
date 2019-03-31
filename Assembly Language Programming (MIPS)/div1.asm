.data


.text
	
	addi $t0,$zero,100
	addi $t1,$zero,6
	
	div $a0,$t0,$t1
	
	li $v0,1
	syscall
	
