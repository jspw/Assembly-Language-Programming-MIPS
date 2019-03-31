.data
	msg: .asciiz "Enter your name : "
	newLine: .asciiz "\n"
	name : .space 200

.text
	main:
		li $v0,4
		la $a0,msg
		syscall
		
		li $v0,8 #take input as text
		la $a0,name
		li $a1,200
		syscall
		
		li $v0,4
		la $a0,newLine
		syscall
		
		li $v0,4
		la $a0,name
		syscall
		
		
	
	#stop programme !
	li $v0,10
	syscall
		
