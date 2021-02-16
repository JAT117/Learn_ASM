#include <stdio.h>



void determ(int matrix[3][3])
{
    int D = 0; // temp for storing determinant
    D = (matrix[0][0]*matrix[1][1]*matrix[2][2] + matrix[0][1]*matrix[1][2]*matrix[2][0] + matrix[0][2]*matrix[1][0]*matrix[2][1] - matrix[0][0]*matrix[1][2]*matrix[2][1] - matrix[0][1]*matrix[1][0]*matrix[2][2] - matrix[0][2]*matrix[1][1]*matrix[2][0]);
    //this equation is to calculate the determinant of input argument
    printf("%d\n", D); //finally printing result to the user
}


int main()
{
    int matrix[3][3], matrixT[3][3]; //declaring two empty matrix with size 3*3
    int i, j; //i and j for for loop to enter matrix values

    for(i=0;i<3;i++) // for row
        for(j=0;j<3;j++)//for column
        {
            printf("Matrix element of Row:%d  Column:%d \n",i,j); //asking user to enter elements of matrix
            scanf("%d", &matrix[i][j]);  // elements are being stored in the matrix
        }

    for(i = 0; i < 3; i++) //get the transpose of a
        for(j = 0; j < 3; j++)
        {
            matrixT[j][i] =  matrix[i][j];
        }

    printf("The determant of given matrix is:");
    determ(matrix); // Calling determ function for given matrix determinant


    printf("The determant of transposed matrix is:");
    determ(matrixT); // Calling determ function for transpose matrix determinant


    return 0;
}

