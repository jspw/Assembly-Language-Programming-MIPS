.data
	

.text
	main:
		addi $a1,$zero ,100
		addi $a2,$zero,500
		
		
		jal adds
		
		add $a0,$v1
		li $v0 , 1
		syscall
		
	
	li $v0, 10
	syscall
	
	
	
	adds:
		add $v1 , $a1,$a2
		jr $ra


