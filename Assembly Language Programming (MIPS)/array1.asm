.data
	msg : .asciiz "This is a array printing function "
	ar: .space 1200

.text
	main:
		addi $s0,$zero,10
		addi $s1,$zero,1
		addi $s2,$zero,0
		
		addi $t0,$zero,0
		
		sw $s0,ar($t0)
			addi $t0,$t0,4
			
		sw $s1,ar($t0)
			addi $t0,$t0,4
		sw $s2,ar($t0)
		
	
	li $v0,10
	syscall


