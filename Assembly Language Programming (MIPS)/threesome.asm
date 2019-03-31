	.data
msg1:	.asciiz	"Enter A:   "
msg2:	.asciiz	"Enter B:   "
msg3:	.asciiz	"Enter C:   "
msg4:	.asciiz	"A + B + C = "
newline:   .asciiz	"\n"


	.text
	.globl	main
main:

	li	$v0,5	
	syscall	
	move	$t0,$v0		
	
	li	$v0,5	
	syscall	
	move	$t1,$v0	

	add	$t0, $t0, $t1	
	
	li	$v0,5		
	syscall	
	move	$t1,$v0		
	add	$t0, $t0, $t1	
	
	li	$v0,1		
	move	$a0, $t0	
	syscall
	
	li	$v0,10		
	syscall

