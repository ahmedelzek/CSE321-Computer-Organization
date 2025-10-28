.data
prompt: .asciiz "Enter a number (1-3): "
msg1: .asciiz "You selected case 1.\n"
msg2: .asciiz "You selected case 2.\n"
msg3: .asciiz "You selected case 3.\n"
msgDefault: .asciiz "Invalid choice.\n"

.text
.globl main

main:
    li $v0, 4
    la $a0, prompt
    syscall

    li $v0, 5
    syscall
    move $t0, $v0  

    beq $t0, 1, case1
    beq $t0, 2, case2
    beq $t0, 3, case3
    j default_case

case1:
    li $v0, 4
    la $a0, msg1
    syscall
    j exit

case2:
    li $v0, 4
    la $a0, msg2
    syscall
    j exit

case3:
    li $v0, 4
    la $a0, msg3
    syscall
    j exit

default_case:
    li $v0, 4
    la $a0, msgDefault
    syscall

exit:
    li $v0, 10
    syscall
