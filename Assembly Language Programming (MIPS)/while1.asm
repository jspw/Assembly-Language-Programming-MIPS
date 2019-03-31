.data
	newLine: .asciiz " "

.text
	main:
		addi $t0,$zero,1
		
		while:
			bgt $t0,10,exit
			
			li $v0,1
			move $a0,$t0
			syscall
			
			li $v0,4
			la $a0,newLine
			syscall
			
			add $t0,$t0,1	
			
			j while
		
		exit:
		
		
		li $v0,10
		syscall

