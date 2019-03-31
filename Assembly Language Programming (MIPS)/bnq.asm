.data
	str: .asciiz "This is not equal"
.text
	li $v0,5
	syscall
	move $a1,$v0
	li $v0,5
	syscall
	move $a2,$v0
	
	bne $a1,$a2, NOT
	
	li $v0,10
	syscall
	
	NOT:
		li $v0,4
		la $a0,str
		syscall
