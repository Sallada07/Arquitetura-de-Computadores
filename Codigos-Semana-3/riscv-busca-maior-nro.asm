# riscv-busca-maior-nro.asm
# Procura o maior nro em um vetor de 10 nros inteiros
#
# int busca_maior()
# {
#    int maior = vetor[0];
#    for (int i=1; i<N; i++) {
#      if (vetor[i] > maior)
#          maior = vetor[i];
#    }
#    printf("Maior nro=  %d \n", maior);
# }

.data
N: .word  10
vetor: .word 14, 56, 12, 777, 12, 801, 99, 3209, 13, 43
str1: .string "Maior numero = "


.text
busca_maior:
	la a5, vetor # a5 = &vetor
	lw a0, 0(a5) # a0 (maior) = vetor[0]
	li a1, 1 # a1 (i) = 1
	lw t4, N
for:
	bge a1, t4, fimloop # if i >= 10, fim do loop
	slli t1, a1, 2 # t1 = i * 4
	add t2, a5, t1 # t2 = &vetor + i*4
	lw t3, 0(t2) # t3 = vetor[i]
	blt t3, a0, proximo # se vetor[i] < maior, then proximo
	mv a0, t3 # Atualizar maior
proximo:
	addi a1, a1, 1 # i = i+1
	j for
fimloop:

# Imprimir resultados no console  (argumentos em a0 e a1)
        
        jal ra, printResultado

fimPrograma:
        li a7, 10
        ecall


# --- printResultado ---
# a0: Contém o valor do maior nro do vetor
printResultado:
        mv t0, a0
        
        la a0, str1
        li a7, 4
        ecall
        
        mv a0, t0
        li a7, 1
        ecall
        
        ret
      
 ## ---- fim de printResultado -----------
        
