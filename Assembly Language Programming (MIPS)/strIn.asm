.data
	msg: .asciiz "Enter your name : "
	newLine: .asciiz "\n"
	name: .space 100
.text
	main:
		li $v0,4
		la $a0,msg
		syscall
		
		li $v0,8
		la $a0,name
		la $a1,100
		syscall
		
		li $v0,4
		la $a0,name
		syscall
		
	
	
	li $v0,10
	syscall
	
	
	