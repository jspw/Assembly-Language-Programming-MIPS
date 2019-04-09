.data
	space: .byte ' '

.text
	main:
		addi $a1,$zero,5
		addi $a2,$zero,7
		
		
		b bal
		
		
		
		
	li $v0,10
	syscall
	
		bal: 
			add $t0,$a1,$a2
			move $a0,$t0
			li $v0, 1
			
			syscall
			
			li $v0,4
			la $a0,space
			syscall
			
			li $v0,10
			syscall
			
		mal:
			
			sub $t0,$a1,$a2
			move $a0,$t0
			li $v0, 1
			
			syscall