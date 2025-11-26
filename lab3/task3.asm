.data
prompt:    .asciiz "Enter a number to compute factorial: "
resultMsg: .asciiz "Factorial = "
newline:   .asciiz "\n"

.text
.globl main


factorial_rec:
    addi $sp, $sp, -8       
    sw   $ra, 4($sp)        
    sw   $a0, 0($sp)      

    ble  $a0, 1, base_case  

    addi $a0, $a0, -1
    jal factorial_rec       

    lw   $a0, 0($sp)        
    mul  $v0, $v0, $a0     
    j end_rec

base_case:
    li $v0, 1            

end_rec:
    lw  $ra, 4($sp)         
    addi $sp, $sp, 8        
    jr $ra


main:

    li  $v0, 4
    la  $a0, prompt
    syscall

 
    li  $v0, 5
    syscall
    move $a0, $v0

   
    jal factorial_rec
    move $t0, $v0           

  
    li  $v0, 4
    la  $a0, resultMsg
    syscall


    move $a0, $t0
    li   $v0, 1
    syscall


    li  $v0, 4
    la  $a0, newline
    syscall

    li $v0, 10
    syscall
