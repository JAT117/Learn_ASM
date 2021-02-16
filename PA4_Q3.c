#include <stdio.h>
#include <math.h>

int main(void)
{
	int a,n;
	double x, result = 0;               // Declaring variables to use in the program

	printf("value of x = ");            // asking user for value of 'x'
	scanf("%lf", &x);                   // scanning 'x'
	printf("value of a = ");            // asking user for value of 'a'
	scanf("%d", &a);                    // scanning 'a'

	for(n=0;n<=a;n++)                  // for loop to find the exponent value
	{
        int i;                          // Declaring variables to use in the program
		double fact = 1.0, power =  1.0;

		for(i=1;i<=n;i++)               // for loop for factorial
		{
            power = power * x;          // finding the numerator
            fact = fact * i;            // finding denominator
		}
		
		                                // dividing both Numerator and Denominator
		result += power/fact;           // keep adding all the terms in series
	}

	printf("Result = %0.15f\n", result);   // printing 15 fraction values of result
}
