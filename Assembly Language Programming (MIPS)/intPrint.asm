.data 
	n : .word 

.text
	li $v0, 1
	la $a0,n 
	syscall

