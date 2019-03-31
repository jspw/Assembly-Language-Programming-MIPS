.data
	a: .word 120
	b: .word  20

.text
	lw $s0 , a
	lw $s1 , b
	sub $s2,$s0,$s1
	
	
	li $v0,1
	move $a0,$s2
	syscall

