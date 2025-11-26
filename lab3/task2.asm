.data
prompt:    .asciiz "Enter a number to compute factorial (iterative): "
resultMsg: .asciiz "Factorial = "
newline:   .asciiz "\n"

.text
.globl main


factorial_iter:
    li $v0, 1           

fact_loop:
    blez $a0, fact_end  
    mul  $v0, $v0, $a0  
    addi $a0, $a0, -1   
    j fact_loop

fact_end:
    jr $ra


main:
    # Enter The Num
    li  $v0, 4
    la  $a0, prompt
    syscall

    # Read number
    li  $v0, 5
    syscall
    move $a0, $v0

    # Compute factorial
    jal factorial_iter
    move $t0, $v0       

    # Print label
    li  $v0, 4
    la  $a0, resultMsg
    syscall

    # Print result
    move $a0, $t0       
    li   $v0, 1
    syscall


    li  $v0, 4
    la  $a0, newline
    syscall

    li $v0, 10
    syscall
