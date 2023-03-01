.data 0x10000000
    .asciiz "> " #3
    .asciiz "! = " #5
.text
    factorial:
        addi $sp, $sp, -8
        sw $a0, 0($sp)
        sw $ra, 4($sp)

        slti $t0, $a0, 3 #t0 = a0 < 3
        bne $t0, $zero, RETURN_N #return n if t0 != 0
        add $t0, $zero, $t0 #nop
        
        jal factorial
        addi $a0, $a0, -1 #store factorial n-1 in v0

        lw $a0, 0($sp)

        # return n * factorial (n-1)
        mult $a0, $v0
        j RETURN
        mflo $v0

        RETURN_N: add $v0, $zero, $a0

        RETURN:

        lw $ra, 4($sp)

        jr $ra
        addi $sp, $sp, 8

    main:
        # 0x10000000 = 0x1000 0000 = 4096 0
        lui $s0, 4096

        addi $v0, $zero, 4
        add $a0, $zero, $s0
        syscall

        addi $v0, $zero, 5
        syscall
        add $s1, $zero, $v0

        addi $v0, $zero, 1
        add $a0, $zero, $s1
        syscall

        addi $v0, $v0, 3 # $v0 = 4
        addi $a0, $s0, 3
        syscall


        jal factorial
        add $a0, $zero, $s1

        add $a0, $zero, $v0
        addi, $v0, $zero, 1
        syscall

        addi $v0, $zero, 10
        syscall