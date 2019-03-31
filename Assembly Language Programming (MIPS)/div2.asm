.data
	newLine: .asciiz "\n"


.text
	addi $t0,$zero,20
	addi $t1,$zero,3
	
	div $t0,$t1
	
	mflo $s0
	mfhi $s1
	
	li $v0, 1
	move $a0,$s0
	syscall
	
	li $v0,4
	la $a0,newLine
	syscall
	
	li $v0, 1
	move $a0,$s1
	syscall
