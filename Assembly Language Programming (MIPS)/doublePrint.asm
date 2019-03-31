.data
	d: .double 3.1212213566
	dzero: .double 0.0
.text
	li $v0, 3
	
	ldc1 $f2, d
	ldc1 $f0, dzero
	
	add.d $f12 ,$f2,$f0 
	
	syscall
	