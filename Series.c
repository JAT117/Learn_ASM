#include <stdio.h>

//program to find x^a using recursion

int Series(int x, int a)
{
	int sum;
	if (a == 0) //testing if a is zero
	{
		return 0; // if a=0, than return 0
	}
    sum = x + x * Series(x, a - 1); // calling function recursively to find the result
	return sum;
}


int main()
{
	int x, a,y;

	printf("Value of x = ");
	scanf("%d", &x); //user input for x

	printf("Value of a = ");
	scanf("%d", &a);//user input for a

	y = Series(x, a); //calling series function to find summation

	printf("\n The result = %d\n", y+1); //printing the result with a^0

    return 0;
}

