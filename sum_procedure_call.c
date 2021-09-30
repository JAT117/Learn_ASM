// function prototype

long long int sum(long long int n, long long int acc)
{
	if (n > 0)
		return sum(n - 1), acc + n);
	else
		return acc;
}

//X0 sum
//X1 acc
//X2 n result of the call

sum: 
     SUBS XZR, X0, XZR  // compare n to 0 
	 B.LE sum_exit      // go to sum_exit of n <= 0  (X0 <= 0)
	 ADD X1, X1, X0     // add n to sum
	 SUBI X0, X0, #1    // subtact 1 from n
	 B sum				// go to sum

sum_exit:
	ADD X2, X1, XZR     // return value of acc
	BR LR               // return to calle