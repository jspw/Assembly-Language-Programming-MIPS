.data
	

.text
	addi $t0,$zero,1020100
	addi $t1,$zero,20
	
	mult $t0,$t1
	
	mflo $s0
	
	li $v0,1
	add $a0,$s0,$zero
	syscall

