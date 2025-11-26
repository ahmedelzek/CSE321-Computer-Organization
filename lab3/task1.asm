.data
firstNumPormpt:   .asciiz "Enter first number: "
secondNumPrompt:   .asciiz "Enter second number: "
resultMsg: .asciiz "The sum is: "
newline:   .asciiz "\n"

.text
.globl main

add_two_numbers:
    add $v0, $a0, $a1
    jr  $ra

main:

    # Enter The First Num
    li  $v0, 4
    la  $a0, firstNumPormpt
    syscall

    li  $v0, 5
    syscall
    move $t0, $v0

    # Enter The Second NUM
    li  $v0, 4
    la  $a0, secondNumPrompt
    syscall

    li  $v0, 5
    syscall
    move $t1, $v0

    # Call Function
    move $a0, $t0
    move $a1, $t1
    jal add_two_numbers      

    move $t2, $v0           

    # Print message
    li  $v0, 4
    la  $a0, resultMsg
    syscall

    # Print result
    move $a0, $t2            
    li  $v0, 1
    syscall

    li  $v0, 4
    la  $a0, newline
    syscall

    li  $v0, 10
    syscall
