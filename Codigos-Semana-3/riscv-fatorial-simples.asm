# riscv-fatorial-simples.asm
# Cálculo do Fatorial de um número N
#
# Versão simplificada, SEM USO DE PILHA / STACK POINTER : 
#  1- Lê N armazenado na memória
#  2- Cálcula fatorial N
#  3- imprime msg com resulto
#



.data
N: 	  .word 5
str1:     .string "Valor do Fatorial de  "
str2:     .string " = "

.text
main:
        lw  t0, N   # t0= N
        li  t1, 1   # t1= 1 - valor inicial do fatorial a ser calculado
        

fat:        
        mul t1, t1, t0    # t1= t1*N
        addi t0, t0, -1   # t0= t0 -1
        bgt  t0, zero, fat


        # Imprimir resultados no console  (argumentos em a0 e a1)
        lw  a0, N
        mv  a1, t1
        jal ra, printResultado

        # Exit program
        li a7, 10
        ecall


# --- printResultado ---
# a0: Valor de N
# a1: Resultado do Fatorial
printResultado:
        mv t0, a0
        mv t1, a1
        
        la a0, str1
        li a7, 4
        ecall
        
        mv a0, t0
        li a7, 1
        ecall
        
        la a0, str2
        li a7, 4
        ecall
        
        mv a0, t1
        li a7, 1
        ecall
        
        ret
        
