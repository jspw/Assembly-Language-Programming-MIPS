#simle program to search a char in a string if found teminate
.globl main
.data 
	char:	.byte 'i'
	vowels:	.asciiz "aeiou"
.text 
main:	
	lb	$t0,char
	li	$t1,0
	la	$s0,vowels
	lb	$s1,($s0)
srchlp:
	beq	$s1,$zero,srchdn
	seq	$t1,$s1,$t0
	bgt	$t1,$zero,srchdn
	addi	$s0,$s0,1
	li 	$v0,11
	move	$a0,$s1
	syscall
	lb	$s1,($s0)
	b 	srchlp
srchdn:
	li	$v0,10
	syscall