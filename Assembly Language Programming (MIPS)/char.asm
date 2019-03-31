.data
	char: .byte 'S'

.text
	li $v0,4
	la $a0,char
	syscall

