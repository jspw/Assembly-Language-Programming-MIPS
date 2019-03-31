
.data
	x: .word 12
	y: .word 13

.text
	
	lw $t0, x($zero)
	lw $t1, y($zero)
	
	
	add $t2,$t0,$t1
	
	li $v0, 1
	add $a0,$zero,$t2
	syscall

	

