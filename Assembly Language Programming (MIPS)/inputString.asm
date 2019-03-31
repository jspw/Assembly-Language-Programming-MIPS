.data
	msg: .asciiz "Enter your name bitch !\n"
	name : .space 100
.text
	li $v0,4
	la $a0,msg
	syscall
	
	li $v0, 8
	la $a0,name
	la $a1,100
	syscall
	
	li $v0,4
	la $a0,name
	syscall
	

