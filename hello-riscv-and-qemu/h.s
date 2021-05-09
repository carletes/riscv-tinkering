.section .init
.global _start
_start:
    li s1, 0x10000000 # s1 := 0x1000_0000
    li s2, 0x48       # s2 := 0x48
    sb s2, 0(s1)      # (s1) := s2
