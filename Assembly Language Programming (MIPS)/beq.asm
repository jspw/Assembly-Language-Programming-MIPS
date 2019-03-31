.data
	msg: .asciiz "This is equal\n"
	msg2: .asciiz "This number is not equal\n"
	msg3: .asciiz "This is bal"
	x: .word 12
	y: .word 12
.text
	main:
	lw $a1,x
	lw $a2,y
	
	beq $a1,$a2, fuck
	
	
	li $v0,10
	syscall
	
	fuck:
		li $v0,4
		la $a0,msg
		syscall

	