.data
input:  .asciiz "Input 1st number: "
input1: .asciiz "Input 2nd number: "
input2: .asciiz "Input 3rd number: "
output: .asciiz "The sum is of the 3 Numbers: "
	.text
main:	
	li $v0, 4
	la $a0, input
	syscall
	
	li $v0, 5
	syscall
	move $t1, $v0
	
	li $v0, 4
	la $a0, input1
	syscall
	
	li $v0, 5
	syscall
	move $t2, $v0
	
	li $v0, 4
	la $a0, input2
	syscall
	
	li $v0, 5
	syscall
	move $t3, $v0
	
	add $t4, $t1, $t2
	add $t5, $t4, $t3
	
	li $v0, 4
	la $a0, output
	syscall
	
	li $v0, 1
	move $a0, $t5
	syscall
	
	li $v0, 10
	syscall
