# 0xff
.data 0x10000000
    .asciiz "ABCDEF"

.text
    main:
        lui $s0, 4096

        lw $t0, 0($s0)
        andi $t1, $t0, 0xff
        srl $t0, $t0, 8
        andi $t2, $t0, 0xff

        jr $ra
        nop