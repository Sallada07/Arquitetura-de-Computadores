.data
N:  .word 40  # 10 words = 320 bits = 40 bytes
VA: .word  0,   1,   2,   3,   4,   5,   6,   7,   8,   9
VB: .word  0, 100, 200, 300, 400, 500, 600, 700, 800, 900
VC: .word -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1

str1: .string "VC["
str2: .string "] = "
str3: .string "\n"

.text
main:
  la s0, VA  # s0 = VA
  la s1, VB  # s1 = VB
  la s2, VC  # s2 = VC
  li t1, 0   # i = 0
  lw t2, N   # i < N

for:
  li  s9, 0       # sum = 0
  bge t1, t2, endfor
  
  add t3, t1, s0  # &VA + i
  lw  s8, 0(t3)   # s8 = VA[i]
  add s9, s9, s8  # sum += VA[i]
  
  add t3, t1, s1  # &VB + i
  lw  s8, 0(t3)   # s8 = VB[i]
  add s9, s9, s8  # sum += VB[i]
  
  add t3, t1, s2  # &VC + i
  sw  s9, 0(t3)   # VC[i] = sum
  jal printVC     # printf("VC[%d] = %d \n", i, VC[i]);
next:
  addi t1, t1, 4  # i++
  j    for
endfor:

# Exit
  li a7, 10
  ecall

printVC:
  la a0, str1
  li a7, 4
  ecall
  
  srli a0, t1, 2  # print index
  li a7, 1
  ecall
  
  la a0, str2
  li a7, 4
  ecall
  
  add a0, s9, zero  # print value
  li a7, 1
  ecall
  
  la a0, str3
  li a7 4
  ecall
  
  ret
  
  
  
