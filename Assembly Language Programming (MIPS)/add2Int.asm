.data
	a: .word 5
	b: .word 6
	str: .asciiz "The sum = "

.text
	lw $t0, a ($zero)
	lw $t1, b ($zero)
	
	add $t2 ,$t0,$t1
	
	li $v0,4
	la $a0,str
	syscall
	
	li $v0, 1
	add $a0,$zero,$t2
	
	syscall

