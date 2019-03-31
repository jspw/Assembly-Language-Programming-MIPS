.data
	
	 

.text
	addi $s0 , $zero,100000
	addi $s1,$zero,5000
	mul $t0,$s0,$s1
	li $v0,1
	add $a0,$zero,$t0
	syscall


