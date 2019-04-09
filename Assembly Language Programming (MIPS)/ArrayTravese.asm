.data
arra:	.word 2, 3, 5, 7, 11, 13, 17, 19, 23, 29
arrasz: 	.word 10
NL:	.asciiz "\n"
.text
	lw 	$t3, arrasz
	la 	$t1, arra # get array address
	li 	$t2, 0 # set loop counter
	la	$t0,($t1)
prnlp:
	beq 	$t2, $t3, prndn # check for array end
	lw 	$a0, ($t1) # print list element
	li 	$v0, 1
	#syscall
	la 	$a0, NL # print a newline
	li 	$v0, 4
	syscall
	addi 	$t2, $t2, 1 # advance loop counter
	mulou 	$t5,$t2,4
	move	$a0, $t5 	# print a newline
	li 	$v0, 1
	#syscall		#i++
	add	$t1,$t0,$t5 
	move	$a0, $t1	# print a newline
	li 	$v0, 1
	syscall	# advance array pointer
	b prnlp # repeat the loop
prndn:	li 	$v0,10
	syscall
