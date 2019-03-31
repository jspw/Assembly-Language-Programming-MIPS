.data

	eq: .asciiz "This is equal\n"
	neq: .asciiz "This is not equal\n"
	Do: .asciiz "BAL\n"
	
.text
	main:
	li $v0,5
	syscall
	move $a1,$v0
	
	
	li $v0,5
	syscall
	move $a2,$v0
	
	b bal
	
	beq $a1,$a2, EQ
	
	bne $a1,$a2,nEq
	
	
	li $v0,10
	syscall
	
	bal:
		li $v0,4
		la $a0,Do
		syscall
		
		li $v0,10
		syscall
		
	EQ: 
		li $v0,4
		la $a0,eq
		syscall
		
		li $v0,10
		syscall
		
	nEq:
		li $v0,4
		la $a0,neq
		syscall
	
		li $v0,10
		syscall
