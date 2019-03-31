.data
	x: .asciiz "Fuck OFF\n"
	y: .asciiz "Yah"

.text
	li $v0,4
	la $a0,x
	
	syscall
	la $a0,x
	syscall
	
	
