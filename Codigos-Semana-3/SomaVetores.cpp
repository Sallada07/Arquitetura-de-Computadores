#include<stdio.h>

// Vetore declarados como variáveis globais:
int VA[10]= {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
int VB[10]= {0, 100, 200, 300, 400, 500, 600, 700, 800, 900};
int VC[10]= {-1, -1, -1, -1, -1, -1, -1, -1, -1, -1};

int main()
{
	int i;
	int N=10;
	
	for (i=0; i<N; i++)
		VC[i]= VA[i] + VB[i];
		
	for (i=0; i<N; i++)
		printf("VC[%d] = %d \n", i, VC[i]);
		
	return 0;
} 
