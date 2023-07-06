# riscv-f2c-simples.asm

.data
grausF: .word  85
grausC: .word 0
str1:     .string "Graus Celsius =  "
str2:     .string "Graus Celsius =  "
pulaLinha: .string "\n"

.text
main:
   lw  t0, grausF # t0=F
        
   li t5,32       # t5=32
   sub t1, t0, t5 # t1=F-32


   li t5, 5       # t5=5
   mul t1, t1, t5 # t1=(F-32)*5  
   

   li t5, 9       # t5=9
   div t1, t1, t5 # t1=(F-32)*5/9
        
        
   la t3, grausC
   sw t1, 0(t3)
        
  
        # Imprimir resultados no console  (argumentos em a0 e a1)
        lw  a0, grausF
        lw  a1, grausC
        jal ra, printResultado

        # Exit program
        li a7, 10
        ecall


# --- printResultado ---
# a0: Graus F
# a1: Graus C
printResultado:
        mv t0, a0
        mv t1, a1
       
        
        la a0, str1
        li a7, 4
        ecall
        
        mv a0, t0
        li a7, 1
        ecall
        
        la a0, pulaLinha
        li a7, 4
        ecall
        
        la a0, str2
        li a7, 4
        ecall
        
        mv a0, t1
        li a7, 1
        ecall
              
        ret
        
