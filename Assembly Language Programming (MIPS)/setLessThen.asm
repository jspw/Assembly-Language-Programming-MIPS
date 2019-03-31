.data
	msg: .asciiz "This is less than  that \n"

.text
	main:
	addi $a1,$zero,12
	addi $a2,$zero,10
	
	slt $s0,$a1,$a2
	beq $zero,$s0 ok
	
	li $v0,10
	syscall
	
	
	ok:
		li $v0,4
		la $a0,msg
		syscall

