# riscv-semana2.asm
# Trechos de código da aula teórica da semana 2
# Objetivos: 
#    -Entender o funcionamento do computador simplificado
#    -Contato inicial com programação assembly RISC-V
#


.data
memDados: .word  0,1,25,3,4,5,6,7,8,9

.text
main:

       ######## PARTE A: - Instruções adição / subtração:
       #Inicialização de registradores
       addi t1, zero, 0
       addi t2, zero, 5 
       addi t3, zero, 36
       addi t4, zero, 4
       
       
       
       add t1, t2, t3
       
       sub t1, t2, t3
       
       
       add t1, t2, t3  
       sub t1, t1, t4
       
       
       ######## PARTE B: - Instruções multiplicação / divisão
       #Inicialização de registradores
       addi s1, zero, 100
       addi s2, zero, 60 
       addi s3, zero, 20
       addi s4, zero, 15
       
       #Instruções multiplicação / divisão
       
       mul s3, s1, s2
       mulh s4, s1, s2 
       
       div  s3, s1, s2  # s3 = s1/s2
       rem  s4, s1, s2  # s4 = s1%s2




	######## PARTE C: -Instruções Lógicas (and, or, xor)
	
	
	
	
	######## PARTE D: -Instruções de acesso à memória (lw, sw)
	la t1, memDados  # la: instrução para armazenar em t1 o endereço de um dado na memória de dados.
	lw s3, 8(t1) 
	
	
	
	
	######## PARTE E: -Programação: desvio condicional (if-then, if-then-else)
	
	
	
	
	######## PARTE F: -Programação: loops (for, while)




        


        # Exit program
        li a7, 10
        ecall


