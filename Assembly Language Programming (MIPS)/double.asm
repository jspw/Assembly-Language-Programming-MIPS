.data
	d : .double 32.12102
	z: .double 0.0	
	

.text
	ldc1 $f2,d
	ldc1 $f0,z
	
	li $v0,3
	add.d $f12,$f2,$f0
	syscall
	