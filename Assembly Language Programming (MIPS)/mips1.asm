.data
	
	newLine: .asciiz "\n"
	

.text
	lw $t0,x
	lw $t1,y
	
	
	mult $t0,$t1
	
	mflo $a0
	
	li $v0,1
	syscall
	
	li $v0,4
	la $a0,newLine
	syscall
	
	
	