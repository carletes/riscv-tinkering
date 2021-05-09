.section .init
.global _start
_start:
    li s1, 0x10000000
    la s2, message
    addi s3, s2, 14
1:
    lb s4, 0(s2)
    sb s4, 0(s1)
    addi s2, s2, 1
    blt s2, s3, 1b

.section .data
message:
  .string "Hello, world!\n"
