.data
	n: .word 23
	name: .asciiz "\nMehedi Hasan Shifat\n"
	age : .word 50

.text

	li $v0,1
	lw $a0,n
	syscall
	li $v0 ,4
	la $a0,name
	syscall
	li $v0,1
	lw $a0, age
	syscall
	

