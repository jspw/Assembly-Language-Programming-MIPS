.data
arra:	.word 2, 3, 5, 7, 11, 13, 17, 19, 23, 29
arrasz: 	.word 10
NL:	.asciiz "\n"
.text
	lw 	$t3, arrasz
	la 	$t1, arra # get array address
	li 	$t2, 0 # set loop counter
whillelp:
	beq 	$t2, $t3, whilledn # check for array end
	#lw 	$a0, ($t1) # print list element
	li 	$v0, 1
	move	$a0,$t2
	syscall
	la 	$a0, NL # print a newline
	li 	$v0, 4
	syscall
	addi 	$t2, $t2, 1 # advance loop counter
	addi 	$t1, $t1, 4 # advance array pointer
	b whillelp # repeat the loop
whilledn:	li 	$v0,10
	syscall
