swap(int v[], int k)
{
	int temp;
	temp = v[k];
	v[k] = v[k + 1];
	v[k + 1] = temp;
}

//X0 v
//X1 k
//X9 temp


swap:
	//First step is to get ze address of V[k] by multiplyin by 8 via left shift

    LSL X10,X1, #3		//X10 = k * 8
	ADD X10, X0, X10	//X10 = v + (k * 8)
						//which makes reg X10 have the address of v[k]


	// Now load v[k] using X10

	LDUR X9, [X10, 0]	//X9_temp = v[k]

	//Load v[K+1] by adding 8 to reg X10

	LDUR X11, [X10, 8]	//X11 = v[k+1]
						//refers to next element of v

	STUR X11, [X10, 0]	//v[k] =  X11 (v[k+1])
	STUR X9, [X10, 8]	//v[k+1] = X9_temp (v[k])

	BR LR				//Returns to calling procedure