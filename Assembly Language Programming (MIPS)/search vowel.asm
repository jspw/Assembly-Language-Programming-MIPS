.data
	char:     .byte 'u'
	vowels:   .asciiz  "aeuiou"
.text
main:
	lb	$t0, char     # load character to look for
	li 	$t1, 0        # it's not found yet
	la	$s0, vowels   # set pointer to vowels[0]
	lb	$s1, ($s0)    # get vowels[0]
srchlp:   
	beq	$s1, $zero, srchdn   # check for terminator
	seq	$t1, $s1, $t0        # compare characters
	bgt	$t1, $zero, srchdn   # check if found
	addi	$s0, $s0, 1          # no, step to next vowel
	li	$v0, 11		# Code for syscall: print_string
	move	$a0, $s1
	syscall
	lb	$s1, ($s0)           # load next vowel
	b	srchlp
srchdn:	
	li	$v0, 10
	syscall
