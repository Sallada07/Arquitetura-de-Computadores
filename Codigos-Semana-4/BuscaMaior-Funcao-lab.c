#include <stdio.h>
#include <stdlib.h>


 void reincializaVetor(int vetor[], int tamanho, int novoValor)
 {
    // 1 variável local:  i.
    
    
    int i;
    
    for (i=0; i<tamanho; i++) {
      vetor[i]= novoValor;
    }
    
 }



int buscaMaior(int vetor[], int tamanho)
 {
    // 2 variáveis locais: maior, i.
    
    
    int maior = -999;
    int i;
    
    for (i=0; i<tamanho; i++) {
      if (vetor[i] > maior)
          maior = vetor[i];
    }
    
    reincializaVetor(vetor, tamanho, maior);
    
    return maior;
 }
 
 



int main()
 {
    // 3 variáveis locais: valores (10 words), N, maiorEncontrado
    
    int valores[10]= {4, 5, 7, 12, 654, 2, 78, 22, 8, 16};
    int N=10;
    int maiorEncontrado;
    int i;
    
    maiorEncontrado= buscaMaior(valores, N);
    
    printf("Maior valor encontrado=  %d \n", maiorEncontrado);
    
    for (i=0; i<N; i++)
        printf("%d  ", valores[i]);
 }


