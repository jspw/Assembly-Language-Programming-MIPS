.data
	

.text
	addi $a1,$zero,100
	addi $a2,$zero,7
	
	div $a1,$a2
	
	mflo $a0
	li $v0,1
	syscall
	
	mfhi $a0
	li $v0,1
	syscall

