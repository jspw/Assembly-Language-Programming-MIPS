.data
	array: .space 100

.text
	main:
		addi $s0,$zero,1
		addi $s1,$zero,2
		addi $s2,$zero,3
		
		#index
		addi $t0,$zero,0
		
		sw $s0,array($t0)
			addi $t0,$t0,4
		sw $s1,array($t0)
			addi $t0,$t0,4
		sw $s2,array($t0)
		
		
		li $v0,10
		syscall