.data
	msg1: .asciiz "Enter a number : "
	msg2: .asciiz "\nEnter another number : "
	msg3: .asciiz "\nThe sum = "
	
.text
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 5
	syscall 
	move $t0,$v0
	
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0,5
	syscall
	move $t1,$v0
	
	li $v0,4
	la $a0,msg3
	syscall
	
	
	add $t2,$t0,$t1
	move $a0,$t2
	
	
	li $v0,1
#       add $a0,$t2,$zero
	
	syscall
	