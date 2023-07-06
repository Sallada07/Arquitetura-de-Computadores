# sum10(10,20,30,40,50,60,70,80,90,100);
.data

.text

main:
li a0, 10 # 1st parameter
li a1, 20 # 2nd parameter
li a2, 30 # 3rd parameter
li a3, 40 # 4th parameter
li a4, 50 # 5th parameter
li a5, 60 # 6th parameter
li a6, 70 # 7th parameter
li a7, 80 # 8th parameter     
addi sp, sp, -8 # Allocate stack space
li t1, 100 # Push the 10th parameter
sw t1, 4(sp)
li t1, 90 # Push the 9th parameter
sw t1, 0(sp)
jal sum10 # Invoke sum10
addi sp, sp, 8 # Deallocate the parameters from stack  

li a7, 1  #imprimir resultado da soma retornado em a1 - SOMA= 550
ecall
 
#fimPrograma:
  li a7, 10
  ecall

sum10:
lw t1, 0(sp) # Loads the 9th parameter into t1
lw t2, 4(sp) # Loads the 10th parameter into t2
add a0, a0, a1 # Sums all parameters
add a0, a0, a2
add a0, a0, a3
add a0, a0, a4
add a0, a0, a5
add a0, a0, a6
add a0, a0, a7
add a0, a0, t1
add a0, a0, t2 # Place return value on a0
ret # Returns
