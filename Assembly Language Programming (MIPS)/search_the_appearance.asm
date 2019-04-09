#simple program to search a char in a string if found teminate
.globl main
.data 
	char:	.byte 'i'
	vowels:	.asciiz "aeiioooiiuiiuu"
.text 
main:	
	lb	$t0,char
	li	$t1,0
	la	$s0,vowels
	lb	$s1,($s0)
	li	$t5,0	#no of appearance
srhlp:
	beq	$s1,$zero,srchdn
	seq	$t1,$s1,$t0
	add	$t5,$t1,$t5	#count++
	addi	$s0,$s0,1
	lb	$s1,($s0)
	b 	srhlp
srchdn:
	li	$v0, 1	
	move	$a0, $t5
		syscall
	li	$v0,10
	syscall
