.data
prompt: .asciiz "Enter an integer: "
resultMsg: .asciiz "The average of the four numbers is: "

.text
.globl main

main:
    li $t0, 0         
    li $t1, 0          

loop:
    li $v0, 4         
    la $a0, prompt
    syscall

    li $v0, 5        
    syscall
    add $t0, $t0, $v0 

    addi $t1, $t1, 1  

    blt $t1, 4, loop   

    li $t2, 4
    div $t0, $t2
    mflo $t3          

    li $v0, 4
    la $a0, resultMsg
    syscall

    li $v0, 1
    move $a0, $t3
    syscall

    li $v0, 10
    syscall
