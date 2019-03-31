.data
	name1: .asciiz "Name1 : "
		  # here 'name1' is the name of variable ,
		  #'.asciiz' declare variable type (string)
		  #'"Name1"' is value of variable 
		  
	name2: .asciiz "Name2 : "
	
.text
	li $v0, 4   # give instruction to ready for printig a string 
		#li -> load initiate $v0 , 4 is for string
	la $a0 ,name2  # load adress (la) is for string , 
	
	syscall
	la $a0,name1
	syscall

