.data
	msg: .asciiz "\nFUCK You\n"
.text

	main:
		addi $t0,$zero,0
		
		while:
			bgt $t0,10,exit
			
			addi $t0,$t0,1
			move $a0,$t0
			li $v0,1
			syscall
			
			jal print
			

			j while
		
		
		exit:
		
		
		
	li $v0,10
	syscall
		
		
		print:
			li $v0,4
			la $a0,msg
			syscall
			
			jr $ra
			
			