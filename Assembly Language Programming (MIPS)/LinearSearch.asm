.globl main
.data 
array:	.word 16,13,14,15,16,1,3,13,13,16,16,16
size:	.word 12
found:	.asciiz	"found"
notFound:.asciiz "notFound"
.text 
main:	la	$s0,array
	lw	$t1,size
	li	$t2,16
	li	$t3,0
itnitlp:beq	$t3,$t1,initdn
	lw	$t0,($s0)
	beq	$t2,$t0,Found	
	addi	$t3,$t3,1
	mul 	$t5,$t3,4	#i++
	addi	$s0,$t5,0	#arr[i++]
	b	itnitlp
initdn:	li	$v0,4
	la	$a0,notFound
	syscall 
	li	$v0,10
	syscall 	
Found:	li	$v0,4
	la	$a0,found
	syscall
	li	$v0,10
	syscall	
