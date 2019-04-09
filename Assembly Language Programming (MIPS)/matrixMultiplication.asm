.data
space: .asciiz " "
newline: .asciiz "\n"
prompt_row: .asciiz "\nInput row #: "
result_row: .asciiz "\nRow #: "
matrix_A: .word
.space 500
matrix_B: .word
.space 500
matrix_C: .word
.space 5000
.text


main:
   # t9 holds the col/row size for all of the matrices
   li $t9, 2 # matriz size
   # setup matrix_A	
   la  $a0, matrix_A           # load address of array_A
   jal matrix_input            # build matrix A
   # setup matrix_B
   la  $a0, matrix_B           # load address of array_B
   jal matrix_input            # build matrix B
   
   # matrix multiplication
   la  $a2, matrix_A           # load address of matrix_A
   la  $a1, matrix_B           # load address of matrix_B
   la  $a0, matrix_C           # load address of matrix_C
   jal matrix_multiply         # multiply matrix_A * matrix_B = matrix_C
   
   # print resultant matrix
   la  $a0, matrix_C           # load address of result matrix
   jal matrix_output           # print matrix C
   
   # terminate program
   li $v0, 10                  # load service number for exit
   syscall                     # exit
matrix_input:
   li   $t0, 0                 # loop for matrix_build
   la   $s0, prompt_row        # load address for prompt_row
   move $s1, $a0               # point $s0 to array
matrix_build:

   beq $t0, $t9, matrix_done               # finished building matrix
   addi $t0, $t0, 1            # increment loop counter
   addi $t1, $t0, 48           # convert int to char for row number
   sb $t1, 11($s0)             # replace '#' with current row number in prompt
   la $a0, prompt_row          # load address for prompt_row
   li $v0, 4                   # load service number for print
   syscall                     # print string

   li $t2,0
   
   
matrix_build_inner_loop:
   li $v0, 12                  # load service number for read char
   syscall                     # read char
   
   subi $v0, $v0, 48           # convert char to int
   sw $v0, 0($s1)              # store in current row index 0
   
   la $a0, space               # load service number for space
   li $v0, 4                   # load service number for print str
   syscall                     # print space
   
   addi $s1, $s1, 4  
   addi $t2, $t2, 1 

   beq $t2, $t9, matrix_build    # loop if row is not done
   j matrix_build_inner_loop


matrix_output:
   li   $t0, 0                 # loop for matrix_build
   la   $s0, result_row        # load address for prompt_row
   move $s1, $a0               # point $s0 to array
matrix_print:
    beq $t0, $t9, matrix_done               # finished building matrix
   
   addi $t0, $t0, 1            # increment loop counter
   addi $t1, $t0, 48           # convert int to char for row number
   sb $t1, 5($s0)              # replace '#' with current row number in prompt
   
   la $a0, result_row          # load address for result_row
   li $v0, 4                   # load service number for print str
   syscall                     # print result_row

   li $t2, 0
matrix_print_inner_loop:
   lw $a0, 0($s1)              # load integer in current row's index 0
   li $v0, 1                   # load service number for print int
   syscall                     # print loaded int
   
   la $a0, space               # load service number for space
   li $v0, 4                   # load service number for print str
   syscall                     # print space
   
   addi $s1, $s1, 4
   addi $t2, $t2, 1

   beq $t2, $t9, matrix_print    # loop if row is not done
   j matrix_print_inner_loop


matrix_done:
   la $a0, newline             # load address of newline
   li $v0, 4                   # load service number for print
   syscall                     # print newline
   
   jr $ra                      # return to caller








matrix_multiply:
 
      li $t2, 0
      li $t0, 0
      li $t3, 2

      add $t1, $zero $t9  # $t1 = 32 (row size/loop end)
      li $s0, 0   # i = 0; initialize 1st for loop
L1:   li $s1, 0   # j = 0; restart 2nd for loop
L2:   li $s2, 0   # k = 0; restart 3rd for loop


      mul $t2, $s0, $t1 # $t2 = i * 2^5 (size of row of c)

      add  $t2, $t2, $s1   # $t2 = i * size(row) + j
      sll  $t2, $t2, 3      # $t2 = byte offset of [i][j]


      
      div $t2, $t2, $t3


      add $t2, $a0, $t2    # $t2 = byte address of c[i][j]
      lw   $s4, 0($t2)      # $f4 = 8 bytes of c[i][j]


L3:   mul $t0, $s2, $t1     #$t0=k*25 (sizeofrowofb) 
      add $t0, $t0, $s1  # $t0 = k * size(row) + j
      sll $t0, $t0, 3     # $t0 = byte offset of [k][j] 


      div $t0, $t0, $t3

      add $t0, $a2, $t0  # $t0 = byte address of b[k][j] 
      lw $s6, 0($t0)    # $f16 = 8 bytes of b[k][j]




      mul  $t0, $s0, $t1 #$t0=i*25 (sizeofrowofa) 
      add $t0, $t0, $s2 # $t0 = i * size(row) + k
      sll  $t0, $t0, 3 # $t0 = byte offset of [i][k] 

      div $t0, $t0, $t3
      add $t0, $a1, $t0 # $t0 = byte address of a[i][k] 
      lw   $s7, 0($t0) # $f18 = 8 bytes of a[i][k]

      mul  $s6, $s7, $s6 # $f16 = a[i][k] * b[k][j] 
      add  $s4, $s4, $s6 # f4 = c[i][j] + a[i][k] * b[k][j]



      addi  $s2, $s2, 1   # $k = k + 1
      bne    $s2, $t1, L3  # if (k != 32) go to L3
      sw    $s4, 0($t2)   # c[i][j] = $f4



      addi  $s1, $s1, 1   # $j = j + 1
      bne    $s1, $t1, L2  # if (j != 32) go to L2
      addi  $s0, $s0, 1   # $i = i + 1
      bne    $s0, $t1, L1  # if (i != 32) go to L1

   j matrix_done               # finished matrix_C