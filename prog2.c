/*
John Todd

prog2.c

Programming Assignment #2 (First Program)
CSCE 2610 001
Summer 2016
Assembly Language and Computer Organization


C code  finding user inputed numbers and calculating the sum, mean, median, and range
Using unsigned 64 bit long long integers, except range and median.

*/


#include <stdio.h>

int main(void)
{
	int  i, j, k, n, temp, range, median;			 // int variables we need
	unsigned long long int array[50], sum = 0, mean; // these are long data types

	printf("Enter the number of inputs 'n' \n");
	scanf("%d", &n);
	printf("Enter the elements one by one \n");

	for (i = 0; i < n; i++)
	{
		scanf("%llu", &array[i]);
	}


	/*   Bubble Sort, to help make it easier to find what we are looking for */

	for (i = 0; i < n; i++)
	{
		for (j = 0; j < (n - i - 1); j++)
		{
			if (array[j] > array[j + 1])
			{
				temp = array[j];
				array[j] = array[j + 1];
				array[j + 1] = temp;
			}
		}
	}

	printf("Sorted array is...\n");

	for (i = 0; i < n; i++)

	{
		printf("%llu\n", array[i]);   // print off the array for visual aid
		sum += array[i];				  // add up the sum of the array elements
		mean = sum / n;				  // mean is the average (sum/ # elements in array)
		range = (array[i] - array[0]);// last elemented in (sorted) array minus first
		median = range / 2;			  // range divided by two
	}

	printf("Sum:%llu\n", sum);
	printf("Mean:%llu\n", mean);
	printf("Median:%d\n", median);
	printf("Range:%d\n", range);
	return;
}
