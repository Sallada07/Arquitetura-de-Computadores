#include <stdio.h>
#include <stdlib.h>

int buscaMaior(int vetor[], int tamanho)
 {
    // 2 variáveis locais: maior, i.
    
    
    int maior = -999;
    int i;
    
    for (i=0; i<tamanho; i++) {
      if (vetor[i] > maior)
          maior = vetor[i];
    }
    
    return maior;
 }


int main()
 {
    // 3 variáveis locais: valores (10 words), N, maiorEncontrado
    
    int valores[10]= {4, 5, 7, 12, 654, 2, 78, 22, 8, 16};
    int N=10;
    int maiorEncontrado;
    
    maiorEncontrado= buscaMaior(valores, N);
    
    printf("Maior valor encontrado=  %d \n", maiorEncontrado);
 }