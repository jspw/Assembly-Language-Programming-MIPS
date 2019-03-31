  .data
  	ary: .space 100
  
  .text
  	addi $s0,$zero,4
  	addi $s1,$zero,10
  	addi $s2,$zero,3
  	
  	
  	addi $t0,$zero,0
  	
  	sw $s0,ary($t0)
  		addi $t0,$t0,4
  	sw $s1,ary($t0)
  		addi $t0,$t0,4
  	sw $s2,ary($t0)
  
  
