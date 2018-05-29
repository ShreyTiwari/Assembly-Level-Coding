//Matrix multiplication :

#include<stdio.h>
#include<stdlib.h>

void main()
{
	int a,b,c,d,i,j,k;
	int x[10][10],y[10][10],z[10][10];
	printf("Enter the order of the matrix : ");
	scanf("%d %d",&a,&b);
	printf("enter the order of the matrix : ");
	scanf("%d %d",&c,&d);
	
	if(b!=c)
	{
		printf("Invaild input .");
		exit(0);
	}
	printf("Enter the elements of matrix 1 : \n");
	for(i = 0; i < a; i++)
	{
		for(j = 0;j<b;j++)
		{
		scanf("%d",&x[i][j]);	
		}
	}
	
	printf("Enter the elements of matrix 2 : \n");
	for(i = 0;i<c;i++)
	{
		for(j = 0;j<d;j++)
		{
		scanf("%d",&y[i][j]);	
		}
	}
	
	int sum = 0;
	
	for(int i = 0; i < a; ++i)
	{
		for(int j = 0; j < d; ++j)
		{
			sum = 0;
			for(int k = 0; k < b; ++k) sum = sum + x[i][k] * y[k][j];
			z[i][j] = sum;
		}	
	}
	
	for(i = 0;i<a;i++)
	{
		for(j = 0;j<d;j++)
		{
		printf("%d  ",z[i][j]);	
		}
		printf("\n");
	}
}

