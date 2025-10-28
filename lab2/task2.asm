.data
prompt: .asciiz "Enter number of integers : "
promptNum: .asciiz "Enter an integer: "
resultMsg: .asciiz "The average of entered numbers is: "

.text
.globl main

main:
    li $v0, 4
    la $a0, prompt
    syscall

    li $v0, 5       
    syscall
    move $t0, $v0    

    li $t1, 0        
    li $t2, 0        

loop:
    beq $t2, $t0, done   

    li $v0, 4
    la $a0, promptNum
    syscall

    li $v0, 5
    syscall
    add $t1, $t1, $v0    

    addi $t2, $t2, 1     

    j loop

done:
    div $t1, $t0
    mflo $t3             

    li $v0, 4
    la $a0, resultMsg
    syscall

    li $v0, 1
    move $a0, $t3
    syscall

    li $v0, 10
    syscall
