.globl main
.data
arrasz:		.word	6
arra:		.word 	25,60,70,8,34,80
newline:	.asciiz "\n"
.text 
main:	la	$s0,arra
	lw	$t3,arrasz
	li	$t0,0
	lw	$t6,($s0)	#Max=arr[0]
initlp:	beq	$t1,$t3,initdn
	lw	$t4,($s0)		
	addi 	$s0,$s0,4
	addi	$t1,$t1,1
	bgt	$t6,$t4,lvl	#if(Max>arr[i]
	addi	$t6,$t4,0	#max=arr[i]
lvl:	addi	$t6,$t6,0	#max=max
	
	b 	initlp 
initdn:	move	$a0,$t6
	li	$v0,1
	syscall
	li 	$v0,10
	syscall
