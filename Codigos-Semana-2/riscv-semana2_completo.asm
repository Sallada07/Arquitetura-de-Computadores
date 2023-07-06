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
       lui s1, 0x45a1f  # 0100 0101 1010 0001 1111
       addi s1, s1, 0x1b7  # 1100
       
       addi s2, zero, 0xff
       slli s2, s2, 8
       addi s2, s2, 0xff
       slli s2, s2, 16
       
       addi s3, zero, 0
       addi s4, zero, 0
       addi s5, zero, 0
       
       andi s5, t2, -1484
       ori  s6, t3, -1484
       xori s7, t3, -1484
       
       sll t0, t1, t2
       srl t0, t1, t2
       sra t0, t1, t2
       
       slli t0, t1, 23
       srli t0, t1, 18
       srai t0, t1, 5


       ######## PARTE D: -Instruções de acesso à memória (lw, sw)
       lui s0, 0xFEDC8
       addi s0, s0, 0x765
       
       lui s0, 0xFEDC9    # s0 = 0xFEDC9000
       addi s0, s0, -341  # s0 = 0xFEDC9000 + 0xFFFFFEAB
                          # = 0xFEDC8EAB 

       la t1, memDados  # la: instrução para armazenar em t1 o endereço de um dado na memória de dados.
       lw s3, 8(t1)     # immediato representado em bytes, cada palavra tem 4 bytes
                        # logo ele pula 2 palavras a partir do endere�o da em t1
       lw s4, 0(t1)
       lw s5, 4(t1)
       
       sw s1, 40(t1)
       sb s1, 48(t1)
       sb s1, 47(t1)
       sb s1, 46(t1)
       sb s1, 45(t1)
       sb s1, 44(t1)
       #sw s1, 46(t1) # Erro, a palavra ultrapassa o limite do 32bit
       
	
       ######## PARTE E: -Programação: desvio condicional (if-then, if-then-else)
       addi s0, zero, 4    # s0 = 0 + 4 = 4
       addi s1, zero, 1    # s1 = 0 + 1 = 1
       slli s1, s1, 2      # s1 = 1 << 2 = 4
       beq s0, s1, target  # desvio tomado
       addi s1, s1, 1      # n�o executado
       sub s1, s1, s0      # n�o executado    
target: # label
       add s1, s1, s0      # s1 = 4 + 4 = 8
       
       addi s0, zero, 4  # s0 = 0 + 4 = 4
       addi s1, zero, 1  # s1 = 0 + 1 = 1
       slli s1, s1, 2    # s1 = 1 << 2 = 4
       bne s0, s1, tgt   # desvio N�O tomado
       addi s1, s1, 1    # s1 = 4 + 1 = 5
       sub s1, s1, s0    # s1 = 5 � 4 = 1
tgt:
       add s1, s1, s0    # s1 = 1 + 4 = 5
       
       j trg           # jump to target
       srai s1, s1, 2  # n�o executado
       addi s1, s1, 1  # n�o executado
       sub s1, s1, s0  # n�o executado
trg:
       add s1, s1, s0  # s1 = 1 + 4 = 5

# s0 = f, s1 = g, s2 = h
# s3 = i, s4 = j
# IF
       bne s3, s4, L1  # if (i == j)
       add s0, s1, s2  #    f = g + h;
L1:
       sub s0, s0, s3  # f = f � i;
# IF COM ELSE
       bne s3, s4, L2  # if (i == j)
       add s0, s1, s2  #    f = g + h;
       j endifelse
L2:                    # else: 
       sub s0, s0, s3  #    f = f � i;
endifelse:

       
       ######## PARTE F: -Programação: loops (for, while)
       # s0 = pow, s1 = x
       addi s0, zero, 1      # int pow = 1;
       add s1, zero, zero    # int x = 0;
       addi t0, zero, 128    #
while:
       beq s0, t0, endwhile  # while (pow != 128) {
       slli s0, s0, 1        #    pow = pow * 2;
       addi s1, s1, 1        #    x = x + 1;
       j while               # )
endwhile:
        
       # s0 = i, s1 = sum
       addi s1, zero, 0    # int sum = 0;
       add s0, zero, zero  # int i = 0;
       addi t0, zero, 10   
for:
       beq s0, t0, endFor  # for (i=0; i!=10; i = i+1) {
       add s1, s1, s0      #    sum = sum + i;
       addi s0, s0, 1      # }
       j for               
endFor:


       # Exit program
       li a7, 10
       ecall
       
