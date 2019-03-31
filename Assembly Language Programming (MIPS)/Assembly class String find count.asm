.data
      char:     .byte 'u'
      vowels:   .asciiz "aeuiouu"
      output1:  .asciiz "Found "
      output2:  .asciiz " times"
.text
main: 
      lb $t0, char
      li $t1,0
      la $s0, vowels
      li $s2 ,0
      lb $s1, ($s0)
searchloop:
      beq $s1, $zero, searchdone
      seq $t1, $s1, $t0
      bgt $t1, $zero, increment
      addi $s0, $s0, 1
     
      lb $s1, ($s0)
      b searchloop
      
increment:
    addi $s2,$s2,1
   addi $s0, $s0, 1
   lb $s1, ($s0)
     b searchloop
   
      
 searchdone:
      li $v0,4 
      la $a0,output1
      syscall
      li $v0,1
      move $a0,$s2
      syscall
      li $v0,4 
      la $a0,output2
      syscall
      
