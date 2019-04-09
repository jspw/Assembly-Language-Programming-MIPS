#No of appearance of a no in a integer array
.globl main
.data 
array:	.word 16,13,14,15,16,1,3,13,13,16,16,16
size:	.word 12
.text 
main:	la	$s0,array
	lw	$t1,size
	li	$t2,16
	li	$t3,0	#i=0
	li	$t4,0	#ap=0
itnitlp:beq	$t3,$t1,initdn
	lw	$t0,($s0)	#arr[0]
	bne	$t2,$t0 ,inc	
	addi 	$t4,$t4,1	#ap++
inc:	addi	$t3,$t3,1	#i++
	addi	$s0,$s0,4	#arr[i++]
	j	itnitlp
initdn:	li	$v0,1
	move	$a0,$t4
	syscall 
	li	$v0,10
	syscall 	
