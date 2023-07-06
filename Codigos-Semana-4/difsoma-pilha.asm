.data

.text
# s7 = y
main:
	addi a0, zero, 2  # argumento 0 = 2
	addi a1, zero, 3  # argumeno 1 = 3
	addi a2, zero, 4  # argumeno 2 = 4
	addi a3, zero, 5  # argumento 3 = 5
	
	li t0, 22  #valores definidos a serem usados após o retorno de difsoma
	li t1, 33
	li t2, 44
	
	jal  difsoma  # chamar função
	add  s7, a0, zero # y = valor retornado
	
	add s7, s7, s3  # resultado final: s7+ s3 + t0 + t1 = -4 + 22 + 33 + 44= 95
	add s7, s7, t0
	add s7, s7, t1
	
	
	li a7, 10  #encerrar execução
    ecall


# a0 = resultado
difsoma:
  addi sp, sp, -12      # alocar espaço na pilha                  
                        # para armazenar 3 registradores
  sw   t0, 8(sp)        # salvar t0 na pilha
  sw   t1, 4(sp)        # salvar t1 na pilha
  sw   t2, 0(sp)        # salvar t2 na pilha
  
  add  t0, a0, a1       # t0 = f + g
  add  t1, a2, a3       # t1 = h + i
  sub  t2, t0, t1       # result = (f + g) − (h + i)
  add  a0, t2, zero     # colocar valor de retorno em a0
  
  lw   t0, 8(sp)        # restaurr s3 da pilha
  lw   t1, 4(sp)        # restaurr t0 da pilha
  lw   t2, 0(sp)        # restaurr t1 da pilha
  addi sp, sp, 12       # desalocar espaço da pilha   
  
  jr   ra               # retornar ao caller
