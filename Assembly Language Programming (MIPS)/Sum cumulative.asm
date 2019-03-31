	
	# Declare main as a global function
	.globl	main
	
.data
list:   .space  1000
listsz: .word	250   
newline:   .asciiz	"\n"

       # using as array of integers
       .text
main:   lw	$s0, listsz    # $s0 = array dimension
	la	$s1, list      # $s1 = array address
	li	$t0, 0         # $t0 = # elems init'd
	li 	$t2 , 0
initlp: beq	$t0, $s0, initdn
	sw	$t0, ($s1)     # list[i] = addr of list[i]
	lw 	$t4, ($s1)
	addi	$s1, $s1, 4    # step to next array cell
	addi	$t0, $t0, 1    # count elem just init'd
	add     $t2, $t2, $t0
	li	$v0, 1		# Code for syscall: print_string
	move	$a0, $t2
	syscall
		
	li	$v0,4		# print_string syscall code = 4
	la	$a0, newline
	syscall
	b	initlp
initdn:	
	li	$v0, 10	
	syscall
