.data
ara:	.word	7,8,9,14,16,19,28,33,41,46,50,58,60,70
arasz:	.word	13
NL:	.asciiz "\n"
fnd:	.asciiz "found"
nfnd:	.asciiz "not found"
.text
	la	$s0,ara
	li	$t0,0	#b=0 	t0
	li	$t3,9	#end=9	t1
	la	$s1,($s0)
lp:	bltu 	$t3,$t0,lpend	
	add	$t4,$t3,$t0	#begin+end
	divu	$t2,$t4,2	#mid	t2	
	mulo	$t5,$t2,4
	add	$t6,$t5,0
	add	$s0,$s1,$t6	#arr[mid]
	lw	$t8,($s0)
	li	$v0,1
	move	$a0,$t8
	syscall
	li	$v0,4
	la	$a0,NL
	syscall
	beq	$t8,67,found
	bltu	$t8,67,less
	subi	$t3,$t2,1
	b 	lp
less:	addi	$t0,$t2,1
	b	lp
found:	li	$v0,4
	la	$a0,fnd
	syscall
	li	$v0,10
	syscall
lpend:	li	$v0,4
	la	$a0,nfnd
	syscall
	li	$v0,10
	syscall 