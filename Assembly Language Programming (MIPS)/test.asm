.data
	string: .asciiz "Hello AF!"
	char: .byte 'X'
	int: .word 12
	float: .float 3.1212
	double: .double 141.21
	zero: .double 0.0
	
	newLine: .asciiz "\n"
	msg: .asciiz "\nSum = "
	msg1: .asciiz "\nSub = "

.text
	main:
	#string
	li $v0,4
	la $a0,string
	syscall
	
	
	li $v0,4
	la $a0,newLine
	syscall

	#integer
	
	li $v0,1
	lw $a0,int
	syscall
	
	li $v0,4
	la $a0,newLine
	syscall
	
	#float
	
	li $v0,2
	lwc1 $f12,float
	syscall
	
	li $v0,4
	la $a0,newLine
	syscall
	
	#double
	
	ldc1 $f0,double
	ldc1 $f2,zero
	add.d $f12,$f0,$f2
	li $v0,3
	syscall
	
	li $v0,4
	la $a0,newLine
	syscall
	
	#sum1
	
	li $v0,5
	syscall
	move $a1,$v0
	li $v0,5
	syscall
	move $a2,$v0
	
	
	li $v0,4
	la $a0,msg
	syscall

	
	jal sum1
	move $a0,$v1
	li $v0,1
	syscall
	
	li $v0,4
	la $a0,newLine
	syscall
	
	#Threesome
	
	li $v0,5
	syscall
	move $a1,$v0
	
	li $v0,5
	syscall
	move $a2,$v0
	
	li $v0,5
	syscall
	move $a3,$v0
	
	
	jal threeSome
	move $a0,$v1
	li $v0,1
	syscall
	
	
	li $v0,4
	la $a0,newLine
	syscall
	
	#Subtraction
	li $v0,5
	syscall
	move $a1,$v0
	li $v0,5
	syscall
	move $a2,$v0
	
	
	li $v0,4
	la $a0,msg1
	syscall
	
	jal Sub
	move $a0,$v1
	li $v0,1
	syscall
	
	li $v0,4
	la $a0,newLine
	syscall
	
	#Multiplication 
	#1
	
	
	li $v0,5
	syscall
	move $a1,$v0
	
	li $v0,5
	syscall
	move $a2,$v0
	
	
	jal multip1
	move $a0,$v1
	li $v0,1
	syscall
	
	li $v0,4
	la $a0,newLine
	syscall
	
	#2
	li $v0,5
	syscall
	move $a1,$v0
	
	li $v0,5
	syscall
	move $a2,$v0
	
	
	jal multip2
	mflo $s0
	move $a0,$s0
	li $v0,1
	syscall
	
	li $v0,4
	la $a0,newLine
	syscall
	
	#3
	
	li $v0,5
	syscall
	move $a1,$v0
	
	jal multip3
	move $a0,$v1
	li $v0,1
	syscall
	
	li $v0,4
	la $a0,newLine
	syscall
	
	
	#division 
	#1
	li $v0,5
	syscall
	move $a1,$v0
	
	li $v0,5
	syscall
	move $a2,$v0
	
	jal divi1
	move $a0,$v1
	li $v0,1
	syscall
	
	li $v0,4
	la $a0,newLine
	syscall
	
	#2
	li $v0,5
	syscall
	move $a1,$v0
	
	li $v0,5
	syscall
	move $a2,$v0
	
	jal divi2
	mflo $a0
	li $v0,1
	syscall
	
	li $v0,4
	la $a0,newLine
	syscall
	
	mfhi $a0
	li $v0,1
	syscall
	
	li $v0,4
	la $a0,newLine
	syscall

	
	#End 
	
	li $v0,10
	syscall
	
	
	
	sum1:
		add $v1,$a1,$a2
		jr $ra
		
	threeSome:
		add $t0,$a2,$a1
		add $v1,$t0,$a3
		jr $ra
		
	Sub: 
		sub $v1,$a1,$a2
		jr $ra
		
	multip1: 
		mul $v1,$a1,$a2
		jr $ra
		
	multip2: 
		mult $a1,$a2
		jr $ra
		
	multip3: 
		sll $v1,$a1,4
		jr $ra
		
	divi1:
		div $v1,$a1,$a2
		jr $ra
		
	divi2:
		div $a1,$a2
		jr $ra
