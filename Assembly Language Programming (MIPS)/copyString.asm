.data  
   string1:    .asciiz "Hello "  
   string2:    .asciiz "World!"  
   finalStr:   .space 256       # A 256 bytes buffer  
   
   .text  
 main:  
   la $s1, finalStr  
   la $s2, string1  
   la $s3, string2
   
  copyFirstString:  
   lb $t0, ($s2)                  # get character at address  
   beqz $t0, copySecondString
   sb $t0, ($s1)                  # else store current character in the buffer  
   addi $s2, $s2, 1               # string1 pointer points a position forward  
   addi $s1, $s1, 1               # same for finalStr pointer  
   j copyFirstString              # loop  
   
   
 