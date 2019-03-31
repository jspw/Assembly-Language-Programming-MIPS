.data
	d: .double 12.033
	dz: .double 0.0

.text
	li $v0 , 3
	ldc1 $f2, d
	ldc1 $f0, dz
	
	add.d $f12,$f2,$f0
	syscall


