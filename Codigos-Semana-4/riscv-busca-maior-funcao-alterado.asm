# riscv-busca-maior-função.asm
# Função p/ procurar o maior nro em um vetor de 10 nros inteiros, passado por referência
# Mostra o uso de passagem de parÃ¢metros por referência e por valor, valor de retorno, variárveis locais
#

.data
str1: .string "vetor["
str2: .string "] = "
str3: .string "\n"
str4: .string "Maior valor encontrado = "

.text

# --- main -------------------------------------------------

main:

	li t1, -1	  # Topo máximo
 	sw t1, 0(sp)
 	
	addi sp, sp, -48  # Alocar espaço na pilha para array de 10 posições de inteiros, N, maior_encontrado
 	
 	mv a0, sp 	  # a0 = endereço de veto: parâmetro 1 de buscaMaior
 	li t1, 4	  # Inicialização do vetor "valores" armazenado na pilha, como variável local da função main
 	sw t1, 0(sp)
 	li t1, 5
 	sw t1, 4(sp)
 	li t1, 7
 	sw t1, 8(sp)
 	li t1, 12
 	sw t1, 12(sp)
 	li t1, 654
 	sw t1, 16(sp)
 	li t1, 2
 	sw t1, 20(sp)
 	li t1, 78
 	sw t1, 24(sp)
 	li t1, 22
 	sw t1, 28(sp)
 	li t1, 8
 	sw t1, 32(sp)
 	li t1, 16
 	sw t1, 36(sp)
 	
 	
 	li t1, 10     # Inicialização da variável  "N", armazenada na pilha, como variável local da função main
 	sw t1, 40(sp)
 	mv a1, t1     # a1 = parâmetro 2 de buscaMaior
 	
 	li t1, -999   # Inicialização da variável local a main, "maiorEcontrado", armazenada na pilha da função main
 	sw t1, 44(sp)
 	
 	jal buscaMaior   # comando C correspondente: maiorEncontrado= buscaMaior(valores, N);
 	
 	mv t1, a0         # atualiza na memória o valor da variável local "maiorEcontrado", com o valor retornado
 	sw t1, 44(sp)

 	# Imprimir resultados no console  (argumento em a0)
	jal ra, printResultado
	
	mv a0, sp  # a0 = endereço do vetor -> Parâmetro 1 da função printVetor
	# Imprimir vetor no console  (argumentos em a0 e a1)
	jal ra, printVetor
     
 	addi sp, sp, 48 # Desalocar área da pilha usada por main

fimPrograma:
        li a7, 10
        ecall


# --- buscaMaior -------------------------------------------------
# Parâmetros de entrada: a0: endereço do vetor, a1: tamanho do vetor 
buscaMaior:
	addi sp, sp, -12  # Alocar espaço na pilha 2 variáveis locais a buscaMaior: maior, i
	
	li t1, -999   # Var local "maior" - Inicialização com o -999 
 	sw t1, 0(sp)  # Armazenar maior na pilha, como variável local de buscaMaior
 	 	
 	li t2, 0      # Var local "i" - InicializaÃ§Ã£o c/ 1 e armazenar na pilha
 	sw t2, 4(sp)
 	
 	sw ra, 8(sp)  # Salva o endereço de retorno para o final dessa função
		
for1:
	bge t2, a1, endfor1 # if i >= 10, fim do loop
	slli t3, t2, 2      # t3 = i * 4
	add t4, a0, t3      # t4= &vetor + i*4
	lw t5, 0(t4)        # t5 = vetor[i]

	blt t5, t1, next1   # se vetor[i] < maior, then proxima interaÃ§Ã£o
	
	mv t1, t5           # senÃ£o, atualizar maior com novo valor encontrado no vetor
	sw t1, 0(sp)        # atualiza o valor de maior na memÃ³ria - Comando C correspondente: maior = vetor[i];
next1:
	addi t2, t2, 1   # i= i+1
	sw t2, 4(sp)     # atualiza o valor de i na memória - Comando C correspondente: for (i=0; i<tamanho; i++) {
	j for1           # próxima interação do loop
endfor1:
	
	mv a2, t1   # maior valor encontrado em a2
	
	jal reinicializaVetor
	
	mv a0, a2        # maior valor encontrado retorna em a0
	
	lw ra, 8(sp)     # Restaura o endereço de retorno
	addi sp, sp, 12  # Desalocar área da pilha usada por buscaMaior
	ret              # retorna p/ função main

# --- reinicializaVetor --------------------------------------------
# Parâmetros de entrada: 
#	a0: endereço do vetor       (vetor)
#	a1: tamanho do vetor        (tamanho)
#	a2: maior valor encontrado  (novoValor)
reinicializaVetor:
	addi sp, sp, -8  # Espaço para uma variável local "i" e o ra
	
	li t1, 0    
	sw t1, 0(sp)  # i = 0
	sw ra, 4(sp)  # salvo o endereço de retorno
	
for2:
	bge  t1, a1, endfor2  # if i >= 10, fim do loop
	slli t2, t1, 2        # t2 = i*4 
	add  t3, a0, t2       # t3 = &vetor + i*4
	sw   a2, 0(t3)        # vetor[i] = novoValor
next2:
	addi t1, t1, 1
	sw   t1, 0(sp)
	j    for2
endfor2:
	
	lw ra, 4(sp)    # Restaura o endereço de retorno
	addi sp, sp, 8  # Desalocar área da pilha usada por reinicializaVetor
	ret             # retorna p/ função buscaMaior

# --- printResultado --------------------------------------
# a0: Contêm o valor do maior nro do vetor
printResultado:
        mv t0, a0
        # Primeira parte da string
        la a0, str4
        li a7, 4
        ecall
        # print value
        mv a0, t0
        li a7, 1
        ecall
        # Pula linha
  	la a0, str3
  	li a7 4
  	ecall
        
        ret
      
# ---- fim de printResultado -----------
        
# --- printVetor ------------------------------------------
# a0: Contêm o endereço do vetor
# a1: Contém o tamanho do vetor
printVetor:
	addi sp, sp, -12  # Espaço para "i", a0 e o ra
	li t1, 0
	sw t1, 0(sp)      # i = 0
	sw a0, 4(sp)      
	sw ra, 8(sp)      
for3:
	bge  t1, a1, endfor3  # if i >= 10, fim do loop
	lw   t2, 4(sp)        # t2 = &vetor
	slli t3, t1, 2        # t3 = i*4 
	add  t4, t3, t2       # t4 = &vetor + i*4
	# Primeira parte da string
	la a0, str1
  	li a7, 4
  	ecall
  	# print index
  	addi a0, t1, 0  
  	li a7, 1
  	ecall
        # Segunda parte da string
  	la a0, str2
  	li a7, 4
  	ecall
  	# print value
  	lw a0, 0(t4)  
  	li a7, 1
  	ecall
	# Pula linha
  	la a0, str3
  	li a7 4
  	ecall
next3:
	addi t1, t1, 1
	sw   t1, 0(sp)
	j    for3
endfor3:

	lw ra, 8(sp)
	addi sp, sp, 12
	ret
      
# ---- fim de printVetor -----------
