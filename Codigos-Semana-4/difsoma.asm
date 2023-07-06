.data

.text
# s7 = y
main:
	addi a0, zero, 2  # argumento 0 = 2
	addi a1, zero, 3  # argumento 1 = 3
	addi a2, zero, 4  # argumento 2 = 4
	addi a3, zero, 5  # argumento 3 = 5
	jal  difsoma  # chamar função
	add  s7, a0, zero # y = valor retornado
	
	li a7, 10  #encerrar execução
    ecall


# a0 = resultado
difsoma:
	add  t0, a0, a1   # t0 = f + g
	add  t1, a2, a3   # t1 = h + i
	sub  t2, t0, t1   # resultado = (f + g) − (h + i)
	add  a0, t2, zero # colocar valor de retorno em a0
	jr   ra           # retornar ao caller
	